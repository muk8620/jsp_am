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
import java.util.Map;

import com.koreaIT.jsp.am.config.Config;
import com.koreaIT.jsp.am.util.DBUtil;
import com.koreaIT.jsp.am.util.SecSql;


@WebServlet("/article/modify")
public class ArticleModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection connection = null;
		
		try {
			Class.forName(Config.getDBDriverName()); 
			connection = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUsr(), Config.getDBPW());
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			SecSql sql = new SecSql();
			sql.append("select * from article"); 
			sql.append("where id = ?", id);
			
			Map<String, Object> articleMap = DBUtil.selectRow(connection, sql); 
			
			request.setAttribute("articleMap", articleMap);
			request.getRequestDispatcher("/jsp/article/modify.jsp").forward(request, response);
			
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
