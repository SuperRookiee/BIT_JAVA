<%@page import="java.util.ArrayList"%>
<%@page import="beans.Products"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String cartId = session.getId(); // 세션 아이디
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
		if(name.equals("shippingCarId"))
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
<%@ include file="/menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">주문 정보</h1>
	</div>
</div>

<div class="container col-8 alert alert-info">
	<div class="text-center"><h1>영수증</h1></div>
	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송주소</strong>
			<br>이름: <%=shippingName%>
			<br>우편번호: <%=shippingZipcode%>
			<br>주소: <%=shippingAddress%>(<%=shippingCountry%>) <br>
		</div>
		<div class="col-4" align="right">
		<p><em>배송일: <%=shippingDate%></em></div>
	</div>
	
	<div>
		<table class="table table-hover">
			<tr>
				<th class="text-center">상품</th><th class="text-center">#</th> <th class="text-center">가격</th><th class="text-center">소계</th>
			</tr>
			
			<!--화면에 필요한 데이터 처리  -->
			<%
	//카트리스트에 저장된 제품들의 가격,수량,소계 등 출력
	int sum = 0;
	ArrayList<Products> products = (ArrayList<Products>) session.getAttribute("cartList");
	if(products != null){
		for(Products product : products){
			int total = product.getUnitPrice() * product.getQuantity();
			sum += total;
%>
			<tr>
				<td class="text-center"><em><%=product.getProName() %></em></td>
				<td class="text-center"><%=product.getQuantity() %></td>
				<td class="text-center"><%=product.getUnitPrice() %></td>
				<td class="text-center"><%=total %>원</td>
			</tr>
		<%}	
	}%>
		<tr>
			<td></td><td></td>
			<td class="text-right"><strong>총액: </strong></td>
			<td class="text-center text-danger"><strong><%=sum %>원</strong></td>
		</tr></table>
		<a href="shippingInfo.jsp?cartId=<%=shippingCartId %>" class="btn btn-secondary" role="button">이전</a>
		<a href="thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
		<a href="checkoutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		
	</div>
</div>


<%@ include file="/footer.jsp"%>
</body>
</html>