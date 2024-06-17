package com.koreaIT.jsp.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import com.koreaIT.jsp.am.config.Config;
import com.koreaIT.jsp.am.util.DBUtil;
import com.koreaIT.jsp.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/member/doLogin")
public class MemberDoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection connection = null;
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			
			Class.forName(Config.getDBDriverName()); 
			connection = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUsr(), Config.getDBPW());
			
			String loginId = request.getParameter("loginId");
			String loginPw = request.getParameter("loginPw");
			
			SecSql sql = new SecSql();
			sql.append("SELECT * from `member`"); 
			sql.append("where loginId = ?", loginId);
			
			Map<String, Object> memberMap = DBUtil.selectRow(connection, sql);
			
			if (memberMap.isEmpty()) {
				response.getWriter().append(String.format("<script>alert('[ %s ]은(는) 존재하지 않는 아이디입니다.'); history.back();</script>", loginId));
				return;
			}
			
			if (!memberMap.get("loginPw").equals(loginPw)) {
				response.getWriter().append(String.format("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>"));
				return;
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("loginedMemberId", memberMap.get("id"));
			session.setAttribute("loginedMemberLoginId", memberMap.get("loginId"));
			
			response.getWriter().append(String.format("<script>alert('%s님 환영합니다.'); location.replace('/home/main');</script>", memberMap.get("name")));
			
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
