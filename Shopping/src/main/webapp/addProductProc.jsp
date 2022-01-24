<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="beans.Products"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String path = application.getRealPath("/upload");
int size = 1024*1021*10; //10M

try{
	MultipartRequest multi = new MultipartRequest(request, path, size,"UTF-8", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String name = (String) files.nextElement();
	String orgFile = multi.getOriginalFileName(name);
	String proId = multi.getParameter("proId");
	String proName = multi.getParameter("proName");
	int unitPrice = Integer.parseInt(multi.getParameter("unitPrice"));
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	int noOfStock = Integer.parseInt(multi.getParameter("noOfStock"));
	//1. JNDI 서버 객체 생성
	InitialContext ic = new InitialContext();
	//2. lookup()
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	//3. getConnection()
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Products(proId,proName,unitPrice,description,manufacturer,category,noOfStock,fileName) values(?,?,?,?,?,?,?,?)");
	pstmt.setString(1, proId);
	pstmt.setString(2, proName);
	pstmt.setInt(3, unitPrice);
	pstmt.setString(4, description);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, category);
	pstmt.setInt(7, noOfStock);
	pstmt.setString(8, orgFile);
	pstmt.executeUpdate();

	pstmt.close(); conn.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
<%@ include file="/menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">주문 완료</h1>
	</div>
</div>
<div class="container" align="center">
	제품 등록이 완료 되었습니다
	<br>
	<a href="index.jsp" class="btn btn-secondary" role="button">홈으로 돌아가기</a>
</div>
<%@ include file="/footer.jsp"%>
</html>