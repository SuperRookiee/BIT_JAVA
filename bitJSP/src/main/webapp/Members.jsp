<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ page import="org.global.beans.Members" %>
<body>
<%
Members mem = new Members();
mem.setUserId("conan");
mem.setName("코난");
%>
이름 : <%=mem.getName() %>
,아이디 : <%=mem.getUserId() %>
</body>
</html>