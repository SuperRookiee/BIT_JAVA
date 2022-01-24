<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">로그아웃</h1>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<%
			session.invalidate(); 
			out.println("로그아웃 완료");
			out.println("3초후 메인으로 돌아갑니다");
			%>
			<br><a href="index.jsp">홈 화면으로</a>
			<meta http-equiv="refresh" content="3;url=index.jsp">
		</div>
	</div>
</div>

<%@ include file="/footer.jsp" %>
</body>
</html>