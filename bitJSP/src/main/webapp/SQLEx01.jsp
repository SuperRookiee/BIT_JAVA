<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>   
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

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	
	sql = "SELECT*FROM BOOK";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	/* sql = "INSERT INTO Book VALUES(?,?,?,?)"; */
	/* sql = "UPDATE BOOK SET BOOKNAME='도리안그레이' WHERE BOOKID=100"; */
	sql = "DELETE FROM BOOK WHERE BOOKID=79";
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	
	%>
	<table border="1">
		<tr>
			<td><b>BOOKID</b> </td>	
			<td><b>BOOK NAME</b> </td>	
			<td><b>PUBLISHER</b></td>	
			<td><b>PRICE</b></td>
		</tr>
	<% 
	while(rs.next()) {
	%>
		<tr>
			<td><%=rs.getString(1) %></td>	
			<td><%=rs.getString(2) %></td>	
			<td><%=rs.getString(3) %></td>	
			<td><%=rs.getString(4) %></td>	
		</tr>
	<%	
	}
	%>	
	</table>
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


</body>
</html>