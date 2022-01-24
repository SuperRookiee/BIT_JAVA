<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%response.setCharacterEncoding("UTF-8");%>
body_sub에서 name 패러미터 값: <%=request.getParameter("name") %>
<br> name 패러미터 값 목록:
<ul>
<%
String[] names = request.getParameterValues("name");
for(String name : names){
%>
<li> <%=name %></li>
<%} %>
</ul>
</body>
</html>