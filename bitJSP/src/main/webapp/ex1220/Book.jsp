<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
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
int n = Integer.parseInt(request.getParameter("val"));

InitialContext ic;
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
	ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	conn = ds.getConnection();
	pstmt = conn.prepareStatement("select * from Book where BOOKID="+n);
	rs = pstmt.executeQuery();

	while (rs.next()) {
		out.print(rs.getString(1)+" : "+rs.getString(2));
	}
	conn.close();
	pstmt.close();
	rs.close();
	
} catch (SQLException e) {
	System.out.println(e.getMessage());
	e.printStackTrace();
} catch (NamingException e) {
	System.out.println(e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>