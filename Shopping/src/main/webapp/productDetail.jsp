<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="beans.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/menu.jsp" %>
<jsp:useBean id="Products" class="beans.Products" scope="application"/>

<%-- <jsp:getProperty name="Products" property="proId"/> --%>

<%
/* String id = Products.getProId(); */
String id = request.getParameter("proId");

//1. JNDI 서버 객체 생성
InitialContext ic = new InitialContext();
//2. lookup()
DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
//3. getConnection()
Connection conn = ds.getConnection();
PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM PRODUCTS WHERE proId = ?");
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();

Products pl = new Products();
while(rs.next()){
	pl = new Products(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8));
}
/* String root = request.getContextPath();
String real = root+"/"+"imges" */
request.setAttribute("product", pl);
rs.close(); pstmt.close(); conn.close();
%>

<c:set var="item" value="${item}"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 상세정보</h1>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<img id="img" src="./upload/${product.filename}" width=500>
		</div>
		<div class="col-md-6">
		<h1>${product.proName}</h1>
		<p>
			${product.description}
		</p>
		<p>
		<b>상품코드:</b> <span class="badge badge-danger">${product.proId}</span>
		</p>
		<p>
		<b>제조사:</b>${product.manufacturer}
		</p>
		<p>
		<b>분류:</b> ${product.category}
		</p>
		<p>
		<b>재고 수:</b> ${product.noOfStock}
		</p>
		<h2>${product.unitPrice} 원</h2>
		<p>
		<!-- 중략 -->
		<form name="addForm" action="addCart.jsp?proId=${product.proId}" method="post">
			<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
			<a href="cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
			<a href="productList.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
			
		</form>
	</div>
</div>
</div>
<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>

<%@ include file="/footer.jsp" %>
</body>
</html>