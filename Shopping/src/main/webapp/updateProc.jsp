<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
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
request.setCharacterEncoding("UTF-8");

String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");
String userName = request.getParameter("userName");
String phoneNo = request.getParameter("phoneNo");
String address = request.getParameter("address");
String email = request.getParameter("email");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	
	sql = "UPDATE Members SET userPwd=?, userName=?, phoneNo=?, address=?, email=? where userId =? ";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userPwd);
	pstmt.setString(2, userName);
	pstmt.setString(3, phoneNo);
	pstmt.setString(4, address);
	pstmt.setString(5, email);
	pstmt.setString(6, userId);
	pstmt.executeUpdate();
	
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}
finally{
	try {
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

session.setAttribute("userIds", userId);
RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
rd.forward(request, response);
%>
</body>
</html>