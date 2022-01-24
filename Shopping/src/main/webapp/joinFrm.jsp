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
		<h1 class="display-3">회원가입</h1>
	</div>
</div>
<div class="container">
	<div align="center">
		<jsp:useBean id="member" scope="request" class="beans.Members"/>
		<!-- <form action="./joinProc.jsp" method="post"> -->
		<form action="./joinProc.jsp" method="post">
		<h3>회원 정보를 입력하세요</h3> <br><br>
			<table>
				<tr>
					<td colspan="4"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="userId">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="text" name="userPwd">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name"> 
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="phoneNo">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="address"> 
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" class="btn btn-outline-success" value="회원가입" >
		</form>
	</div>
</div>

<%@ include file="/footer.jsp" %>

</body>
</html>