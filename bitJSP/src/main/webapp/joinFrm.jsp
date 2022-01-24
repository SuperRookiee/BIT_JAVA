<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" scope="request" class="org.global.beans.Members"/>
<!-- <form action="./joinProc.jsp" method="post"> -->
<form action="./joinProc.do" method="post">
	<table border="1">
		<tr>
			<td colspan="4">회원가입정보</td>
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
		<tr>
			<td colspan="4" style="text-align: center;"><input type="submit" value="회원가입" ></td>
		</tr>
	</table>
</form>
</body>
</html>