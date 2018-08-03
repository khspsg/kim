<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
	function phone2_lengthchk(code){
		if(code.value.length == 4){
			document.member_insert_form.phone3.focus();
		}
	}
	
	function zipcodeFind(){
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
				
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postno').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullRoadAddr;
                document.getElementById('addr2').value = data.jibunAddress;

                // 이부분 삭제하면 자동으로 팝업이 닫힌다
//                 if(data.autoRoadAddress) {
//                     //예상되는 도로명 주소에 조합형 주소를 추가한다.
//                     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//                     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

//                 } else if(data.autoJibunAddress) {
//                     var expJibunAddr = data.autoJibunAddress;
//                     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

//                 } else {
//                     document.getElementById('guide').innerHTML = '';
//                 }
            },
            onclose:function(state) {
            	//state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                if(state === 'FORCE_CLOSE'){
                    //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.
                } else if(state === 'COMPLETE_CLOSE'){
                    //사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
                    //oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
                }
            }
        }).open();
	}
	
	
	
	$(document).ready(function(){
		$('#emailAuth').on('click', function() {
			var email = $('#email').val();
			 $.ajax({
				   type : 'POST',
				   data : "email="+email,
				   datatype : 'json',
				   url : 'emailAuth',
				   success : function(data) {
				   alert("ajax success:"+data); 
				   return false;
				   }
			  });

		});
		$('#confirm').on('click',function(){
			var email = $('#email').val();
			var name = "korea";
			if(email==""){
				$('#myModal').modal('show');
				$('.modal-body').text("E-mail을 입력하세요.");
				$('.modal_btn1').text("확인");
				$('.modal_btn2').hide();
			}else{
				$.ajax({
					type:'POST',
					data : "email="+email,
					datatype:'json',
					url : 'memberConfirm',
					success : function(data){
						if(data == 0){
							$('#myModal').modal('show');
							$('.modal-body').text("사용 가능한 ID입니다.");
							$('.modal_btn1').on('click',function(){
								$('#confirm_yn').val("y");	 
							});
						}else{
							$('#myModal').modal('show');
							$('.modal-body').text("중복된 ID입니다.");
							$('.modal_btn1').text("확인");
							$('.modal_btn2').hide();
							$('.modal_btn1').on('click',function(){
								$('#email').val("");
								$('#email').focus();
							});
						}
					},
					error : function(xhr, status, error){
						alert('ajax error'+status.code);
					}
				});
			}
		}); 
		
		$('.save').on('click',function(){
			if($('#confirm_yn').val() == "n"){
				$('#myModal').modal('show');
				$('.modal-body').text("E-mail 중복체크를 하세요");
				$('.modal_btn1').text("확인");
				$('.modal_btn2').hide();
				return;
			}
			
			$('#member_insert_form').parsley().validate();
			$('#member_insert_form').submit();
		});
		
		$('#image').on('click',function(){
			$('input[type=file]').click();
			return false
		});
		$('#photo').change(function(event){
			var tmppath = URL.createObjectURL(event.target.files[0]);
			$('#image').attr('src',tmppath);
		});
		

	});
</script>
<body>
	<form name="member_insert_form" id="member_insert_form" 
		method="post" action="memberInsert" data-parsley-validate="true"
		enctype="multipart/form-data">
		
		<input type="hidden" id="confirm_yn" value="n">
		<div class="container">
			<div class="row" style="margin-top: 50px; color: #040044">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="text-align: center">
					<h1>Member Register</h1>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<div>
						<a href=#><img id="image" name="image"
							src="https://use.fontawesome.com/releases/v5.0.13/svgs/brands/earlybirds.svg"
							title="클릭 후 이미지 변경" alt="클릭 후 이미지 변경" class="rounded-circle"
							style="border: 1px solid;" width="140px" height="140px"></a>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 text-center">
					<div>
						<input type="file" id="photo" name="imgfile"
							style="visibility: hidden;">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 text-center">
					<div>
						<span class="input-group-addon button btn btn-warning" id="emailAuth">Email 인증</span>
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row" style="margin-top: 10px">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"><i
							class="fas fa-envelope" style="font-size: 30; color: #003366">
								E-mail</i></span>
					</div>
					<input type="email" class="form-control" id="email" name="email" value=""
						style="ime-mode:disabled"
						style="width: 20%;" placeholder="E-mail을 입력하세요"
						required="true" data-parsley-error-message="E-mail타입으로 입력하세요!"
						data-parsley-errors-container="div[id='emailError']"> 

					<button type="button" id="confirm" class="btn btn-primary"
						name="confirm">중복확인</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row"> 
		    	<div class="col-md-2"></div>
		    	<div class="col-md-8">
		     		<div id="emailError"  style="color:#f00">
		     		</div> 
		    	</div>
		    	<div class="col-md-2"></div>
		  	</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> <i
							class="fas fa-unlock-alt" style="font-size: 30; color: #003366">
								비빌번호</i>
						</span>
					</div>
					<input type="password" class="form-control" name="password"
					    id="password"
						placeholder="password를 입력하세요" aria-label="Username"
						required="true" data-parsley-error-message="비밀번호를 입력하세요!"
						data-parsley-errors-container="div[id='passwordError']"/>
				</div>
				<div class="col-md-2"></div>
			</div>
			
			<div class="row"> 
		    	<div class="col-md-2"></div>
		    	<div class="col-md-8">
		     		<div id="passwordError"  style="color:#f00">
		     		</div> 
		    	</div>
		    	<div class="col-md-2"></div>
		  	</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> <i
							class="fas fa-unlock-alt" style="font-size: 30; color: #003366">
								비번 확인</i>
						</span>
					</div>
					<input type="password" class="form-control" name="repassword"
					    data-parsley-equalto="#password"
						placeholder="확인 비밀번호" 
						data-parsley-errors-container="div[id='passwordError']"
						required="true" data-parsley-error-message="password가 맞지 않습니다!"
						>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> <i
							class="fas fa-user-alt" style="font-size: 30; color: #003366">
								이름</i>
						</span>
					</div>
					<input type="text" name="name" class="form-control" placeholder="이름을 입력하세요"
						aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> <i
							class="fas fa-phone-square" style="font-size: 30; color: #003366">
								전화번호</i>
						</span>
					</div>
					<select name="phone1" class="form-control"
						style="width: 10%; text-align: center;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
					</select> 
					<input name="phone2" class="form-control" type="text" size="4" maxlength="4"
						style="width: 15%; text-align: center;"
						onkeyup="phone2_lengthchk(this)"
						> 
					<label class="form-control" style="width: 3%; text-align: center;">-</label>
					<input name="phone3" class="form-control" type="text" size="4"
						style="width: 15%; text-align: center;" maxlength="4"
						placeholder="전화번호2" data-parsley-type="number" 
						data-parsley-validation-threshold="1" data-parsley-trigger="keyup"
						data-parsley-errors-container="div[id='phoneError']">
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> <i
							class="fas fa-dove" style="font-size: 30; color: #003366">
								우편번호</i>
						</span>
					</div>
					<input type="text" id="postno" name="postno" class="form-control"
						aria-describedby="basic-addon1" style="width: 10%;">
					<button type="button" class="btn btn-primary" name="confirm"
						style="width: 15%;" onclick="zipcodeFind()">검색</button>
					<label class="form-control" style="width: 35%;"> </label>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> <i
							class="fas fa-home" style="font-size: 30; color: #003366"> 주소</i>
						</span>
					</div>
					<input type="text" id="addr1" name="addr1" class="form-control" placeholder="주소1"
						aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> <i
							class="fas fa-home" style="font-size: 30; color: #003366">
								상세주소</i>
						</span>
					</div>
					<input type="text" id="addr2" name="addr2" class="form-control" placeholder="주소2"
						aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row" style="margin-top: 50px;">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="text-align: center;">
					<button type="button" class="btn btn-success save"
						style="width: 49%; text-align: center;">저장</button>
					<button type="reset" class="btn btn-warning save"
						style="width: 49%; text-align: center;">취소</button>
				</div>
				<div class="col-md-2"></div>
			</div>

			<!-- Modal -->
			<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							 
						</div>
						<div class="modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<div class="text-center">
								<button type="button" class="btn btn-success modal_btn1"
									data-dismiss="modal">사용</button>
								<button type="button" class="btn btn-danger modal_btn2"
									data-dismiss="modal">취소</button>
							</div>
							
						</div>
					</div>

				</div>
			</div>

		</div>
	</form>
</body>
</html>