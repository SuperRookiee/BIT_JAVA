<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="beans.Products"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String proId = request.getParameter("proId");

//1. JNDI 서버 객체 생성
InitialContext ic = new InitialContext();
//2. lookup()
DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
//3. getConnection()
Connection conn = ds.getConnection();
//커넥션 풀을 이요하여 connection 얻어오는 과정
PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM PRODUCTS WHERE proId = ?");
pstmt.setString(1, proId);
ResultSet rs = pstmt.executeQuery();
Products selectedItem = null;
if(rs.next()){
	selectedItem = new Products(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8));
}
rs.close(); pstmt.close(); conn.close();

ArrayList<Products> cartList = (ArrayList<Products>) session.getAttribute("cartList");
if(cartList ==null){ //세션에 카트리스트가 없으면, 카트 리스트는 선택된 모든 아이템 저장
	cartList = new ArrayList<Products>();
	session.setAttribute("cartList", cartList); // 새로 생성
}
int cnt = 0;
Products orderdItem = new Products(); // 주문 상품
for(int i=0; i< cartList.size(); i++){
	orderdItem = cartList.get(i); // 세션에 추가된 상품을 주문 상품에 추가
	if(orderdItem.getProId().equals(proId)){
		cnt++;
		int orderdQuantity = orderdItem.getQuantity() +1; // 주문 수량 증가
		orderdItem.setQuantity(orderdQuantity);
	}
}
if(cnt == 0){
	selectedItem.setQuantity(1); //최초 주문수량을 1로 설정
	cartList.add(selectedItem); //카트리스트에 추가
}
//해당 삼풍의 상세 페이지로
RequestDispatcher rd = request.getRequestDispatcher("/productDetail.jsp?proId="+proId);
rd.forward(request, response);
%>


</body>
</html>