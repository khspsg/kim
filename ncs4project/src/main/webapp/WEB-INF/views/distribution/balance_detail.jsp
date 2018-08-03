<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>balance detail</title>
</head>
<body>
<form class="balanceupdate_form" name="balanceupdate_form" 
			action="balanceUpdate" method="post"
			role="form" data-parsley-validate="true">
	
	<div class="container">
		<input type="hidden" name="yyyy" value="${balance.yyyy}">
		<input type="hidden" name="vendcode" value="${balance.vendcode}">
		<div class="row" style="margin-top:5px;color:#040044"">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				 <span style="font-size: 20px"><i class="fa fa-money" aria-hidden="true"></i> ${balance.vendname} 거래현황 </span>
				 <span style="margin-left: 40px">
				 	<button type="submit" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i> 수정</button>
				 	<button type="button" class="btn btn-danger" onclick="location.href='balanceList'"><i class="fa fa-reply" aria-hidden="true"></i> Delete</button>
				 </span>
				
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<div class="row" style="margin-top:3px; text-align: center;" > 
		 	<div class="col-md-2"></div>
		 	<div class="col-md-8  label label-warning">
		 		  <span style="color:white;">월별 현황</span>
		 	</div>
		</div>
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
				<div class="form-group col-md-12" style="text-align: center;background: #cccccc">
					<span class="col-md-2"> </span>
					<span class="col-md-1">  월</span>
					<span class="col-md-1">전월이월</span>
					<span class="col-md-1">거래금액</span>
					<span class="col-md-1">현금</span>
					<span class="col-md-1">어음</span>
					<span class="col-md-1">카드</span>
					<span class="col-md-1">기타</span>
					<span class="col-md-1">잔액</span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">01 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance01" value="${balance.prebalance01}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal01" value="${balance.deal01}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash01" value="${balance.cash01}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check01" value="${balance.check01}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card01" value="${balance.card01}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc01" value="${balance.etc01}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance01" value="${balance.balance01}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div>
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">02 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance02" value="${balance.prebalance02}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal02" value="${balance.deal02}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash02" value="${balance.cash02}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check02" value="${balance.check02}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card02" value="${balance.card02}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc02" value="${balance.etc02}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance02" value="${balance.balance02}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">03 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance03" value="${balance.prebalance03}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal03" value="${balance.deal03}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash03" value="${balance.cash03}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check03" value="${balance.check03}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card03" value="${balance.card03}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc03" value="${balance.etc03}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance03" value="${balance.balance03}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">04 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance04" value="${balance.prebalance04}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal04" value="${balance.deal04}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash04" value="${balance.cash04}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check04" value="${balance.check04}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card04" value="${balance.card04}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc04" value="${balance.etc04}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance04" value="${balance.balance04}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">05 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance05" value="${balance.prebalance05}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal05" value="${balance.deal05}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash05" value="${balance.cash05}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check05" value="${balance.check05}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card05" value="${balance.card05}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc05" value="${balance.etc05}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance05" value="${balance.balance05}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">06 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance06" value="${balance.prebalance06}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal06" value="${balance.deal06}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash06" value="${balance.cash06}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check06" value="${balance.check06}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card06" value="${balance.card06}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc06" value="${balance.etc06}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance06" value="${balance.balance06}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">07 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance07" value="${balance.prebalance07}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal07" value="${balance.deal07}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash07" value="${balance.cash07}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check07" value="${balance.check07}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card07" value="${balance.card07}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc07" value="${balance.etc07}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance07" value="${balance.balance07}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div>  
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">08 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance08" value="${balance.prebalance08}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal08" value="${balance.deal08}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash08" value="${balance.cash08}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check08" value="${balance.check08}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card08" value="${balance.card08}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc08" value="${balance.etc08}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance08" value="${balance.balance08}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div>  
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">09 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance09" value="${balance.prebalance09}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal09" value="${balance.deal09}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash09" value="${balance.cash09}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check09" value="${balance.check09}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card09" value="${balance.card09}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc09" value="${balance.etc09}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance09" value="${balance.balance09}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div>  
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">10 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance10" value="${balance.prebalance10}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal10" value="${balance.deal10}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash10" value="${balance.cash10}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check10" value="${balance.check10}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card10" value="${balance.card10}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc10" value="${balance.etc10}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance10" value="${balance.balance10}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">11 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance11" value="${balance.prebalance11}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal11" value="${balance.deal11}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash11" value="${balance.cash11}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check11" value="${balance.check11}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card11" value="${balance.card11}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc11" value="${balance.etc11}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance11" value="${balance.balance11}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">12 월</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance12" value="${balance.prebalance12}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal12" value="${balance.deal12}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash12" value="${balance.cash12}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check12" value="${balance.check12}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card12" value="${balance.card12}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc12" value="${balance.etc12}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance12" value="${balance.balance12}"></span>
					<span class="col-md-2"> </span>
				</div>
	 		</div>
		</div> 
		
		<div class="row" style="margin-top:10px"> 
	 		<div class="col-md-12">
	 			<div class="form-group">
	 			<span class="col-md-2"> </span>
					<span class="col-md-1">이월(합계)</span>
					<span class="col-md-1"><input type="text" maxlength="7" name="prebalance02" value="${balance.preyybalance}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="deal02" value="${balance.dealtot}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="cash02" value="${balance.cashtot}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="check02" value="${balance.checktot}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="card02" value="${balance.cardtot}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="etc02" value="${balance.etctot}"></span>
					<span class="col-md-1"><input type="text" maxlength="7" name="balance02" value="${balance.balance}"></span>
					<span class="col-md-2"> </span>
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