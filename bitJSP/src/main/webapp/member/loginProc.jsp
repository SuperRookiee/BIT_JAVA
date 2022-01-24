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
<% request.setCharacterEncoding("UTF-8"); %>

<%if(request.getMethod().equals("POST")){ %>
<%
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

if(userId.isEmpty() || userPwd.isEmpty()){
	RequestDispatcher rd = request.getRequestDispatcher("loginForm.jsp");
	rd.forward(request,response);
}


String url ="jdbc:mysql://localhost:3306/scottdb?useSSL=false";
String dbId = "scott", dbPwd = "tiger";
Connection conn = null;
String sql = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	
	sql = "SELECT * FROM Members where userId ="+userId;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		if(userId.equals(rs.getString(1)) && userPwd.equals(rs.getString(2))){
			if(session.isNew() || session.getAttribute("userId")==null){
			session.setAttribute("userId", userId);
			out.print("로그인 완료");
			}else{
				out.print("이미 로그인 상태입니다.");
			}
			session.setAttribute("userId", userId);
			
			%><jsp:forward page="loginResult.jsp"/><%
		}
		else{
			response.sendRedirect("loginForm.jsp");
		}
		
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
아이디 : <%= userId %> / 비밀번호 : <%= userPwd %> 
<%session.setAttribute("userId", userId); %>
<jsp:forward page="loginResult.jsp"/>
<%
} else if(request.getMethod().equals("GET")){
	if(session != null || session.getAttribute("userId")==null){
		session.invalidate(); out.print("로그아웃 작업이 완료됨");
	}else {out.print("현재 로그인 상태가 아님");
	}
}
%>

</body>
</html>