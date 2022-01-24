<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <%@ page import="java.util.*" %>
    
    
    <%@ page import="org.global.beans.BookBean" %>
    <c:set var="name" value="amy"/> <c:out value="${name }"/> <br>
    <c:remove var="name"/> <c:out value="${name}"/> <br>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
BookBean book1 = new BookBean("명탐정 홈즈","코난 도일", "모름");
request.setAttribute("bookOne", book1);
%>
<c:set var="title" value="${bookOne.title}"/> <c:out value="${title}"/>
<c:set var="author" value="<%=book1.getAuthor() %>"/> <c:out value="${author}"/> <hr>
<c:set var="name">Wilde</c:set> <c:out value="${name}"/> <br>
<%
BookBean book2 = new BookBean("도리안 그레이의 초상","오스카 와일드", "모름");
request.setAttribute("bookTwo", book2);
%>
<c:set var="title" value="${bookTwo.title}"/> <c:out value="${title}"/>
<c:set var="author" value="<%=book1.getAuthor() %>"/> <c:out value="${author}"/>

<br>
<% BookBean book = new BookBean();%>
<c:set target="<%=book%>" property="title" value="코스모스"/>
<%=book.getTitle() %> <br>
<c:set var="b" value="<%=book%>"/>
<c:set target="${b}" property="author" value="세이건"/>
${b.author}

<br>
<%String str = request.getParameter("msg"); %>
<c:catch var="e">
<% if(str.equals("add")){
out.print(str);
}%>
</c:catch>
<c:out value="${e}"/>

<br>
<c:set var="num" value="${95}"/>
점수: <c:out value="${num}"/>은
<c:if test="${num>60}"> 합격입니다 </c:if>

<c:choose>
<c:when test="${num>=90}">A학점입니다.</c:when>
<c:when test="${num>=80}">B학점입니다.</c:when>
<c:when test="${num>=70}">C학점입니다.</c:when>
<c:when test="${num>=60}">D학점입니다.</c:when>
<c:otherwise>F학점입니다.</c:otherwise>
</c:choose>

<br><br>
<%
ArrayList<BookBean> bookList = new ArrayList<BookBean>();
bookList.add(new BookBean("명탐정 홈즈","코난 도일","모름"));
bookList.add(new BookBean("도리안 그레이의 초상","오스카 와일드","모름"));
String[] bookCode={"소설", "역사","인문","정치","미술","종교","여행","과학","만화"};
%>

<c:set var="list" value="<%=bookList%>"/>
<c:forEach var="item" items="${list}"> ${item.title}/${item.author}/${item.publisher}<br>
</c:forEach>
<hr>
<c:set var="code" value="<%=bookCode%>" />
<c:forEach var="item" items="${code}"> <c:out value="${item}"/>
</c:forEach>

<br><br>
<c:forEach var="i" begin="2" end="9">
<c:forEach var="j" begin="1" end="9"> ${i }*${j }*${i*j }<br>
</c:forEach>
</c:forEach>
<hr>
<c:forEach var="k" begin="1" end="10" step="2"> ${k }
</c:forEach>

<br><br>
<%-- <c:forTokens [var="varName"] 
items="stringOfTokens" delims="delimiters"
[var="varName"][varStatus="varStatusName"]
[begin="begin"][end="end"][step="step"]>
			몸체
</c:forTokens>
 --%>
<c:forTokens items="소설/역사/인문/정치/미술/종교/여행/과학" delims="/" var="token">${token }</c:forTokens>






</body>
</html>