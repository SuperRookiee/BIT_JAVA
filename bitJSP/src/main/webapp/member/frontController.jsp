<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>frontController</title>
</head>
<body>
<a href="<%=request.getContextPath()%>/member/login.action">로그인</a><hr/>
<a href="<%=request.getContextPath()%>/member/insert.action">회원 가입</a><hr/>
<a href="<%=request.getContextPath()%>/member/select.action">회원 조회</a><hr/>
<a href="<%=request.getContextPath()%>/member/update.action">회원 정보 수정</a><hr/>
<a href="<%=request.getContextPath()%>/member/delete.action">회원 삭제</a><hr/>
<a href="<%=request.getContextPath()%>/member/SelectAll.action">모든 회원 보기</a><hr/>
</body>
</html>