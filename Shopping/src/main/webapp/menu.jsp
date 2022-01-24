<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<nav class="navbar navbar-expand navbar-dark bg-dark">
      <div class="container">
         <div class="navbar-header">
            <a class="navbar-brand" href="${contextPath}/index.jsp">HOME</a>
         </div>
         <div>
            <ul class="navbar-nav mr-auto">
	            <c:choose>
	            	<c:when test="${empty userId}">
		            	<li class="nav-item"><a class="nav-link" href="${contextPath}/loginFrm.jsp">로그인</a></li>
			            <li class="nav-item"><a class="nav-link" href="${contextPath}/joinFrm.jsp">회원가입</a></li>
	            	</c:when>
	            	<c:otherwise>
	            		<li class="nav-item"><a class="nav-link" href="${contextPath}/index.jsp">${userName}님 </a></li>
	            		<li class="nav-item"><a class="nav-link" href="${contextPath}/logoutProc.jsp">로그아웃</a></li>
			            <li class="nav-item"><a class="nav-link" href="${contextPath}/updateFrm.jsp">회원수정</a></li>
	            	</c:otherwise>
	            	
	            </c:choose>
            </ul>
         </div>
         
         <div>
            <ul class="navbar-nav mr-auto">
               <li class="nav-item"><a class="nav-link" href="${contextPath}/productList.jsp">상품목록</a></li>
               <li class="nav-item"><a class="nav-link" href="${contextPath}/addProduct.jsp">상품등록</a></li>
               <li class="nav-item"><a class="nav-link" href="${contextPath}/cart.jsp">장바구니</a></li>
               <li class="nav-item"><a class="nav-link" href="${contextPath}/board/listProc.do">게시판</a></li>
            </ul>
         </div>
      </div>
   </nav>

</body>
</html>