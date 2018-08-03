<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="productinsert_form" name="productinput_form" 
			action="productUpdate" method="post"
			role="form" data-parsley-validate="true">
	<div class="container">
		<div class="row" style="margin-top:30px;color:#040044"">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<h1><i class="fa fa-product-hunt" aria-hidden="true"></i> 상품 Detail</h1>
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row" style="margin-top:30px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-codiepie" aria-hidden="true"></i> 상품코드</span>
						<input name="code" id="code" class="form-control" type="text" size="20" 
							maxlength="13" value="${product.code}" readonly="readonly"
							/>
					</div>
		 		</div>	 
		 	</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-info-circle" aria-hidden="true"></i>  상품명&nbsp&nbsp&nbsp&nbsp</span>
						<input name="name" id="name" class="form-control"
						 type="text" size="16" value="${product.name}"
						 required="true" data-parsley-error-message="상품명을 입력하세요!"
						 data-parsley-errors-container="div[id='nameError']"/>
						<span class="input-group-addon">
							<i class="fa fa-info-circle" aria-hidden="true"></i>  상품규격</span>
						<input name="capacity" id="capacity" class="form-control"
						 type="text" size="16" value="${product.capacity}"
						 required="true" data-parsley-error-message="상품규격을 입력하세요!"
						 data-parsley-errors-container="div[id='capacityError']"/> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-4">
		 		<div id="nameError"  style="color:#f00">
		 		</div> 
		 	</div>
		 	<div class="col-md-4">
		 		<div id="capacityError"  style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon"> 매입단가</span>
						<input name="buyprice" id="buyprice" class="form-control"
						 type="text" size="16" value="${product.buyprice}"
						 required="true" data-parsley-error-message="매입단가를 입력하세요!"
						 data-parsley-errors-container="div[id='buypriceError']"/>
						<span class="input-group-addon"> 매출단가</span>
						<input name="saleprice" id="saleprice" class="form-control"
						 type="text" size="16" value="${product.saleprice}"
						 required="true" data-parsley-error-message="매출단가를 입력하세요!"
						 data-parsley-errors-container="div[id='salepriceError']"/> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-4">
		 		<div id="buypriceError"  style="color:#f00">
		 		</div> 
		 	</div>
		 	<div class="col-md-4">
		 		<div id="salepriceError"  style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-expand" aria-hidden="true"></i> 상품설명</span>
						<input name="explanation" id="explanation" class="form-control"
						 type="text" size="16" value="${product.explanation}"
						 data-parsley-error-message="상품 설명을 입력하세요!"
						 data-parsley-errors-container="div[id='explanationError']"/>
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row" style="margin-top:10px; text-align: center;" > 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8  label label-warning">
		 		  <span style="color:white;">재고 현황</span>
		 	</div>
		</div>
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">전년말재고</span>
						<input name="preyystock" id="preyystock" class="form-control"
						 type="text" size="16" value="${product.preyystock}" />
						<span class="input-group-addon">전월말재고</span>
						<input name="premmstock" id="premmstock" class="form-control"
						 type="text" size="16" value="${product.premmstock}" />
						<span class="input-group-addon"> 전일재고</span>
						<input name="preddstock" id="preddstock" class="form-control"
						 type="text" size="16" value="${product.preddstock}" />
						<span class="input-group-addon"> 현재재고</span>
						<input name="stock" id="stock" class="form-control"
						 type="text" size="16" value="${product.stock}" /> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		 
		<div class="row" style="margin-top:10px; text-align: center;" > 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8 label label-default" >
		 		  매입 매출 현황
		 	</div>
		</div>
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">1월 매입</span>
						<input name="buy01" class="form-control"
						 type="text" size="16" value="${product.buy01}" />
						<span class="input-group-addon">1월 매출</span>
						<input name="sale01" class="form-control"
						 type="text" size="16" value="${product.sale01}" />
						<span class="input-group-addon">7월 매입</span>
						<input name="buy07" class="form-control"
						 type="text" size="16" value="${product.buy07}" />
						<span class="input-group-addon">7월 매출</span>
						<input name="sale07" class="form-control"
						 type="text" size="16" value="${product.sale07}" /> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">2월 매입</span>
						<input name="buy02" class="form-control"
						 type="text" size="16" value="${product.buy02}" />
						<span class="input-group-addon">2월 매출</span>
						<input name="sale02" class="form-control"
						 type="text" size="16" value="${product.sale02}" />
						<span class="input-group-addon">8월 매입</span>
						<input name="buy08" class="form-control"
						 type="text" size="16" value="${product.buy08}" />
						<span class="input-group-addon">8월 매출</span>
						<input name="sale08" class="form-control"
						 type="text" size="16" value="${product.sale08}" /> 
					</div>
		 		</div>	 
		 	</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">3월 매입</span>
						<input name="buy03" class="form-control"
						 type="text" size="16" value="${product.buy03}" />
						<span class="input-group-addon">3월 매출</span>
						<input name="sale03" class="form-control"
						 type="text" size="16" value="${product.sale03}" />
						<span class="input-group-addon">9월 매입</span>
						<input name="buy09" class="form-control"
						 type="text" size="16" value="${product.buy09}" />
						<span class="input-group-addon">9월 매출</span>
						<input name="sale09" class="form-control"
						 type="text" size="16" value="${product.sale09}" /> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">4월 매입</span>
						<input name="buy04" class="form-control"
						 type="text" size="16" value="${product.buy04}" />
						<span class="input-group-addon">4월 매출</span>
						<input name="sale04" class="form-control"
						 type="text" size="16" value="${product.sale04}" />
						<span class="input-group-addon">10월 매입</span>
						<input name="buy10" class="form-control"
						 type="text" size="16" value="${product.buy10}" />
						<span class="input-group-addon">10월 매출</span>
						<input name="sale10" class="form-control"
						 type="text" size="16" value="${product.sale10}" /> 
					</div>
		 		</div>	 
		 	</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">5월 매입</span>
						<input name="buy05" class="form-control"
						 type="text" size="16" value="${product.buy05}" />
						<span class="input-group-addon">5월 매출</span>
						<input name="sale05" class="form-control"
						 type="text" size="16" value="${product.sale05}" />
						<span class="input-group-addon">11월 매입</span>
						<input name="buy11" class="form-control"
						 type="text" size="16" value="${product.buy11}" />
						<span class="input-group-addon">11월 매출</span>
						<input name="sale11" class="form-control"
						 type="text" size="16" value="${product.sale11}" /> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">6월 매입</span>
						<input name="buy06" class="form-control"
						 type="text" size="16" value="${product.buy06}" />
						<span class="input-group-addon">6월 매출</span>
						<input name="sale06" class="form-control"
						 type="text" size="16" value="${product.sale06}" />
						<span class="input-group-addon">12월 매입</span>
						<input name="buy12" class="form-control"
						 type="text" size="16" value="${product.buy12}" />
						<span class="input-group-addon">12월 매출</span>
						<input name="sale12" class="form-control"
						 type="text" size="16" value="${product.sale12}" /> 
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
		 			<button type="button" class="btn btn-info"><i class="fa fa-eraser" aria-hidden="true"></i> Delete</button>
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
	
	<div id="barcodeModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">상품코드 Check</h4>
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
</form>
</body>
</html>