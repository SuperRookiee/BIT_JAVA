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
int sum=0;
out.print( "1에서 10까지 합은? " );
for(int i=1; i<=10; i++){
	sum +=i;
	if(i<10)
		out.print(i + " + " );
	else
		out.print(i + " =" );
}
%>	
<%= sum %>

</body>
</html>