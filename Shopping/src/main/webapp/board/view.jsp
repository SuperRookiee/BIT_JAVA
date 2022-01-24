<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		<h1 class="display-3">게시판</h1>
	</div>
</div>

<div class="container">
	<form name="newWrite" action="${contextPath}/board/viewProcupdate.do?boardNo=${listboardNo}" class="form-horizontal" method="post" onsubmit="return checkForm()">
		<div class="form-group row">
			<label class="col-sm-2 control-label">성명</label>
			<div class="col-sm-3">
				<input name="userId" type="text" class="form-control" placeholder="${listuserId}" value="${listuserId}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-5">
				<input name="updatetitle" type="text" class="form-control" value="${listtitle}" onfocus="this.value=''">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-5">
				<textarea name="updatecontent" type="text" class="form-control" placeholder="${listcontent}"  style="height:200px;"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-3 col-sm-10">
			<%
			if(request.getAttribute("listuserId").equals(session.getAttribute("userId"))) {%>
				<input onClick="location.href='${contextPath}/board/viewProcdelete.do?boardNo=${listboardNo}';" type="button" class="btn btn-danger" value="삭제">		
				<input type="submit" class="btn btn-success" value="수정">	
				<input onClick="location.href='${contextPath}/board/listProc.do';" type="button" class="btn btn-primary" value="목록">		
			<%}
			else{%>
				<input  onClick="location.href='${contextPath}/board/listProc.do';" type="button" class="btn btn-primary" value="목록">	
			<%
			}
			%>	
			</div>
		</div>
	</form>
</div>

<%@ include file="/footer.jsp" %>

<script type="text/javascript">
	function checkForm(){
		if(!document.newWrite.updatetitle.value){
			alert("제목을 입력하세요.");
			return false;
		}
		/* if(!document.newWrite.updatecontent.value){
			alert("내용을 입력하세요.");
			return false;
		} */
	}
</script>
</body>
</html>