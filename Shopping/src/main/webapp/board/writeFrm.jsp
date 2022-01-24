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
		<h1 class="display-3">게시판</h1>
	</div>
</div>

<div class="container">
	<form name="newWrite" action="writeProc.do" class="form-horizontal" method="post" onsubmit="return checkForm()">
		
		<div class="form-group row">
			<label class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-3">
				<input name="userId" type="text" class="form-control" placeholder="${userId}" value="${userId}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-5">
				<input name="title" type="text" class="form-control" placeholder="제목을 입력하세요">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-5">
				<textarea name="content" type="text" class="form-control" placeholder="내용을 입력하세요"  style="height:200px;"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-success" value="등록">
				<input type="reset" class="btn btn-danger" value="취소">			
			</div>
		</div>
	</form>
</div>

<%@ include file="/footer.jsp" %>

<script type="text/javascript">
	function checkForm(){
		if(!document.newWrite.title.value){
			alert("제목을 입력하세요.");
			return false;
		}
		if(!document.newWrite.content.value){
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>

</body>
</html>