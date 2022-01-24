<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
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
		<h1 class="display-3">주문 완료</h1>
	</div>
</div>

<%
request.setCharacterEncoding("UTF-8");
String shippingCartId = "";
String shippingName = "";
String shippingDate = "";
String shippingCountry = "";
String shippingZipcode = "";
String shippingAddress = "";

Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String name = thisCookie.getName();
		if(name.equals("shippingCartId"))
			shippingCartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		if(name.equals("shippingName"))
			shippingName = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		if(name.equals("shippingDate"))
			shippingDate = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		if(name.equals("shippingCountry"))
			shippingCountry = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		if(name.equals("shippingZipcode"))
			shippingZipcode = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		if(name.equals("shippingAddress"))
			shippingAddress = URLDecoder.decode(thisCookie.getValue(), "utf-8");
	}
}
%>
<div class="container">
	<h2 class="alert alert-danger">주문해주셔서 감사합니다</h2>
	<p>주문은<%=shippingDate%>에 배송될 예정입니다.
	<p>주문번호 : <%=shippingCartId%>
	<p>이름 : <%=shippingName%>
</div>
<div class="container">
	<p><a href="productList.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
</div>
<%
//세션에서 카트 제거
session.removeAttribute("cartList");


//쿠키들 제거
if(cookies != null){
	Cookie c1 = new Cookie("shippingCartId", null) ;
	Cookie c2 = new Cookie("shippingName", null) ;
	Cookie c3 = new Cookie("shippingDate", null) ;
	Cookie c4 = new Cookie("shippingCountry", null) ;
	Cookie c5 = new Cookie("shippingZipcode", null) ;
	Cookie c6 = new Cookie("shippingAddress", null) ;
	 
	c1.setMaxAge(0) ;
    response.addCookie(c1);
    
    c2.setMaxAge(0) ;
    response.addCookie(c2);
	
    c3.setMaxAge(0) ;
    response.addCookie(c3);
	
    c4.setMaxAge(0) ;
    response.addCookie(c4);
	
    c5.setMaxAge(0) ;
    response.addCookie(c5);
	
    c6.setMaxAge(0) ;
    response.addCookie(c6);
}
%>


<%@ include file="/footer.jsp"%>
</body>
</html>