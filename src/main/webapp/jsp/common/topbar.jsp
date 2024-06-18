<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int loginedMemberId = (int) request.getAttribute("loginedMemberId");
	String loginedMemberLoginId = (String) session.getAttribute("loginedMemberLoginId");
%>

<% 
if(loginedMemberId == -1) { 
%>
	<div><a href="<%= request.getContextPath() %>/member/join">회원가입</a></div>
	<div><a href="<%= request.getContextPath() %>/member/login">로그인</a></div>
<% } %>

<% 
if(loginedMemberId != -1) { 
%>
	<div><%=loginedMemberLoginId %>님 환영합니다.</div>
	<div><a href="<%= request.getContextPath() %>/member/logout">로그아웃</a></div>
<% } %>