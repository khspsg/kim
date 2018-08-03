<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
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

<body>
	<form class="memberinsert_form2" name="memberinput_form2" 
			action="memberInsert2" method="post"
			role="form" data-parsley-validate="true">
		<div class="container">
			<div class="row" style="margin-top: 50px; color: #040044"">
				<div class="col-md-3"></div>
				<div class="col-md-6" style="text-align: center">
					<h1>
						<i class="fa fa-sign-in" aria-hidden="true"></i> 회원가입
					</h1>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<div class="row" style="margin-top: 30px">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="text-align: left">
				<div>
					<tr>
						<td id="title">이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp메&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp일</td>
						<td><input type="text" name="id" maxlength="50"></td>
					</tr>
				</div>
			</div>
		</div>

		<div class="row" style="margin-top: 10px">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="text-align: left">
				<div>
					<tr>
						<td id="title">이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</td>
						<td><input type="text" name="id" maxlength="50"></td>
					</tr>
				</div>
			</div>
		</div>

		<div class="row" style="margin-top: 10px">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="text-align: left">
				<div>
				
						<tr>
							<td id="title">비&nbsp&nbsp밀&nbsp&nbsp&nbsp&nbsp번&nbsp&nbsp호</td>
							<td><input type="text" name="id" maxlength="50"></td>
						</tr>

				</div>
			</div>
		</div>

		<div class="row" style="margin-top: 10px">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="text-align: left">
				<div>
					<tr>
						<td id="title">비밀번호확인</td>
						<td><input type="text" name="id" maxlength="50"></td>
					</tr>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div id="emailError" style="color: #f00"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div id="passwordError" style="color: #f00"></div>
			</div>
		</div>
		<div class="row" style="margin-top: 30px">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<button id="login" class="btn btn-primary" style="width: 100%">
					<i class="fa fa-sign-in" aria-hidden="true"></i>중복확인
				</button>
			</div>
		</div>
		<div class="row" style="margin-top: 10px">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<span class="col-md-4 text-left"> <a href="memberInsertForm">
						<i class="fa fa-plus-square" aria-hidden="true"></i> 고객센터
				</a></span> <span id="passfind" class="col-md-4 text-center"> <i
					class="fa fa-search" aria-hidden="true"></i> E-mail 찾기
				</span> <span id="passfind" class="col-md-4 text-center"> <i
					class="fa fa-search" aria-hidden="true"></i> 비밀번호찾기
				
			</div>
		</div>
		</div>
	</form>
	<div id="passfindModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Password 찾기</h4>
				</div>
				<div class="modal-body">
					<div class="row input-group">
						<span class="input-group-addon"> <i class="fa fa-envelope"
							aria-hidden="true"> </i> E-mail&nbsp&nbsp&nbsp&nbsp
						</span> <input id="findemail" type="email" class="form-control"
							placeholder="Email" required>
					</div>
					<div class="row input-group" style="margin-top: 20px">
						<span class="input-group-addon"> <i class="fa fa-user"
							aria-hidden="true"></i> 이 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 름
						</span> <input id="findname" type="text" class="form-control"
							placeholder="이름" required>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" id="findbtn" class="btn btn-success"
						data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div id="failfindModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Password 찾기</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div id="modalmessage" style="color: #f00"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" id="findbtn" class="btn btn-success"
						data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>