<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String ID = (String)session.getAttribute("userId");
%>
<%=ID %>님 안녕하세요<br>
<%session.setAttribute("ID", ID); %>
<a href="updateFrm.jsp">회원정보 수정</a>
</body>
</html>