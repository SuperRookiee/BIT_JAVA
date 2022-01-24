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

request.setAttribute("list", dao.selectMemberAll());
%>
<h1> 모든 회원 정보 조회</h1>
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
	
	<c:forEach var="list" items="${list}">
		<tr>
			<td >${list.userId}</td>
			<td >${list.userPwd}</td>
			<td >${list.userName}</td>
			<td >${list.phoneNo}</td>
			<td >${list.address}</td>
			<td >${list.email}</td>
			<td >${list.regDate}</td>
		</tr>
		
	</c:forEach>
	
	
</table>
</body>
</html>