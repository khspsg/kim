<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대금 지불</title>
</head>
<body>
	<div class="container">
	<form class="paymentinsert_form" name="paymentinput_form" 
			action="paymentInsert" method="post"
			role="form" data-parsley-validate="true">
			
		<div class="row" style="margin-top:30px;color:#040044">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<h1><i class="fa fa-indent" aria-hidden="true"></i> 지불</h1>
			</div>
			<div class="col-md-3"></div>
		</div>
		<input type="hidden" name="seq" id="seq" value="0">
		<input type="hidden" name="beforeamount" id="beforeamount" value="0">
		<input type="hidden" name="beforepayway" id="beforepayway">
		
		<div class="row" style="margin-top:30px"> 
			<div class="col-md-1"></div>
		 	<div class="col-md-5">
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-creative-commons" aria-hidden="true"></i> 거래처&nbsp&nbsp&nbsp&nbsp</span>
						<select id="selectvenderpayment" class="form-control" name="vendcode">
							 <c:forEach var="vender" items="${venders}">
							 	<option value="${vender.code}" 
								 	<c:if test="${vender.code == payment.vendcode}">selected</c:if>>
								 	${vender.name}
								</option>
							 </c:forEach>
						</select>	
					</div>
		 		</div>
		 		
		 		<div  style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i> 지불번호</span>
						<input name="yyyy" id="yyyy" class="form-control" value="${payment.yyyy}"
						 type="text" size="10" maxlength="4" readonly="readonly"/>
						<span class="input-group-addon">-</span>
						<input name="mm" id="mm" class="form-control" value="${payment.mm}"
						 type="text" size="5"  maxlength="2" readonly="readonly"/>
						<span class="input-group-addon">-</span>
						<input name="dd" id="dd" class="form-control" value="${payment.dd}"
						 type="text" size="5"  maxlength="2" readonly="readonly"/>   	
						<span class="input-group-addon">-</span>
						<input name="no" id="no" class="form-control" value="${payment.no}"
						 type="text" size="5"  maxlength="2" readonly="readonly"/>
						<span class="input-group-addon">-</span>
						<input name="hang" id="hang" class="form-control" value="${payment.hang}"
						 type="text" size="5"  maxlength="3" readonly="readonly"/> 
					</div>
				</div>
					
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-product-hunt" aria-hidden="true"></i> &nbsp&nbsp결제방법</span>
						<select class="form-control" name="payway" id="payway">
						 	<option value="cash">현금</option>
						 	<option value="check">어음</option>
						 	<option value="card">카드</option>
						 	<option value="etc">기타</option>
						</select>	
					</div>
		 		</div>
		 		
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-flask" aria-hidden="true"></i> 금&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp액</span>
						<input name="amount" id="amount" class="form-control"
						 type="text"  maxlength="10"/>
					</div>
		 		</div>
		 		
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-codiepie" aria-hidden="true"></i> 비&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp고</span>
						<input name="memo" id="memo" class="form-control"
						 type="text" maxlength="100"/>
					</div>
		 		</div>
		</div>
		
		<div class="col-md-5">
			<div class="pre-scrollable" style="margin-top: 10px;height: 450px">
	 			<table class="table table-striped table-bordered" >
		        	<thead>
		        	<tr align="left">
		        		<td colspan="3">${payment.vendname}(${payment.vendcode})</td><td colspan="3">${payment.yyyy}-${payment.mm}-${payment.dd}</td>
		        	</tr> 
		            <tr>
		                <th style="text-align: center">yyyy-mm-dd</th>
		                <th style="text-align: center">No</th>
		                <th style="text-align: center">항번</th>
		                <th style="text-align: center">지불방법</th>
		                <th style="text-align: center">금액</th>
		                <th style="text-align: center">비고</th>
		            </tr>
		            </thead>
		            <tbody>
          				<c:forEach var="payments" items="${payments}">
	            	<tr style="text-align: center;">
	            		 <c:choose>
	            		 	<c:when test="${payments.hang==0 && payments.no !=0}">
	            		 		<td style="vertical-align:middle"></td>
			        			<td style="vertical-align:middle"></td>
			        			<td style="vertical-align:middle"></td>
				                <td style="vertical-align:middle">소계</td>
				                <td style="vertical-align:middle">
				                	<font color="#0000ff">${payments.amount}</font>
				                </td>
				                <td style="vertical-align:middle"></td>
	            		 	</c:when>
	            		 	<c:when test="${payments.hang==0 && payments.no ==0}">
	            		 		<td style="vertical-align:middle"></td>
			        			<td style="vertical-align:middle"></td>
			        			<td style="vertical-align:middle"></td>
				                <td style="vertical-align:middle">총계</td>
				                <td style="vertical-align:middle">
				                	<font color="#ff0000">${payments.amount}</font>
				                </td>
				                <td style="vertical-align:middle"></td>
	            		 	</c:when>
	            		 	<c:otherwise>
			        			<td style="vertical-align:middle">${payments.yyyy}-${payments.mm}-${payments.dd}</td>
			        			<td style="vertical-align:middle">${payments.no}</td>
			        			<td style="vertical-align:middle">${payments.hang}</td>
				                <td style="vertical-align:middle">
				                	<a href="#" onclick="paymentselectedSeq(${payments.seq});">${payments.payway}</a>
			                	</td>
				                <td style="vertical-align:middle">${payments.amount}</td>
				                <td style="vertical-align:middle">${payments.memo}</td>
			            	</c:otherwise>
				    	</c:choose>         
	                </tr>
               		</c:forEach>
               		</tbody>
	          	</table>
		 		</div>
			</div>
		</div>
		<div class="col-md-1"></div>
		</form>
		<div class="row" style="margin-top:10px;color:#040044">
		<form id="paymentsearch_form" action="paymentSearch" method="get">
			<div class="col-md-1"></div>
		 	<div class="col-md-10" style="text-align:center;">
		 		<button type="button" id="paymentsave" class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i> &nbsp&nbspSave&nbsp&nbsp</button>
	 			<button type="reset" id="paymentreset" class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i> Reset</button>
	 			<button type="button" id="paymentupdate" class="btn btn-success" 
	 				style="display: none;">
	 				<i class="fa fa-eraser" aria-hidden="true"></i> 
	 				Update
	 			</button>
	 			<button type="button" class="btn btn-default" onclick="location.href='index'"><i class="fa fa-reply" aria-hidden="true"></i> Cancel</button>
	 			<button type="button" style="margin-left: 30px" class="btn btn-danger" onclick="location.href='paymentInsertForm'">
	 				<i class="fa fa-hacker-news" aria-hidden="true"></i> New
	 			</button>
	 			<button type="button" id="paymentdelete" class="btn btn-warning" 
	 				style="display: none;">
	 				<i class="far fa-trash-alt"></i>
	 				Delete
	 			</button>
		 		<select id="paymentsearchvender" name="vendcode" style="margin-left: 100px;text-align:center;vertical-align: middle;">
					 <c:forEach var="vender" items="${venders}">
					 	<option value="${vender.code}">${vender.name}</option>
					 </c:forEach>
				</select>
				<input type="text"  name="yyyy" size="4" id="searchyyyy" placeholder="yyyy" style="text-align:center;vertical-align: middle;">-
	 			
	 			<select name="mm" id="searchmm">
	 				<c:forEach var="i" begin="1" end="12" step="1" >
			            <option value="${i}">${i}</option>
			        </c:forEach>
	 			</select>
	 			<select name="dd" id="searchdd">
	 				<c:forEach var="i" begin="0" end="31" step="1" >
			            <option value="${i}">${i}</option>
			        </c:forEach>
	 			</select>
	 			<button type="button" id="paymentsearch_btn" class="btn btn-info">
	 				<i class="fa fa-search" aria-hidden="true"></i> 검색
	 			</button>
		 	</div> 
		 	<div class="col-md-1"></div>
		 </form>
		</div>
	</div>
	
	<div id="paymentModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">지불 Check</h4>
				</div>
				<div class="modal-body">
				<p><span id="modalmsgvender">  </span>
				<p><span id="modalmsgproduct"> </span>
				<p><span id="modalmsg"></span>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" id="usebtn" class="btn btn-danger"
					 data-dismiss="modal">확인</button>
					<button type="button" id="cancelbtn" class="btn btn-info"
					 style="display: none;" data-dismiss="modal">취소</button> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>