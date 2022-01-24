<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.global.beans.*" %>
<%@page import="java.sql.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String url ="jdbc:mysql://localhost:3306/scottdb?useSSL=false";
String dbId = "scott", dbPwd = "tiger";
Connection conn = null;
String sql = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
%>

<!-- <form action="joinProc01.jsp" method="post"> -->
<form action="joinProc.do" method="post">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="userId"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="userPwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="userName"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="phoneNo"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;"><input type="submit" value="회원가입"></td>
	</tr>
	
	
</table>
</form>


</body>
</html>