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
		<h1 class="display-3">Wellcome</h1>
	</div>
</div>
<div class="container">
	<div align="center">
		<div class="col-md-13">
			<%
			String complelte = (String) session.getAttribute("complelte");
			String userName = (String) session.getAttribute("userName");
			String joinCom = (String) session.getAttribute("joinCom");
			
			if(complelte != null && joinCom == null){
				if(complelte.equals("on") ){
				%>
					<div class="alert alert-danger" align="center">
						${userName}님 환영합니다
					</div>	
					<!-- <a href="">홈으로</a> -->
				<%
				}
			}
			else if(complelte == null && joinCom != null){
				if(joinCom.equals("joinCom")){
					
				%>
					<div class="alert alert-danger" align="center"> 
						${userName}님, 가입이 완료되었습니다.
					</div>	
					<!-- <a href="">홈으로</a> -->
				<%
				}
			}
			%>
		</div>
	</div>
</div>

<%@ include file="/footer.jsp"%>

</body>
</html>