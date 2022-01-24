<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Book Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Book Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form role="form" action="/book/register" method="post">
                            	<div class="form-group">
                            		<label>BookName</label><input class="form-control" name="bookname">
                            	</div>
                            	<div class="form-group">
                            		<label>Publihser</label><textarea class="form-control" rows="3" name="publihser"></textarea>
                            	</div>
                            	<div class="form-group">
                            		<label>Price</label><input class="form-control" name="price">
                            	</div>
                            	<button type="submit" class="btn btn-primary">Submit</button>
                            	<button type="reset" class="btn btn-default">reset</button>
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
<%@include file="../includes/footer.jsp" %>
</body>

</html>
