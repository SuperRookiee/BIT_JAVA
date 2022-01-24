<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<table border='1'>
		<thead>
			<tr>
				<th>Bookid</th>
				<th>BookName</th>
				<th>Publisher</th>
				<th>Price</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="lists" items="${list}">
            	<tr>
                    <td>${lists.bookid}</td>
                    <td><a href="get?bookid=${lists.bookid}">${lists.bookname}</a></td>
                    <td class="center">${lists.publisher}</td>
                    <td class="center">${lists.price}</td>
                </tr>
           	</c:forEach>
		</tbody>
	</table>
	
	
	
	<script>
		
	</script>
	
</body>
</html>