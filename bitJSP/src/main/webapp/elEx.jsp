<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setAttribute("cnt", 3); %>
<%= request.getAttribute("cnt")%>
${cnt}
<hr>
<%
String[] strArray = {"1","2","3"};
List<String> list = Arrays.asList(strArray);
request.setAttribute("list", list);
%>
<%= ((List)request.getAttribute("list")).get(0)%>
${list[0]}
<hr>
<%
Map<String, String> map = new HashMap<String,String>();
map.put("name","코난");
request.setAttribute("map", map);
%>
<%= ((Map)request.getAttribute("map")).get("name")%>
${map.name}
<hr>
Literal: ${"Literals"}
<br> Operation : ${5>3}
<br> Implicit Object : ${header["host"]}
<hr>
<%request.setAttribute("name","conan"); %>
요청 URI:${pageContext.request.requestURI}<br>
request의 name: ${requestScope.name} <br>
code 패러미터: ${param.code}
<hr>
<h3>EL 표기법</h3>
${param.id}/${param.pwd} <br>
${param["id"]}/${param["pwd"]} <br>
<hr>

<h3>JSP</h3>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");%>
<%=id %>/<%=pwd %>

<h3>JSP</h3>
<%
Enumeration<String> list2= request.getHeaderNames();
while(list2.hasMoreElements()){
	String key = list2.nextElement();
	out.print("<br>"+key+":"+request.getHeader(key));
}
%>
<hr>
<h3>EL</h3>
${header }

</body>
</html>