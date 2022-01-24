<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.global.beans.*" %>
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
%>
<jsp:forward page="joinResult.jsp"/>

<%-- <jsp:useBean id="member" scope="application" class="org.global.beans.Member"/>
<jsp:setProperty name="member" property="*"/>


사용자가 입력한 데이터
<table border="1">
	<tr>
		<td >아이디</td>
		<td ><%=userId%></td>
		
		<td >암호</td>
		<td ><%=userPwd %> </td>
	</tr>
	<tr>
		<td >이름</td>
		<td ><%=userName %></td>
		
		<td >전화번호</td>
		<td ><%=phoneNo %></td>
	</tr>
	<tr>
		<td >주소</td>
		<td ><%=address %></td>
		
		<td >이메일</td>
		<td ><%=email %></td>
	</tr>
</table>

<hr>

테이블에서 읽어온 데이터
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	
	sql = "SELECT*FROM Members";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		%>
		<table border="1">
			<tr>
				<td >아이디</td>
				<td ><%=rs.getString(1) %></td>
				
				<td >암호</td>
				<td ><%=rs.getString(2) %></td>
			</tr>
			<tr>
				<td >이름</td>
				<td ><%=rs.getString(3) %></td>
				
				<td >전화번호</td>
				<td ><%=rs.getString(4) %></td>
			</tr>
			<tr>
				<td >주소</td>
				<td ><%=rs.getString(5) %></td>
				
				<td >이메일</td>
				<td ><%=rs.getString(6) %></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td colspan="3" style="text-align: center;"><%=rs.getString(7) %></td> 
			</tr>
		</table>
		<br>
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
%> --%>



</body>
</html>