<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Book Get</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Book Get
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- <form role="form" action="/book/get" method="get"> -->
                            	<div class="form-group">
                            		<label>Bookid</label><input class="form-control" name="bookid" value='<c:out value="${book.bookid}"/>' readonly="readonly">
                            	</div>
                            	<div class="form-group">
                            		<label>BookName</label><input class="form-control" name="bookname" value='<c:out value="${book.bookname}"/>'>
                            	</div>
                            	<div class="form-group">
                            		<label>Publisher</label><textarea class="form-control" rows="3" name="publisher">${book.publisher}</textarea>
                            	</div>
                            	<div class="form-group">
                            		<label>Price</label><input class="form-control" name="price" value='<c:out value="${book.price}"/>'>
                            	</div>
                            	<button data-oper='modify' class="btn btn-warning" onclick="location.href='/book/modify?bookid=<c:out value="${book.bookid}"/>'">Modify</button>
                            	<button data-oper='list' class="btn btn-success" onclick="location.href='list' "/>List</button>
                            	<form id="operForm" action="/book/modify" method="get">
                            		<input type='hidden' id='bookid' name='bookid' value='<c:out value="${book.bookid}"/>'>
                            	</form>
                            <!-- </form> -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
        </div>
        <!-- /#page-wrapper -->
<<script type="text/javascript">
	$(document).ready(function(){
		var operForm = $("#operForm");
		$('button[data-oper="modify"]').on("click", function(e){
			operForm.attr("action", "/book/modify").submit();
		});
		$('button[data-oper="list"]').on("click", function(e){
			operForm.find("#bookid").remove();
			operForm.attr("action", "/book/list");
			operForm.submit();
		});
	}
</script>    
        
        
<%@include file="../includes/footer.jsp" %>
</body>

</html>
