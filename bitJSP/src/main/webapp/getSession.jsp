<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
session.setAttribute("userId", "rose");
out.println((String) session.getAttribute("userId"));
out.println((String) session.getAttribute("userPwd"));
%> --%>

<%-- <%
session.setAttribute("userId", "rose");
session.setAttribute("userPwd", "1234");
String name, value; int i=0;
Enumeration en = session.getAttributeNames();
while(en.hasMoreElements()){
	i++;
	name=(String)en.nextElement();
	value=(String)session.getAttribute(name);
	out.println("설정된 세션의 속성 이름["+i+"]: "+name+"<br>");
	out.println("설정된 세션의 속성 값["+i+"]: "+value+"<br>");
}	
%> --%>

<%-- %
session.setAttribute("userId", "rose");
session.setAttribute("userPwd", "1234");
out.println(session.getAttribute("userId"));
out.println(session.getAttribute("userPwd")+"<br>");
session.removeAttribute("userPwd");
out.println(session.getAttribute("userId"));
out.println(session.getAttribute("userPwd"));
%> --%>

<%-- <h3>---세션 유효 시간 변경 전---</h3>
<%
int time = session.getMaxInactiveInterval()/60;
out.println("세션 유효 시간: "+time+"분<br>");
session.setMaxInactiveInterval(60*60);
%>
<h3>---세션 유효 시간 변경 후---</h3>
<%
time = session.getMaxInactiveInterval()/60;
out.println("세션 유효 시간: "+time+"분<br>");
%> --%>

<%
String sessionId = session.getId();
long lastTime = session.getLastAccessedTime();
long startTime = session.getCreationTime();
long lapse = (lastTime-startTime)/1000/60;
out.println("세션 아이디: "+sessionId+"<br>");
out.println("요청 시작 시간: "+startTime+"<br>");
out.println("요청 마지막 시간: "+lastTime+"<br>");
out.println("웹사이트 경과 시간: "+lapse+"분<br>");
%>


</body>
</html>