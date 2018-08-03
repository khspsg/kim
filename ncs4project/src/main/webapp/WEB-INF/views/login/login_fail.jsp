<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <!-- Latest compiled and minified CSS -->
  <script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
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
		$('#emailModal').modal('hide');
		$('#myModal').modal('hide');
		$('#passfind').on('click',function(){
			$('#emailModal').modal('show');
			$('.modal_emailfind').on('click',function(){
				$.ajax({
					type:'POST',
					data : "email="+$('#findemail').val(),
					datatype:'json',
					url : 'emailLossFind',
					success : function(data){
						if(data == 0){
							$('#myModal').modal('show');
							$('#mymodal-body').text("E-mail이 존재하지 않습니다.");
						}else{
							$('#myModal').modal('show');
							$('#mymodal-body').text("임시번호를 E-mail로 전송했습니다.");
						}
						$('#findemail').val('');
					},
					error : function(xhr, status, error){
						alert('ajax error'+status.code);
					}
				});
			});
		});
	});
</script>
<body>
<form id="loginfail_form" name="loginfail_form" action="login"  method="post">
	<div class="container">
		
		<div class="row" style="margin-top:50px">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center;color: #ff0000">
				<h1><i class="fa fa-sign-in" aria-hidden="true"></i> Login Fail</h1>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" style="margin-top:30px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-envelope" aria-hidden="true">
						</i> E-mail&nbsp&nbsp&nbsp&nbsp</span>
						<input name="email" id="email" class="form-control" type="email" size="20"
							maxlength="30"
							required="true" data-parsley-error-message="E-mail 형식에 맞게 입력하세요!"
							data-parsley-errors-container="div[id='emailError']"  autofocus/>
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
							<i class="fa fa-key" aria-hidden="true"></i> 비밀번호</span>
						<input name="password" id="password" class="form-control"
						 type="password" size="16"
						 required="true" data-parsley-error-message="비밀번호를 입력하세요!"
						 data-parsley-errors-container="div[id='passwordError']"/>
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div id="emailError" style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		<div class="row"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div id="passwordError"  style="color:#f00">
		 		</div> 
		 	</div>
		</div> 
		<div class="row" style="margin-top:30px">  
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align:center">
	 			<button  id="login" class="btn btn-primary" style="width:100%"><i class="fa fa-sign-in" aria-hidden="true"></i> &nbsp&nbsp Login</button>
		 	</div>
		</div>	
		<div class="row" style="margin-top:10px">  
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align:center">
		 	    <span class="col-md-3 text-left">
		 	    	<a href="memberInsertForm">
		 	    	<i class="fa fa-plus-square" aria-hidden="true"></i> 회원가입
		 	    	</a>
		 	    </span>
		 	    
		 	    <span  id="passfind" class="col-md-6 text-center">
		 	    	<i class="fa fa-search" aria-hidden="true"> 비밀번호찾기 </i> 
	 			</span>
	 			<span class="col-md-3 text-right"><a href="index"><i class="fa fa-home" aria-hidden="true"></i></a></span>
		 	</div>
		</div>	
		
		<!-- Modal start-->
		<div id="emailModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						 
					</div>
					<div class="modal-body" id="email-modal-body" style="text-align:center">
						<div class="row" style="text-align:center">
							<div class="col-md-2"></div>
							<div class="input-group col-md-8" style="text-align:center" >
								 <font color="#0000ff">비밀번호 찾기</font>
							</div>
							<div class="col-md-2"></div>
						</div> 
						<div class="row" style="margin-top: 30px">
							<div class="col-md-2"></div>
							<div class="input-group mb-3 col-md-10 ">
								<div class="input-group-prepend">
									<span class="input-group-text" style="width: 120px"> 
									<i class="fa fa-envelope" aria-hidden="true"> E-mail</i>
									</span>
								</div>
								<input type="email" name="findemail" id="findemail" class="form-control" placeholder="E-mail을 입력하세요"
									aria-describedby="basic-addon1">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="text-center">
							<button type="button" class="btn btn-success modal_emailfind"
								data-dismiss="modal">찾기</button>
							<button type="button" class="btn btn-danger modal_btn2"
								data-dismiss="modal">취소</button>
						</div>
						
					</div>
				</div>

			</div>
		</div>
		<!-- Modal end-->
		
		<!-- Modal start-->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						 
					</div>
					<div class="modal-body" id="mymodal-body">
						<p>Some text in the modal.</p>
					</div>
					<div class="modal-footer">
						<div class="text-center">
							<button type="button" class="btn btn-success modal_btn1"
								data-dismiss="modal">확인</button>
						</div>
						
					</div>
				</div>

			</div>
		</div>
		<!-- Modal end-->
	</div>
</form>
</body>
</html>