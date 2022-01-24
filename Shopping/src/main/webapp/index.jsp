<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@ include file="/menu.jsp" %>
</head>
<body>

<%!String greeting = "Welcome to HyunWook's HOME";
String tagline = "내이름은 현욱, 학생이죠";%>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><%=greeting %></h1>
	</div>
</div>
<main role="main">
	<div class="container">
		<div class="text">
			<h3 ><%=tagline %></h3>
		</div>
		<hr>
	</div>
</main>
<%@ include file="/footer.jsp" %>
</body>
</html>