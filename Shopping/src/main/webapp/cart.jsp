<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.Products"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String cartId = session.getId();
%>
<%@ include file="/menu.jsp" %>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">장바구니</h1>
	</div>
</div>

<div class="container">
	<div class = "row">
		<table width="100%">
			<tr>
				<td align="left"><a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a></td>
			</tr>
		</table>
	</div>
	<br>
	<div style="padding-top":50px">
	<table class="table talbe-hover">
		<tr><th>상품</th><th>가격</th><th>수량</th><th>소계</th><th>비고</th></tr>
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
			<td><%=product.getProId()%>-<%=product.getProName()%></td>
			<td> <fmt:formatNumber value="<%=product.getUnitPrice()%>" pattern="#,###"/>원</td>
			<td><fmt:formatNumber value="<%=product.getQuantity()%>" pattern="#,###"/></td>
			<td><fmt:formatNumber value="<%=total%>" pattern="#,###"/>원</td>
			<td><a href="removeCart.jsp?proId=<%=product.getProId() %> " class="badge badge-danger">삭제</a></td>
		</tr>
			
<%
		}
	}
%>
		<tr><th></th><th></th><th>총액</th><th><fmt:formatNumber value="<%=sum%>" pattern="#,###"/>원</th><th></th></tr>
	</table>
	<a href="productList.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
</div>
	
</div>


<%@ include file="/footer.jsp" %>
</body> 

</html>