function selectedSeq( seq ){
	$.ajax({
		type:'POST',
		data : "seq="+seq,
		datatype:'json',
		url : 'buyDetail',
		success : function(data){
			$('#buysave').hide();
			$('#buyreset').hide();
			$('#buyupdate').show();
			$('#buydelete').show();
			
			$('#seq').attr("value",data.seq);
			$('#yyyy').attr("value",data.yyyy);
			$('#mm').attr("value",data.mm);
			$('#dd').attr("value",data.dd);
			$('#no').attr("value",data.no);
			$('#hang').attr("value",data.hang);
			$('#beforeprocode').attr("value",data.procode);
			$('#procode').attr("value",data.procode);
			$('#beforeprice').attr("value",data.price);
			$('#price').attr("value",data.price);
			$('#qty').attr("value",data.qty);
			$('#beforeqty').attr("value",data.qty);
			$('#stock').attr("value",data.stock);
			var amount = data.qty * data.price;
			$('#amount').attr("value",amount);
			$('#memo').attr("value",data.memo);
			$("#selectvender").val(data.vendcode).prop("selected", true);
			$("#selectproduct").val(data.procode).prop("selected", true);
		},
		error : function(xhr, status, error){
			alert('ajax error'+error );
		}
	});
}
function paymentselectedSeq( seq ){
	$.ajax({
		type:'POST',
		data : "seq="+seq,
		datatype:'json',
		url : 'paymentDetail',
		success : function(data){
			$('#paymentsave').hide();
			$('#paymentreset').hide();
			$('#paymentupdate').show();
			$('#paymentdelete').show();
			
			$('#seq').attr("value",data.seq);
			$('#yyyy').attr("value",data.yyyy);
			$('#mm').attr("value",data.mm);
			$('#dd').attr("value",data.dd);
			$('#no').attr("value",data.no);
			$('#hang').attr("value",data.hang);
			
			$('#amount').attr("value",data.amount);
			$('#payway').attr("value",data.payway);
			
			$("#selectvenderpayment").val(data.vendcode).prop("selected", true);
			$("#payway").val(data.payway).prop("selected", true);
			$('#memo').attr("value",data.memo);
			$('#beforeamount').attr("value",data.amount);
			$('#beforepayway').attr("value",data.payway);
		},
		error : function(xhr, status, error){
			alert('ajax error'+error );
		}
	});
}
function phone2_lengthchk(code){
	if(code.value.length == 4){
		document.memberinput_form.phone3.focus();
	}
}

function emailcheck(strValue){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
	
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	//입력을 안했으면
	if(strValue.lenght == 0){
		return false;}
	//이메일 형식에 맞지않으면
	if (!strValue.match(regExp)){
		return false;
	}
	return true;
}
function empnocheck(strValue){
	if(strValue.length>6 || strValue.length<6)
		return false;
	else
		return true;
}

function validateEmail(Email) {
    var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return $.trim(Email).match(pattern) ? true : false;
}

function sample4_execDaumPostcode() {
	var width = 500; //팝업창이 실행될때 위치지정
    var height = 600; //팝업창이 실행될때 위치지정

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
            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('newaddr').value = fullRoadAddr;
            document.getElementById('oldaddr').value = data.jibunAddress;
            document.getElementById('detailaddr').focus();
            
        }
    }).open({
        left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
        top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정
    });
}



$(document).ready(function(){
	var today = new Date();
	var year = today.getFullYear();
	var mm = today.getMonth()+1;
	var dd = today.getDate();
	
	$('#taskyyyy').attr("value",year);
	$("#taskmm").val(mm).prop("selected", true);
	
	$("#taxmm").val(mm).prop("selected", true);
	
	$('#searchyyyy').attr("value",year);
	$("#searchmm").val(mm).prop("selected", true);
	$("#searchdd").val(dd).prop("selected", true);
	
    $('#zipcodefind').on('click',function(){
    	sample4_execDaumPostcode();
    });
    
    $('#selectvender').on('change',function(){
    	var vendname = $(this).children('option:selected').text();
    	var vendcode = $(this).val();
    	$.ajax({
			type:'POST',
			data : "vendcode="+vendcode,
			datatype:'json',
			url : 'paymentNew',
			success : function(data){
				$('#vendname').attr('value',vendname);
				$('#yyyy').attr('value',data.yyyy);
				$('#mm').attr('value',data.mm);
				$('#dd').attr('value',data.dd);
				$('#no').attr('value',data.no);
				$('#hang').attr('value',data.hang);
			},
			error : function(xhr, status, error){
				alert('ajax error'+error );
			}
		});
    });
    $('#selectvenderpayment').on('change',function(){
    	var vendname = $(this).children('option:selected').text();
    	var vendcode = $(this).val();
    	$.ajax({
			type:'POST',
			data : "vendcode="+vendcode,
			datatype:'json',
			url : 'paymentNew',
			success : function(data){
				$('#vendname').attr('value',vendname);
				$('#yyyy').attr('value',data.yyyy);
				$('#mm').attr('value',data.mm);
				$('#dd').attr('value',data.dd);
				$('#no').attr('value',data.no);
				$('#hang').attr('value',data.hang);
			},
			error : function(xhr, status, error){
				alert('ajax error'+error );
			}
		});
    });
    
    $('#selectproduct').on('change',function(){
    	var productcode = $(this).val();
    	$.ajax({
			type:'POST',
			data : "productcode="+productcode,
			datatype:'json',
			url : 'productSelected',
			success : function(data){
				$('#price').attr("value",data.buyprice);
				$('#procode').attr("value",data.code);
				$('#stock').attr("value",data.stock);
				$('#qty').focus();
			},
			error : function(xhr, status, error){
				alert('ajax error'+error );
			}
		});
    });
    $('#qty').on('blur',function(){
		var amount = $('#price').val() * $('#qty').val();
		$('#amount').attr("value",amount);
    });
    
	
	$('#datetimepicker1').datetimepicker();
	 
	$('#example').DataTable( {
        "order": [[ 0, "desc" ]]
    } );
	
	$('#examplesalary').DataTable( {
    } );
	
	$('#examplebalance').DataTable( {
    } );
	
	$("#examplebalance > .dataTables_info").append("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='button' class='btn btn-danger' id='selecteddel' value='선택삭제'>");
	
	$("#allchk").click( function(){
		if( $(this).is(':checked') ){
			$('input[name=unitchk]').prop('checked',true);
		}else{
			$('input[name=unitchk]').prop('checked',false);
		}
	});
	
	$('#selecteddel').on('click',function(){
		var checkboxarr=[];
		$("input[name='unitchk']:checked").each(function(){
			checkboxarr.push($(this).val());
		});
		if(checkboxarr.length > 0){
			$('#salary_delete').submit();
		}else{
			$('#modalmsg').text("삭제 항목을 선택 하세요!");
			$('#salarydelModal').modal('show');
		}
	});
	
	$('#empnoconfirm').on('click',function() {
		var empno = $('#empno').val();
		if($('#empno').val()==""){
			$('#modalmsg').text("사원번호를 입력해주세요!");
			$('#empnoModal').modal('show');
			return;
		}else{
			var boolempno = empnocheck(empno);
			if(boolempno==false){
				$('#modalmsg').text("6자리만 입력해 주세요.");
				$('#empnoModal').modal('show');
				return;
			}
			
			$.ajax({
				type:'POST',
				data : "empno="+empno,
				datatype:'json',
				url : 'empnoconfirm',
				success : function(data){
					if(data == 0){
						$('#password').focus();
						$('#modalmsg').text("사용가능한 번호 입니다!");
						$('#usebtn').text('사용');
						$('#empnoModal').modal('show');
						$('#empnoconfirmchk').attr("value","yes");
						return;
					}else{
						$('#modalmsg').text("이미 등록된 사원번호 입니다!");
						$('#empnoModal').modal('show');
					}
				},
				error : function(xhr, status, error){
					alert('ajax error');
				}
			});
		}
	});
	
	$('#codeconfirm').on('click',function() {
		var code = $('#code').val();
		if($('#code').val()==""){
			$('#modalmsg').text("상품코드를 입력해주세요!");
			$('#barcodeModal').modal('show');
			return;
		}else{
			
			$.ajax({
				type:'POST',
				data : "code="+code,
				datatype:'json',
				url : 'codeconfirm',
				success : function(data){
					if(data == 0){
						$('#name').focus();
						$('#modalmsg').text("사용가능한 code 입니다!");
						$('#usebtn').text('사용');
						$('#barcodeModal').modal('show');
						$('#codeconfirmchk').attr("value","yes");
						return;
					}else{
						$('#modalmsg').text("이미 등록된 code 입니다!");
						$('#barcodeModal').modal('show');
					}
				},
				error : function(xhr, status, error){
					alert('ajax error');
				}
			});
		}
	});
	$('#venderconfirm').on('click',function() {
		var code = $('#vendcode').val();
		if($('#vendcode').val()==""){
			$('#modalmsg').text("거래처코드를 입력해주세요!");
			$('#venderModal').modal('show');
			return;
		}else{
			
			$.ajax({
				type:'POST',
				data : "code="+code,
				datatype:'json',
				url : 'venderconfirm',
				success : function(data){
					if(data == 0){
						$('#name').focus();
						$('#modalmsg').text("사용가능한 code 입니다!");
						$('#usebtn').text('사용');
						$('#venderModal').modal('show');
						$('#venderconfirmchk').attr("value","yes");
						return;
					}else{
						$('#modalmsg').text("이미 등록된 code 입니다!");
						$('#venderModal').modal('show');
					}
				},
				error : function(xhr, status, error){
					alert('ajax error');
				}
			});
		}
	});
	
	//중복체크
	$('#confirm').on('click',function() {
		var email = $('#email').val();
		if($('#email').val()==""){
			$('#modalmsg').text("E-mail을 입력해주세요!");
			$('#myModal').modal('show');
			return;
		}else{
			var boolemail = emailcheck(email);
			if(boolemail==false){
				$('#modalmsg').text("E-mail 형식으로 입력해 주세요.");
				$('#myModal').modal('show');
				return;
			}
			
			$.ajax({
				type:'POST',
				data : "email="+email,
				datatype:'json',
				url : 'confirm',
				success : function(data){
					if(data == 0){
						$('#password').focus();
						$('#modalmsg').text("사용가능한 E-mail 입니다!");
						$('#usebtn').text('사용');
						$('#myModal').modal('show');
						$('#confirmchk').attr("value","yes");
						return;
					}else{
						$('#modalmsg').text("이미 등록된 E-mail 입니다!");
						$('#myModal').modal('show');
					}
				},
				error : function(xhr, status, error){
				}
			});
		}
	});
	 
	
	$('#save').on('click',function() {
		var msg="";
		if($('#confirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요! -\n\n";
			$('#modalmsg').text(msg);
			$('#myModal').modal('show');
			return;
		}else{
			$('.memberinput_form').submit();
		}
			
	});
	
	$('#salarysave').on('click',function() {
		var msg="";
		if($('#empnoconfirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요! -\n\n";
			$('#modalmsg').text(msg);
			$('#empnoModal').modal('show');
			return;
		}else{
			$('.salaryinsert_form').submit();
		}
			
	});
	
	$('#productsave').on('click',function() {
		
		var msg="";
		if($('#codeconfirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요! -\n\n";
			$('#modalmsg').text(msg);
			$('#barcodeModal').modal('show');
			return;
		}else{
			$('.productinsert_form').submit();
		}
			
	});
	
	$('#buysave').on('click',function() {
		var selectedvend = $('#selectvender').val();
		var selectedproduct = $('#selectproduct').val();
		var qty = $('#qty').val();
		if( selectedvend == '0000' ) {
			$('#modalmsgvender').text('- 매입처를 선택하세요! -');
		}else{
			$('#modalmsgvender').text('');
		}
		if( selectedproduct == '0000000000000' ) {
			$('#modalmsgproduct').text('- 상품을 선택하세요! -');
		}else{
			$('#modalmsgproduct').text('');
		}
		if( qty == 0 ) {
			$('#modalmsg').text('- 수량을 입력하세요! -');
		}else{
			$('#modalmsg').text('');
		}
		if(selectedvend == '0000' || selectedproduct == '0000000000000' || qty == 0 ){
			$('#buyModal').modal('show');
		}else{
			$('.buyinsert_form').submit();
		}
	});
	
	$('#paymentsave').on('click',function() {
		var selectedvend = $('#selectvenderpayment').val();
		var amount = $('#amount').val();
		if(amount == ""){
			$('#modalmsg').text('- 지불 금액을 입력하세요! -');
			$('#paymentModal').modal('show');
			return;
		}else{
			$('.paymentinsert_form').submit();
		}
		
	});
	
	$('#buysearch_btn').on('click',function() {
		var vendcode = $('#searchvender').children('option:selected').val();
		if( vendcode == '0000' ) {
			$('#modalmsgvender').text('- 매입처를 선택하세요! -');
			$('#buyModal').modal('show');
			return;
		}else{
			$('#buysearch_form').submit();
		}
	});
	
	$('#paymentsearch_btn').on('click',function() {
		var vendcode = $('#paymentsearchvender').children('option:selected').val();
		if( vendcode == '0000' ) {
			$('#modalmsgvender').text('- 매입처를 선택하세요! -');
			$('#paymentModal').modal('show');
			return;
		}else{
			
			$('#paymentsearch_form').submit();
		}
	});
	$('#buyupdate').on('click',function() {
		$('.buyinsert_form').attr('action','buyUpdate');
		$('.buyinsert_form').submit();
	});
	$('#paymentupdate').on('click',function() {
		$('.paymentinsert_form').attr('action','paymentUpdate');
		$('.paymentinsert_form').submit();
	});
	$('#buydelete').on('click',function() {
		$('#modalmsgvender').text('삭제하시겠습니까? ');
		$('#buyModal').modal('show');
		$('#cancelbtn').modal('show');
		$('#usebtn').on('click',function(){
			$('.buyinsert_form').attr('action','buyDelete');
			$('.buyinsert_form').submit();
		});
	});
	
	$('#buybooklistmm').on('click',function() {
		$('.buy_booklist_form').attr('action','buyBooklistmm');
		$('.buy_booklist_form').submit(); 
	});
	$('#buybooklistdd').on('click',function() {
		$('.buy_booklist_form').attr('action','buyBooklistdd');
		$('.buy_booklist_form').submit(); 
	});
	
	$('#taskclosemm').on('click',function() {
		
		$('.modal-title').text("월말 마감");
		$('#modalmsg').text("확인 하면 데이터가 갱신 됩니다.");
		$('#modalmsg1').text("월말마감 하시겠습니까?");
		$('#taskcloseModal').modal('show');
		
		$('#taskclosecomplate').on('click',function() {
			$('.taskclose_form').attr('action','taskCloseMonth');
			$('.taskclose_form').submit(); 
		});
		
	});
	$('#taskcloseyyyy').on('click',function() {
		$('.modal-title').text("년말 마감");
		$('#modalmsg').text("확인 하면 데이터가 갱신 됩니다.");
		$('#modalmsg1').text("년말마감 하시겠습니까?");
		$('#taskcloseModal').modal('show');
		
		$('#taskclosecomplate').on('click',function() {
				$('.taskclose_form').attr('action','taskCloseYear');
				$('.taskclose_form').submit(); 
		});
	});
	
	$('#buyupdateAJaxsubmit').on('click',function() {
		
		$('.buyinsert_form').attr('action','buyUpdate');
		$.ajax({
			type:'POST',
			data : $('.buyinsert_form').serialize(),
			datatype:'json',
			url : $('.buyinsert_form').attr('action'),
			success : function(data){
			},
			error : function(xhr, status, error){
			}
		});
	});
	 
	$('#vendersave').on('click',function() {
		
		var msg="";
		if($('#venderconfirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요! -\n\n";
			$('#modalmsg').text(msg);
			$('#venderModal').modal('show');
			return;
		}else{
			$('.venderinsert_form').submit();
		}
			
	});
	$('#salarytaxbtn').on('click',function() {
		
			
		if($('#taxyyyy').val()=='' || $('#taxmm').val()=='' ){
			$('.salarytax_form').submit();
			return;
		}else{
			var msg1="- 데이터가 지워지고 다시 생성됩니다 ! -";
			var msg2="- 계산처리 하시겠습니까? -";
			$('#modalmsg').text(msg1);
			$('#modalmsgnew').text(msg2);
			
			$('#salarytaxModal').modal('show');
			$('#taxbtn').on('click',function(){
				$('.salarytax_form').attr('action','salaryTax');	
				$('.salarytax_form').submit();
			});
			$('#taxcancelbtn').on('click',function(){
				return;
			});	
		}	
	});
	
	$('#salarytaxdel').on('click',function() {
		if($('#taxyyyy').val()=='' || $('#taxmm').val()=='' ){
			$('.salarytax_form').submit();
			return;
		}else{
			var msg1="- 데이터가 삭제 됩니다 ! -";
			var msg2="- 삭제 하시겠습니까? -";
			$('#modalmsg').text(msg1);
			$('#modalmsgnew').text(msg2);
			
			$('#salarytaxModal').modal('show');
			$('#taxbtn').on('click',function(){
				$('.salarytax_form').attr('action','salaryTaxDelete');	
				$('.salarytax_form').submit();
			});
			$('#taxcancelbtn').on('click',function(){
				return;
			});	
		}	
	});
	$('#image').on('click',function(){
		$('input[type=file]').click();
		return false
	});
	$('#photo').change(function(event){
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$('#image').attr('src',tmppath);
	});
	
	//Delete
	$(document).on('click','#delete',function(){
		$('#modalmsg').text($(this).val() +"을 삭제하시겠습니까?");
		$('#deleteModal').modal('show');
		var delvalue = $(this).val();
		$('#delbtn').on('click',function(){
			var input=$("<input>")
				.attr("name","delemail")
				.attr("type","hidden")
				.attr("value",delvalue);
			$('.memberList_form').append($(input));
			$('.memberList_form').submit();
		});
		return;
	});
	
	
	$('#boarddeletebtn').on('click',function(){
		$('#modalmsg').text("게시글을 삭제하시겠습니까?");
		$('#boardDeleteModal').modal('show');
		var delvalue = $('#boardb_seq').val();
		$('#boarddelbtn').on('click',function(){
			 var url="boardDelete?b_seq="+delvalue;
			 $(location).attr('href', url);
		});
		return;
	});
	$('#passfind').on('click',function(){
		$('#passfindModal').modal('show');
		$('#findbtn').on('click',function(){
			var email = $('#findemail').val();
			var name = $('#findname').val();
			var result=validateEmail(email);
			if($('#findemail').val()==""){
				$('#failfindModal').modal('show');
				$('#modalmessage').text("E-mail을 입력해주세요.");
				$('#chkbtn').on('click',function(){
					$('#passfindModal').modal('show');
					$('#modalmsg').text("E-mail을 입력해주세요.");
				return;
				});
			}else if($('#findname').val()==""){
				$('#failfindModal').modal('show');
				$('#modalmessage').text("이름을 입력해주세요.");
				$('#chkbtn').on('click',function(){
					$('#passfindModal').modal('show');
					$('#modalmsg').text("이름을 입력해주세요.");
				return;
				});
			}else{
				if(result){
					 $.ajax({
						type:'POST',
						data : "email="+email+"&name="+name,
						datatype:'json',
						url : 'passwordFind',
						success : function(data){
							if(data==0){
								$('#failfindModal').modal('show');
								$('#modalmessage').text("E-mail이 일치하지 않거나 없는 E-mail입니다.");
								$('#findemail').val('');
								$('#findname').val('');
								return;
							}else{
								$('#failfindModal').modal('show');
								$('#modalmessage').text("임시비밀번호가 E-mail로 전송되었습니다.");
								$('#findemail').val('');
								$('#findname').val('');
								return;
							}
						},
						error : function(xhr, status, error){
							return;
						}
					}); 
				}else{
					$('#failfindModal').modal('show');
					$('#modalmessage').text("E-mail 형식에 맞게 입력하세요.");
					return;
				}
			}
		});
	});
	$(".memberupdate_form").delegate("input", "click", function() {
		$(this).attr('value','');
	});
	
});