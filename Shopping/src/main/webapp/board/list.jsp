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
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<%@ include file="/menu.jsp" %>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">게시판</h1>
	</div>
</div>
<div class="container">
	<form action="<c:url value="/board/listProc.do"/>" method="post">
		<div><div class="text-right">
			<span class="badge badge-warning">게시글 수: <strong> ${counts} / ${count} </strong></span>
		</div></div>
		<div style="padding-top: 50px">
		<table class="table table-hover"> <!-- //게시글 출력부분 생략 -->
			<tr><th>번호</th><th>제목</th><th>작성일</th><th>조회</th><th>글쓴이</th></tr>
			<c:forEach var="lists" items="${list}">
				<tr>
					<td>${lists.getBoardNo()}</td>
					<td><a href="${contextPath}/board/viewProc.do?userId=${lists.getUserId()}&boardNo=${lists.getBoardNo()}">${lists.getTitle()}</a></td>
					<td>${lists.getRegDate()}</td>
					<td>${lists.getHit()}</td>
					<td>${lists.getUserId()}</td>
				</tr>
			</c:forEach>
			<table><tr>
				<td width="100%" align="left"> &nbsp; &nbsp;
					<select name="items" class="txt">
						<option value="title">제목에서</option>
						<option value="content">본문에서</option>
						<option value="userId">글쓴이에서</option>
					</select>
					<input name="text" type="text"/>
					<input type="submit" id="btnAdd" class="btn btn-danger" value="검색"/>
					</td>
					<td width="100%" align="right">
						<a href="#" onclick="checkForm(); return false;" class="btn btn-info">&laquo; 글쓰기</a>
					</td>
				</tr>
			</table>
		</table>
	</form>
</div>

<%@ include file="/footer.jsp"%>

<script type="text/javascript">
	var uid = '<%=(String)session.getAttribute("userId")%>';
	function checkForm(){
		if(uid=="null"){
			alert("로그인을 해주세요!");
		}
		//로그인 하지 않은 경우, alert 팝업
		else{
			location.href ="<%=request.getContextPath() %>/board/writeFrm.jsp"; //로그인 한 경우, 글쓰기 페이지로 이동
		}
	}
</script>



</body>
</html>