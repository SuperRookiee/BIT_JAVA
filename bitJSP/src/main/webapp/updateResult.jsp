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
String userId = (String)session.getAttribute("userIds");
%>
<%=userId %>정보 수정이 정상적으로 되었습니다.<br>
<a href="logoutProc.jsp">로그아웃</a>
&nbsp
<a href="updateFrm.jsp">정보수정</a>
</body>
</html>