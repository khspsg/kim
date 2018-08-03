<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board</title>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
</head>
<script type="text/javascript">
 
	$(document).ready(function(){
		$('#boarddeletebtn').on('click',function(){
			var b_seq = $('#boardb_seq').val();
			var b_ref = $('#b_ref').val();
			$('#boardDeleteModal').modal('show');
			$('.modal-body').text("삭제 하시겠습니까?");
			$('#boarddelbtn').on('click',function(){
				location.href="boardDelete?b_seq="+b_seq+"&b_ref="+b_ref;
			});
		});
	});
</script>
<body onload="init()">
<form class="boardupdate_form" name="boardupdate_form" action="boardUpdate" method="post"  enctype="multipart/form-data" role="form" data-parsley-validate="true">
	<div class="container">
		<input type="hidden" id="boardb_seq" name="b_seq" value="${board.b_seq}">
		<input type="hidden" id="b_ref" name="b_ref" value="${board.b_ref}">
		
		<div class="row" style="margin-top:50px">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center;color:#040044">
				<h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 게시글</h1>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-envelope" aria-hidden="true">
						</i> E-mail&nbsp&nbsp&nbsp&nbsp</span>
						<input name="b_email" id="b_email" value="${board.b_email}" readonly="readonly" class="form-control" type="email" size="20" />
					</div>
		 		</div>	 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-user" aria-hidden="true"></i> 이 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 름</span>
						<input name="b_name" id="name" class="form-control" value="${board.b_name}" readonly="readonly"/>
					</div>
		 		</div>	 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-flag-checkered" aria-hidden="true"></i> 제 &nbsp&nbsp&nbsp&nbsp&nbsp 목</span>
						<c:choose>
							<c:when test="${sessionemail == board.b_email}">
								<input name="b_title" id="b_title" class="form-control"
						 		type="text" size="100" value="${board.b_title}"
						 		required="true" data-parsley-error-message="글 제목을 입력하세요!"
						 		data-parsley-errors-container="div[id='titleError']"/>
							</c:when>
							<c:otherwise>
								<input name="b_title" id="b_title" class="form-control"
						 		type="text" size="100" value="${board.b_title}" readonly="readonly"
						 		required="true" data-parsley-error-message="글 제목을 입력하세요!"
						 		data-parsley-errors-container="div[id='titleError']"/>
							</c:otherwise>
						</c:choose>
						
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div id="titleError" style="color:#f00;text-align:left;margin-left: 10%">
		 		</div> 
		 	</div>
		</div> 
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-paperclip" aria-hidden="true"></i> 첨부파일
						</span>
							<input type="file" name="file" class="form-control" style="font-size: 10px"
							value="${board.b_attach}"
							/>
							<input type="text" name="b_beforeattach" class="form-control" style="font-size: 10px"
							value="${board.b_attach}"
							/>
					</div>
		 		</div>	 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-commenting" aria-hidden="true"></i>내&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp용&nbsp</span>
						<textarea id="b_content" name="b_content" type="text" class="form-control" rows="5" autocomplete="off" style="text-align:left">${board.b_content}</textarea>
						<script type="text/javascript">
							CKEDITOR.replace( 'b_content');
						</script>
					</div>
		 		</div>	 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align: center">
		 		<div>
		 			<button type="button" onclick="location.href='boardPageList?find'" class="btn btn-info">글목록</button>
		 			
					<c:if test="${sessionemail == 'admin@a.com' || sessionemail == board.b_email}">
						<button name="boardupdate"  class="btn btn-success">글수정</button>
						<button type="button" id="boarddeletebtn" class="btn btn-danger">글삭제</button>
					</c:if>
					<c:if test="${sessionemail != null}">
						<c:choose>
							<c:when test="${board.b_step == 0}">
								<button type="button" name="boardreply" 
								onclick="location.href='boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_seq}'" class="btn btn-warning">댓글</button>
							</c:when>
							<c:otherwise>
								<button type="button" name="boardreply" 
								onclick="location.href='boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_ref}'" class="btn btn-warning">댓글</button>
							</c:otherwise>
						</c:choose>
						
					</c:if> 
		 		</div>	 
		 	</div>
		</div>
		<div class="row" style="margin-top:30px">  
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align:center">
		 		<div class="alert alert-danger" id="alertmsg" role="alert" 
		 		style="display:none;" >
					<a href="#" class="close" data-dismiss="alert">&times;</a>
					<span id="msg">Message of the Alert</span>
				</div>	 
		 	</div>
		</div>
		 		 
	</div>
	<div id="boardDeleteModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">삭제 확인</h4>
				</div>
				<div class="modal-body">
				<p><span id="modalmsg"> Some text in modal</span>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" id="boarddelbtn" class="btn btn-danger"
					 data-dismiss="modal">삭제</button>
					 <button type="button" id="cancelbtn" class="btn btn-success"
					 data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>