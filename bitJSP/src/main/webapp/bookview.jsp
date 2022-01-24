<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.sql.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--request.getparameter 이름은 bookid / name을 가지고 비교  -->
<%
String bookid = request.getParameter("bookId");
String url ="jdbc:mysql://localhost:3306/scottdb?useSSL=false";
String dbId = "scott", dbPwd = "tiger";
Connection conn = null;
String sql = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

%>
<table border="1">
<%

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	
	sql = "SELECT*FROM Book where bookid =? " ;
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,Integer.parseInt(bookid));
	rs = pstmt.executeQuery();
	while(rs.next()) {
		%>
		<tr>
			<td>책제목</td>
			<td><%=rs.getString(2)%></td>
		</tr>
		<tr>
			<td>출판사</td>
			<td><%=rs.getString(3)%></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: right;"><a href="booklist.jsp">목록</a></td>
		</tr>
		<%
	}
	
	
}catch(ClassNotFoundException e){
e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}
finally{
	conn.close();
}
%>

</table>


</body>
</html>