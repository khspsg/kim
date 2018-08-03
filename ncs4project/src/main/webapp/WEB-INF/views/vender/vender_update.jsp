<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="venderupdate_form" name="venderinput_form" 
			action="venderUpdate" method="post"
			role="form" data-parsley-validate="true">
	<div class="container">
		<div class="row" style="margin-top:30px;color:#040044"">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<h1><i class="fa fa-registered" aria-hidden="true"></i> 거래처 수정</h1>
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row" style="margin-top:30px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-codiepie" aria-hidden="true"></i> 코드</span>
						<input name="code" id="vendcode" class="form-control" type="text" size="20" 
							maxlength="4" placeholder="4자리" data-parsley-type="number" readonly="readonly"
							value="${vender.code}" />
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
							<i class="fa fa-info-circle" aria-hidden="true"></i>  상호&nbsp&nbsp&nbsp&nbsp</span>
						<input name="name" id="name" class="form-control"
						 type="text" size="16" value="${vender.name}"
						 required="true" data-parsley-error-message="상호를 입력하세요!"
						 data-parsley-errors-container="div[id='nameError']"/>
						<span class="input-group-addon">
							<i class="fa fa-info-circle" aria-hidden="true"></i> 대표자명</span>
						<input name="ceoname" id=""ceoname"" class="form-control"
						 type="text" size="16" value="${vender.ceoname}"
						 required="true" data-parsley-error-message="대표자명을 입력하세요!"
						 data-parsley-errors-container="div[id='ceonameError']"/> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-3">
		 		<div id="nameError"  style="color:#f00">
		 		</div> 
		 	</div>
		 	<div class="col-md-3">
		 		<div id="ceonameError"  style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-bandcamp" aria-hidden="true"></i> 사업자번호</span>
						<input name="busno1" id="busno1" class="form-control"
						 type="text" size="10"  maxlength="3" value="${vender.busno1}" data-parsley-type="number" 
						 required="true" data-parsley-error-message="사업자번호1을 입력하세요!"
						 data-parsley-errors-container="div[id='busnoErrorError']"/>
						<span class="input-group-addon"> - </span>
						<input name="busno2" id="busno2" class="form-control" data-parsley-type="number" 
						 type="text" size="6"  maxlength="2" value="${vender.busno2}"
						 required="true" data-parsley-error-message="사업자번호2을 입력하세요!"
						 data-parsley-errors-container="div[id='busnoErrorError']"/>
						<span class="input-group-addon"> - </span>
						<input name="busno3" id="busno3" class="form-control" data-parsley-type="number" 
						 type="text" size="16"  maxlength="5" value="${vender.busno3}"
						 required="true" data-parsley-error-message="사업자번호3을 입력하세요!"
						 data-parsley-errors-container="div[id='busnoErrorError']"/>   
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-4">
		 		<div id="busnoError"  style="color:#f00">
		 		</div> 
		 	</div>
		 	<div class="col-md-4">
		 		<div id="salepriceError"  style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-info-circle" aria-hidden="true"></i>  업태&nbsp&nbsp&nbsp&nbsp</span>
						<input name="bustype" id="bustype" class="form-control"
						 type="text" size="16" value="${vender.bustype}"/>
						<span class="input-group-addon">
							<i class="fa fa-info-circle" aria-hidden="true"></i> 종목&nbsp&nbsp&nbsp&nbsp</span>
						<input name="busconditions" id="busconditions" class="form-control" 
						 type="text" size="16" value="${vender.busconditions}"/> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:20px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-location-arrow" aria-hidden="true"></i> 우편번호</span>
						<input name="zipcode" id="zipcode" class="form-control" type="text" size="20" 
							value="${vender.zipcode}"
							data-parsley-errors-container="div[id='codeError']"/>
						<span class="input-group-addon button btn btn-primary" id="zipcodefind" >찾기</span>
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
							<i class="fa fa-map-marker" aria-hidden="true"></i> 신 주소</span>
						<input name="newaddr" id="newaddr" class="form-control" type="text" size="20" 
							value="${vender.newaddr}"
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
							<i class="fa fa-map-marker" aria-hidden="true"></i> 구 주소</span>
						<input name="oldaddr" id="oldaddr" class="form-control" type="text" size="20" 
							value="${vender.oldaddr}"
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
							<i class="fa fa-map-marker" aria-hidden="true"></i>나머지 주소</span>
						<input name="detailaddr" id="detailaddr" class="form-control" type="text" size="20" 
							value="${vender.detailaddr}"
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
						<span class="input-group-addon"><i class="fa fa-phone-square" aria-hidden="true"></i> 전화번호</span>
						<input name="officeno1" id="officeno1" class="form-control"
						 type="text" size="10"  maxlength="4" value="${vender.officeno1}"/>
						<span class="input-group-addon"> - </span>
						<input name="officeno2" id="officeno2" class="form-control"
						 type="text" size="6"  maxlength="4" value="${vender.officeno2}"/>
						<span class="input-group-addon"> - </span>
						<input name="officeno3" id="officeno3" class="form-control"
						 type="text" size="16"  maxlength="4" value="${vender.officeno3}"/>   
					</div>
		 		</div>	 
		 	</div>
		</div>
		 
		<!-- button tag start --> 
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
	
	<div id="venderModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">거래처코드 Check</h4>
				</div>
				<div class="modal-body">
				<p><span id="modalmsg"> Some text in modal</span>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" id="usebtn" class="btn btn-success"
					 data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="zip_codeModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">우편번호</h3>
            </div>    
            <div class="modal-body text-center">
                 <form id = "zip_codeForm">
                         <div class = "input-group">
                            <span class = "input-group-addon">동 입력</span>
                            <input type="text" class = "form-control" name="query" id="query">
                            <span class = "input-group-btn">                                                
                                <input type="submit" class = "btn btn-warning" value="검색" id="zipcodesearchBtn" onkeydown="javascript:if(event.keyCode==13)">                                            
                            </span>
                        </div>
                </form>
                <p>
                </p>
                <div>
                <div style="width:100%; height:200px; overflow:auto">
                       <table class = "table text-center">
                        <thead>
                            <tr>
                                <th style="width:150px;">우편번호</th>
                                <th style="width:600px;">주소</th>
                                </tr>
                        </thead>
                        <tbody id="zip_codeList"></tbody>
                    </table>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>

</form>
</body>
</html>