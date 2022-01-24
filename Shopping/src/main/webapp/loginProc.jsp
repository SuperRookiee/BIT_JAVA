<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>  
<%@page import="javax.naming.InitialContext"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 try {
         request.setCharacterEncoding("utf-8");
      } catch (UnsupportedEncodingException e1) {
         // TODO Auto-generated catch block
         e1.printStackTrace();
      }
      String sql="";
      InitialContext ic;
      String userId = null;
      String userPwd = null;
      String userName = null;
      try {
         ic = new InitialContext();
         DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
         String userIds = request.getParameter("userId");
         sql="select userId,userPwd,userName from Members where userId =?";
         Connection conn = ds.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userIds);
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()) {
            userId = rs.getString(1);
            userPwd = rs.getString(2);
            userName = rs.getString(3);
            session.setAttribute("userId", userId);
            session.setAttribute("userPwd", userPwd);
            session.setAttribute("userName", userName);
        	
            if(request.getParameter("userId").equals(userId) &&request.getParameter("userPwd").equals(userPwd)) {
            	session.setAttribute("complelte", "on");
               	RequestDispatcher rd = request.getRequestDispatcher("resultMember.jsp");
               try {
                  rd.forward(request, response);
               } catch (ServletException e) {
                  e.printStackTrace();
               }
            }else {
            	session.setAttribute("complelte", "on");
               	RequestDispatcher rd = request.getRequestDispatcher("resultMember.jsp");
               
               try {
                  rd.forward(request, response);
               } catch (ServletException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
               }
            }
         }
         rs.close();
         conn.close();
      }catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
   
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
%>
</body>
</html>