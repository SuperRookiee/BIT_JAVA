<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String userId = request.getParameter("userId");
String color = request.getParameter("color");
/* if(userId.isEmpty()){
	RequestDispatcher rd = request.getRequestDispatcher("./loginForm.jsp");
	rd.forward(request, response);
	return;
} */
if(color.equals("붉은색")){ 
%>
<style>
body{
background-color: red;
}


</style>
<%	
}
%>

<%
if(color.equals("파란색")){ 
%>
<style>
body{
background-color: blue;
}
</style>
<%	
}
%>
<%
if(color.equals("흰색")){ 
%>
<style>
body{
background-color: white;
}
</style>
<%	
}
%>

</head>
<body>
<h1>If-else Example</h1>
<%out.print("<b>"+userId+"</b>"+"님이 좋아하는 색깔은 "+"<b>"+color+"</b>"+"입니다.");%>


</body>
</html>