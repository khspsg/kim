<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board</title>
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

</script>
<body onload="boardreply_form.b_content.focus()">
<form class="boardreply_form" name="boardreply_form" action="boardReplyInsert" method="post"  enctype="multipart/form-data" role="form" data-parsley-validate="true">
		<input type="hidden" name="b_ref" value="${board.b_seq}">
	<div class="container">
		<div class="row" style="margin-top:50px">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center;color:#040044">
				<h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Reply 게시판</h1>
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
						<input name="b_title" id="b_title" class="form-control"
						 type="text" size="100" autofocus value="${board.b_title}"
						 required="true" data-parsley-error-message="글 제목을 입력하세요!"
						 data-parsley-errors-container="div[id='titleError']" autofocus/>
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
							<input type="file" name="file" class="form-control" style="font-size: 10px"/>
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
						<textarea id="b_content" name="b_content" type="text" class="form-control ckeditor" rows="5" autocomplete="off" style="text-align:left"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace( 'b_content');
						</script>
					</div>
		 		</div>	 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:30px">  
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align:center">
		 		<div>
		 			<button type="submit" class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i> &nbsp&nbspSave&nbsp&nbsp</button>
		 			<button type="reset" class="btn btn-info"><i class="fa fa-eraser" aria-hidden="true"></i> Reset</button>
		 			<button type="button" class="btn btn-danger" onclick="location.href='index'"><i class="fa fa-reply" aria-hidden="true"></i> Cancel</button>
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
	
</form>
</body>
</html>