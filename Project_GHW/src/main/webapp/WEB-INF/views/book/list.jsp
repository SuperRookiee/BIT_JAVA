<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<body>
	<div id="page-wrapper">
	    <div class="row">
	        <div class="col-lg-12">
	            <h1 class="page-header">Book Tables</h1>
	        </div>
	        <!-- /.col-lg-12 -->
	    </div>
	    <!-- /.row -->
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="panel panel-default">
	                <div class="panel-heading"> 게시글 목록
	                    <button id= 'regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>
	                </div>
	                <!-- /.panel-heading -->
	                <div class="panel-body">
	                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                        <thead>
	                            <tr>
	                                <th>#번호</th>
	                                <th>제목</th>
	                                <th>작성자</th>
	                                <th>작성일</th>
	                                <th>수정일</th>
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
	                    
	                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
	                    	<div class="modal-dialog">
	                    		<div class="modal-content">
	                     		<div class="modal-header">
	                     			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                     			<h4 class="modal-title" id="myModalLabel">Modal title</h4>
	                    			</div>
	                    			<div class="modal-body">처리가 완료되었습니다.</div>
	                    			<div class="modal-footer">
	                    				<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
	                    				<button type="button" class="btn btn-primary">Save Changes</button>
	                    			</div>
	                    		</div>
	                    	</div>
	                    </div>
	                    <!-- modal fade -->
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
		var result='<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({},null,null);
		function checkModal(result) {
			if(result === '' || history.state ){
				return;
			}
			if(parseInt(result)>0){
				$(".modal-body").html(
					"게시글"+parseInt(result)+" 번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
	});
	
	$("#regBtn").on("click", function(){
		self.location = "/book/register"
	}); //버튼 클릭시 등록창으로 이동
	
</script>

<%@include file="../includes/footer.jsp" %>
</body>

</html>
