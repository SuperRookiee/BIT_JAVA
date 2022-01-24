<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Book Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Book Modify
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form role="form" action="/book/modify" method="post">
                            	<div class="form-group">
                            		<label>Bookid</label><input class="form-control" name="bookid" value='<c:out value="${book.bookid}"/>' readonly="readonly">
                            	</div>
                            	<div class="form-group">
                            		<label>Bookname</label><input class="form-control" name="bookname" value='<c:out value="${book.bookname}"/>'>
                            	</div>
                            	<div class="form-group">
                            		<label>Publisher</label><textarea class="form-control" rows="3" name="publisher">${book.publisher}</textarea>
                            	</div>
                            	<div class="form-group">
                            		<label>Price</label><input class="form-control" name="price" value='<c:out value="${book.price}"/>'>
                            	</div>
                            	<button type="submit" data-oper='modify' class="btn btn-primary" >Modify</button>
                            	<button type="submit" data-oper='remove' class="btn btn-danger" >Remove</button>
                            	<button type="submit" data-oper='list' class="btn btn-success" >List</button>
                            </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
        </div>
        <!-- /#page-wrapper -->
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form");
			$('button').on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				console.log(operation);
				if(operation === 'remove'){
					formObj.attr("action","/book/remove");
				}else if(operation === 'list'){
					//move to list
					formObj.attr("action","/book/list").attr("method","get");
					formObj.empty();
				}
				formObj.submit();
			});
		});
	</script>
        
<%@include file="../includes/footer.jsp" %>
</body>

</html>
	