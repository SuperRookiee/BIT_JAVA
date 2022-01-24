<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! int count = 0; %>
<%@ include file="header.jsp" %>
<%
count++;
out.println(count+"번째 방문입니다");
%>
<hr>
본문임
<hr>
<%@ include file="footer.jsp" %>
</body>
</html>