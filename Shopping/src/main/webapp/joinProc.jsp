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
String userName = request.getParameter("name");
String phoneNo = request.getParameter("phoneNo");
String address = request.getParameter("address");
String email = request.getParameter("email");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager. getConnection(url, dbId, dbPwd);
	
	sql = "INSERT INTO Members(userId, userPwd, userName, phoneNo, address, email) values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	pstmt.setString(2, userPwd);
	pstmt.setString(3, userName);
	pstmt.setString(4, phoneNo);
	pstmt.setString(5, address);
	pstmt.setString(6, email);
	pstmt.executeUpdate();
	
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}
finally{
	conn.close();
}

session.setAttribute("userName", userName);
session.setAttribute("joinCom", "joinCom");
%>
<jsp:forward page="resultMember.jsp"/>


</body>
</html>