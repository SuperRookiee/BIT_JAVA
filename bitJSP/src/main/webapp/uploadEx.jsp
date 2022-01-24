<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="uploadProc.jsp" method="post" enctype="multipart/form-data">
	<input type="text" name="desc"\/><br>
	<input type="file" name="file"\/><p>
	<input type="submit" value="파일 업로드"/>
</form>
</body>
</html>