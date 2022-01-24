<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>
include전 name 패러미터 : <%=request.getParameter("name") %>
<hr>
<jsp:include page="body_sub.jsp" flush="false">
	<jsp:param name="name" value="장미"/>
</jsp:include>
</hr>
include후 name 패러미터 : <%=request.getParameter("name") %>
</body>
</html>