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
		<h1 class="display-3">로그인</h1>
	</div>
</div>
<div class="container">
	<div align="center">
		<form action="./loginProc.jsp" method="post">
			<br>
			<table>
				<tr>
					<td><strong>ID :</strong></td>
					<td>
						<input type="text" name="userId">
					</td>
				</tr>
				<tr>
					<td><strong>PW :</strong></td>
					<td>
						<input type="password" name="userPwd">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인" class="btn btn-outline-info ">
			
		</form>
	</div>
</div>

<%@ include file="/footer.jsp" %>

</body>
</html>