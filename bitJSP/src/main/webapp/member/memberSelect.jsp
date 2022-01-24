<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.global.beans.*" %>
<%@page import="java.sql.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

MemberDAO dao = MemberDAO.getInstance();

String userId = request.getParameter("userId");

request.setAttribute("selectMember", dao.selectMember(userId));
%>
<h1>회원 정보 조회</h1>
<table border="1">
	<tr>
		<td ><b>아이디</b></td>
		<td ><b>비밀번호</b></td>
		<td ><b>이름</b></td>
		<td ><b>전화번호</b></td>
		<td ><b>주소</b></td>
		<td ><b>이메일</b></td>
		<td ><b>등록일</b></td>
	</tr>
	
	<tr>
		<td >${selectMember.userId}</td>
		<td >${selectMember.userPwd}</td>
		<td >${selectMember.userName}</td>
		<td >${selectMember.phoneNo}</td>
		<td >${selectMember.address}</td>
		<td >${selectMember.email}</td>
		<td >${selectMember.regDate}</td>
	</tr>
</table>
</body>
</html>