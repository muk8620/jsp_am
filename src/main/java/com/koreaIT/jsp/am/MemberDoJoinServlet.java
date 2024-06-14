package com.koreaIT.jsp.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.koreaIT.jsp.am.config.Config;
import com.koreaIT.jsp.am.util.DBUtil;
import com.koreaIT.jsp.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/member/doJoin")
public class MemberDoJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection connection = null;
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			
			Class.forName(Config.getDBDriverName()); 
			connection = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUsr(), Config.getDBPW());
			
			String loginId = request.getParameter("loginId");
			
			SecSql sql = new SecSql();
			sql.append("SELECT count(id) from `member`"); 
			sql.append("where loginId = ?", loginId);
			
			Boolean loginIdDupChk = DBUtil.selectRowBooleanValue(connection, sql);
			
			if (loginIdDupChk) {
				response.getWriter().append(String.format("<script>alert('[%s] 은(는) 이미 존재하는 아이디 입니다.'); history.back();</script>", loginId));
				return;
			}
			
			String loginPw = request.getParameter("loginPw");
			String loginPwChk = request.getParameter("loginPwChk");
			String name = request.getParameter("name");
			
			if (!loginPw.equals(loginPwChk)) {
				response.getWriter().append(String.format("<script>alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.'); history.back();</script>"));
				return;
			}
			
			sql = new SecSql();
			sql.append("INSERT INTO `member`"); 
			sql.append("SET regDate = NOW()");
			sql.append(", updateDate = NOW()");
			sql.append(", loginId = ?", loginId);
			sql.append(", loginPw = ?", loginPw);
			sql.append(", `name` = ?", name);
			
			DBUtil.insert(connection, sql);
			
			response.getWriter().append(String.format("<script>alert('%s회원님 가입 되었습니다.'); location.replace('/home/main');</script>", name));
			
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
