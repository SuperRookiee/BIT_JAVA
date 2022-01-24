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
<form action="BookReg" method="POST">
	책 아이디: <input type="text" name="bookId"><br>
	책제목: <input type="text" name="bookname"><br>
	출판사: <input type="text" name="publisher"><br>
	가격: <input type="text" name="price"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>