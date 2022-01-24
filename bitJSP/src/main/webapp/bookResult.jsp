<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.global.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
책아이디: <b>${book.bookId}</b>
<br>

책제목: <b>${book.bookname}</b>
<br>

출판사: <b>${book.publisher}</b>
<br>

가격: <b>${book.price}</b>

</body>
</html>