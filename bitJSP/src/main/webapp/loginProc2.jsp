<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

if(userId.equals("admin")&& userPwd.equals("1234")){
	out.println("로그인에 성공했음");
	session.setAttribute("userId", userId); %>
	<br><a href="loginChk.jsp">로그인 정보 확인</a>
	
<%
} else{
	out.println("<script>alert('비밀번호 불일치'); history.back(); </script>");
	/* out.println("로그인에 실패했음"); */
}
%>

</body>
</html>