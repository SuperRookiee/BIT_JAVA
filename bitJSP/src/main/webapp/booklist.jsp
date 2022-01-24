<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.global.beans.*" %>
<%@page import="java.sql.*"%>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String url ="jdbc:mysql://localhost:3306/scottdb?useSSL=false";
String dbId = "scott", dbPwd = "tiger";
Connection conn = null;
String sql = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ArrayList<BookBeans> booklist = new ArrayList<BookBeans>();
%>

<table border="1">
	<tr>
		<td><b>BOOKNAME</b></td>
		<td><b>PUBLISHER</b></td>
		<td><b>PRICE</b></td>
	</tr>
	
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	
	sql = "SELECT*FROM Book";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		booklist.add(new BookBeans(rs.getString(1),rs.getString(2), rs.getString(3), rs.getString(4)));
	}
	%>
		
	<c:set var="booklist" value="<%=booklist%>"/>
	<c:forEach var="item" items="${booklist}">
		<tr>
			<td><a href="bookview.jsp?bookId=${item.bookId}"> ${item.bookname} </a></td>
			<td>${item.publisher}</td>
			<td>${item.price}</td>
		</tr>
	</c:forEach>
	<%
}catch(ClassNotFoundException e){
e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}
finally{
	conn.close();
}
%>
	<tr>
		<td colspan="3" style="text-align: right;">LIST</td>
	</tr>
</table>


</body>
</html>