<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./loginProc.do" method="post">
	ID : <input type="text" name="userId"><br>
	비밀번호 : <input type="password" name="userPwd"><br>
	<input type="submit" value="로그인">
</form>


<!-- <form action="sessionEx1.jsp" method="post"> -->
<%-- <%String id = "";
Cookie[] cookies = request.getCookies(); //쿠키생성
if(cookies !=null)
for (int i = 0; i < cookies.length; i++){
	if (cookies[i].getName().equals("id")) { // 내가 원하는 쿠키명 찾아서 값 저장
		id = cookies[i].getValue();
	}
}%>

관리자 로그인
<form action="LoginProc01.jsp" method="post">
	ID : <input type="text" name="userId" value ="<%=id %>"/> <input type="checkbox" id="loginChk" value="true"/>아이디 기억
	<br>
	PW : <input type="password" name="userPwd"/>
	<input type="submit" value="전송"/>
</form> --%>
</body>
</html>