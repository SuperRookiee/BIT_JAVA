<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- <%@page buffer="none" %> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%response.sendError(404,"요청 페이지를 찾을 수 없음");%> --%>
<%-- <%response.sendError(500,"실행 오류 발생");%> --%>

<%
int total = out.getBufferSize();
out.print("첫번째 텍스트");
out.clearBuffer();
out.print("출력버퍼 크기:"+total);
out.print("<br>사용되지 않은 버퍼 크기:" +out.getRemaining());
out.flush();
out.print("<br>flush 후 버퍼 크기:" +out.getRemaining());
%>
<hr>
<h3>out.print()메소드</h3>
<%
out.print(10);
out.print(true);
out.print("aaa");
out.print('가');
out.print(new java.io.File("/"));
out.print("버퍼의 크기:"+out.getRemaining());
%>
<!-- 페이지 지시자를 이용하여 버퍼 크기 변경 후 다시 실행하기 -->

</body>
</html>