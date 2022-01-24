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

if(request.getParameter("loginChk") == null) { // 체크한 경우
	Cookie cookie = new Cookie("id", userId);
	cookie.setMaxAge(60 * 60);
	response.addCookie(cookie);
}

if(userId.equals("admin")&& userPwd.equals("1234")){
	session.setAttribute("userId", userId);
	session.setAttribute("userPwd", userPwd);
	out.println("로그인에 성공했음");
	
	
%>
	<br><a href="loginFrm.jsp">로그인 폼으로</a>
<%

} else{
	out.println("<script>alert('아이디 혹은 비밀번호 불일치'); history.back(); </script>");
}
%>
</body>
</html>