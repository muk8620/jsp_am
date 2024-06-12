package com.koreaIT.jsp.am;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.koreaIT.jsp.am.util.DBUtil;
import com.koreaIT.jsp.am.util.SecSql;

@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		final String URL = "jdbc:mysql://localhost:3306/jsp_am?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";
	    final String USER = "root";
	    final String PASSWORD = "";
	    
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
			
			int cPage = 1;

			if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
				cPage = Integer.parseInt(request.getParameter("page"));
			}
			
			int itemsInAPage = 10;
			
			int limitFrom = (cPage - 1) * itemsInAPage;
			
			SecSql sql = new SecSql();
			sql.append("select count(id) from article");
			
			int totalCnt = DBUtil.selectRowIntValue(connection, sql);
			
			int totalPageCnt = (int) Math.ceil((double) totalCnt / itemsInAPage);
					
			sql = new SecSql();
			sql.append("select * from article");
			sql.append("order by id DESC");
			sql.append("limit ?, ?", limitFrom, itemsInAPage);
			
			List<Map<String, Object>> articleListMap = DBUtil.selectRows(connection, sql);
			
			request.setAttribute("cPage", cPage);
			request.setAttribute("totalPageCnt", totalPageCnt);
			request.setAttribute("articleListMap", articleListMap);
			
			request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
			
        } catch (SQLException e) {
        	System.out.println("에러 : " + e);
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
            if (connection != null) {
            	try {
            		connection.close();
            	} catch (SQLException e) {
            		e.printStackTrace();
            	}
            }
        }
	}

}
