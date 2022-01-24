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
<%@ include file="/menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">회원정보 수정</h1>
	</div>
</div>
<div class="container">
	<div class="row" align="center">
		<div class="col-md-6">
			<%
			String url ="jdbc:mysql://localhost:3306/scottdb?useSSL=false";
			String dbId = "scott", dbPwd = "tiger";
			Connection conn = null;
			String sql = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			request.setCharacterEncoding("UTF-8"); 
			
			String userId ="";
			String userPwd ="";
			String userName ="";
			String phoneNo ="";
			String address ="";
			String email ="";
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, dbId, dbPwd);
				
				String ID = (String)session.getAttribute("userId");
				sql = "SELECT*FROM Members where userId='"+ ID +"'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					userId = rs.getString(1);
					userPwd = rs.getString(2);
					userName = rs.getString(3);
					phoneNo = rs.getString(4);
					address = rs.getString(5);
					email = rs.getString(6);
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
			
			<form action="updateProc.jsp" method="post">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userId" value=<%=userId %> readonly></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userPwd" value=<%=userPwd %>></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName" value=<%=userName %>></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phoneNo" value=<%=phoneNo %>></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address" value=<%=address %>></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value=<%=email %>></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input type="submit" value="수정하기" ></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>