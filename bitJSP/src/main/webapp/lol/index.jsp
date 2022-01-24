<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">

	<tr>
		<td colspan="2"><jsp:include page="./include/top.jsp" flush="false"/>
		</td>
	</tr>
	
	<tr>
		<td rowspan="2"><jsp:include page="./include/menu.jsp" flush="false"/>
		 </td>
	</tr>
	
	<tr>
		<td> 
			<%String target = request.getParameter("target");
				if(target == null){%>
					<jsp:include page="main.jsp" flush="false"/>
				<%
				}
				else{
					target+=".jsp";%>
					<jsp:include page="<%=target %>" flush="false"/>
				<%} %>
				
				
			
		</td>
	</tr>
	
	<tr>
		<td colspan="2"><jsp:include page="./include/bottom.jsp" flush="false"/> </td>
	</tr>
	
</table>

</body>
</html>