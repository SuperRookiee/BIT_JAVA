<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.Products"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//cartList 중 해당 제품만 제거한 다음, cart.jsp로 리다이렉트
String proId = request.getParameter("proId");
ArrayList<Products> products = (ArrayList<Products>) session.getAttribute("cartList");

for(int i=0; i<products.size(); i++){
	if(products.get(i).getProId().equals(proId))
		products.remove(i);
}
RequestDispatcher rd = request.getRequestDispatcher("/cart.jsp");
	rd.forward(request, response);

%>
</body>
</html>