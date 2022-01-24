<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Forward Tag Example</h3>
<%String name = request.getParameter("name"); %>
<%=java.net.URLDecoder.decode(name) %>
님의 혈액형은 B형이고 정확한 판단력을 가진 합리준의자이다.
</body>
</html>