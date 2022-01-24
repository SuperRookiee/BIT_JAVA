<%@page import="java.net.*"%>
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
request.setCharacterEncoding("UTF-8");
Cookie shippingCartId = new Cookie("shippingCartId", URLEncoder.encode(request.getParameter("cartId"), "UTF-8"));
Cookie shippingName = new Cookie("shippingName", URLEncoder.encode(request.getParameter("shippingName"), "UTF-8"));
Cookie shippingDate = new Cookie("shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "UTF-8"));
Cookie shippingCountry = new Cookie("shippingCountry", URLEncoder.encode(request.getParameter("shippingCountry"), "UTF-8"));
Cookie shippingZipcode = new Cookie("shippingZipcode", URLEncoder.encode(request.getParameter("shippingZipcode"), "UTF-8"));
Cookie shippingAddress = new Cookie("shippingAddress", URLEncoder.encode(request.getParameter("shippingAddress"), "UTF-8"));

shippingCartId.setMaxAge(24*60*60); shippingName.setMaxAge(24*60*60); shippingDate.setMaxAge(24*60*60); shippingCountry.setMaxAge(24*60*60); shippingZipcode.setMaxAge(24*60*60); shippingAddress.setMaxAge(24*60*60);

response.addCookie(shippingCartId); response.addCookie(shippingName); response.addCookie(shippingDate); response.addCookie(shippingCountry); response.addCookie(shippingZipcode); response.addCookie(shippingAddress);
response.sendRedirect("orderConfirmation.jsp");
%>

</body>
</html>