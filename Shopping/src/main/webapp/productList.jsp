<%@page import="java.sql.ResultSet"%>
<%@page import="beans.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
//1. JNDI 서버 객체 생성
InitialContext ic = new InitialContext();
//2. lookup()
DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
//3. getConnection()
Connection conn = ds.getConnection();
PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM PRODUCTS");
ResultSet rs = pstmt.executeQuery();
ArrayList<Products> pl = new ArrayList<Products>();
while(rs.next()){
	pl.add(new Products(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8)));
}
rs.close(); pstmt.close(); conn.close();
%>
<%@ include file="/menu.jsp" %>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 목록</h1>
	</div>
</div>
<div class="container">
	<div class="row" align="center">
		<c:set var="list" value="<%=pl%>"/>
		<c:forEach var="item" items="${list}">
			<div class="col-md-4">
				<img id="img" src="./upload/${item.filename}" witdth=200 height=150>
				<h3>${item.proName}</h3>
				<p>${item.unitPrice}원</p>
				<p><a href="./productDetail.jsp?proId=${item.proId}" class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				<p>${item.description}</p>
				<!-- 연습 -->
				<jsp:useBean class="beans.Products" id="Products" scope="application"/>
				<jsp:setProperty name="Products" property="proId"  value="${item.proId}"/>
				<%-- <%=Products.getProId() %> --%>
				<%-- <jsp:getProperty name="Products" property="proId"/> --%>
				<%-- <%request.setAttribute("id", item.proId); %> --%>
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>