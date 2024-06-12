package com.koreaIT.jsp.am;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.koreaIT.jsp.am.util.DBUtil;
import com.koreaIT.jsp.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/delete")
public class ArticleDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		final String URL = "jdbc:mysql://localhost:3306/jsp_am?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";
	    final String USER = "root";
	    final String PASSWORD = "";
	    
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			SecSql sql = new SecSql();
			sql.append("delete from article"); 
			sql.append("where id = ?", id);
			
			DBUtil.delete(connection, sql); 
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().append(String.format("<script>alert('%d번 게시물이 삭제되었습니다.'); location.replace('list');</script>", id));
			
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
