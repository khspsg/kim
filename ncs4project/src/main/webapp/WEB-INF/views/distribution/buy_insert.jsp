<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<form class="buyinsert_form" name="buyinput_form" 
			action="buyInsert" method="post"
			role="form" data-parsley-validate="true">
			
		<div class="row" style="margin-top:30px;color:#040044">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<h1><i class="fa fa-indent" aria-hidden="true"></i> 매입</h1>
			</div>
			<div class="col-md-3"></div>
		</div>
		<input type="hidden" name="vendname" id="vendname">
		<input type="hidden" name="seq" id="seq" value="0">
		<input type="hidden" name="beforeprocode" id="beforeprocode">
		<input type="hidden" name="beforeqty" id="beforeqty" value="0">
		<input type="hidden" name="beforeprice" id="beforeprice" value="0">
		<div class="row" style="margin-top:30px"> 
			<div class="col-md-1"></div>
		 	<div class="col-md-5">
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-creative-commons" aria-hidden="true"></i> 거래처&nbsp&nbsp&nbsp&nbsp</span>
						<select id="selectvender" class="form-control" name="vendcode">
							 <c:forEach var="vender" items="${venders}">
							 	<option value="${vender.code}" 
								 	<c:if test="${vender.code == buy.vendcode}">selected</c:if>>
								 	${vender.name}
								</option>
							 </c:forEach>
						</select>	
					</div>
		 		</div>
		 		
		 		<div  style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i> 매입번호</span>
						<input name="yyyy" id="yyyy" class="form-control" value="${buy.yyyy}"
						 type="text" size="10" maxlength="4" readonly="readonly"/>
						<span class="input-group-addon">-</span>
						<input name="mm" id="mm" class="form-control" value="${buy.mm}"
						 type="text" size="5"  maxlength="2" readonly="readonly"/>
						<span class="input-group-addon">-</span>
						<input name="dd" id="dd" class="form-control" value="${buy.dd}"
						 type="text" size="5"  maxlength="2" readonly="readonly"/>   	
						<span class="input-group-addon">-</span>
						<input name="no" id="no" class="form-control" value="${buy.no}"
						 type="text" size="5"  maxlength="2" readonly="readonly"/>
						<span class="input-group-addon">-</span>
						<input name="hang" id="hang" class="form-control" value="${buy.hang}"
						 type="text" size="5"  maxlength="3" readonly="readonly"/> 
					</div>
				</div>
					
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-product-hunt" aria-hidden="true"></i> 상&nbsp&nbsp품&nbsp&nbsp명</span>
						<select class="form-control" id="selectproduct">
							 <c:forEach var="product" items="${products}">
							 	<option value="${product.code}">
							 	${product.name}&nbsp&nbsp${product.capacity}</option>
							 </c:forEach>
						</select>	
					</div>
		 		</div>
		 		
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-codiepie" aria-hidden="true"></i> 상품코드</span>
						<input name="procode" id="procode" class="form-control"
						 type="text" size="25"  maxlength="13"/>
						<span class="input-group-addon">
							<i class="fa fa-hand-spock-o" aria-hidden="true"></i>현재재고</span></span>
						<input name="stock" id="stock" class="form-control" style="color:#f00"
						 type="text" size="4"  maxlength="2"/>	
					</div>
		 		</div>	
		 		
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-flask" aria-hidden="true"></i> 단&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp가</span>
						<input name="price" id="price" class="form-control"
						 type="text"  maxlength="10"/>
					</div>
		 		</div>
		 		
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-plus-circle" aria-hidden="true"></i> 수&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp량</span>
						<input name="qty" id="qty"  class="form-control" 
						 type="text" size="8"  maxlength="3"/>
					</div>
		 		</div>
		 		
		 		<div style="margin-top: 10px">
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-money" aria-hidden="true"></i> 금&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp액</span>
						<input name="amount" id="amount" class="form-control" value="0"
						 type="text" size="8"  maxlength="7"/>
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
			        		<td colspan="3">${buy.vendname}(${buy.vendcode})</td><td colspan="3">${buy.yyyy}-${buy.mm}-${buy.dd}</td>
			        	</tr> 
			            <tr>
			                <th style="text-align: center">yyyy-mm-dd</th>
			                <th style="text-align: center">No</th>
			                <th style="text-align: center">항번</th>
			                <th style="text-align: center">품명</th>
			                <th style="text-align: center">단가</th>
			                <th style="text-align: center">수량</th>
			                <th style="text-align: center">금액</th>
			            </tr>
			            </thead>
			            <tbody>
           				<c:forEach var="buys" items="${buys}">
		            	<tr style="text-align: center;">
		            		<c:choose>
				        		<c:when test="${buys.hang==0 && buys.no !=0}">
				        			<td style="vertical-align:middle"> </td>
				        			<td style="vertical-align:middle"> </td>
				        			<td style="vertical-align:middle"> </td>
					                <td style="vertical-align:middle;background-color: #90a4ae;color:#fff">소  계</td>
					                <td style="vertical-align:middle;background-color: #90a4ae;color:#fff"> </td>
					                <td style="vertical-align:middle;background-color: #90a4ae;color:#fff">${buys.qty}</td>
					                <td style="vertical-align:middle;background-color: #90a4ae;color:#fff">${buys.total}</td>
				        		</c:when>
				        		<c:when test="${buys.hang==0 && buys.no ==0}">
				        			<td style="vertical-align:middle"></td>
				        			<td style="vertical-align:middle"></td>
				        			<td style="vertical-align:middle"></td>
					                <td style="vertical-align:middle;background-color: #3E4551;color:#fff">총 계</td>
					                <td style="vertical-align:middle;background-color: #3E4551;color:#fff"></td>
					                <td style="vertical-align:middle;background-color: #3E4551;color:#fff">${buys.qty}</td>
					                <td style="vertical-align:middle;background-color: #3E4551;color:#fff">${buys.total}</td>
				        		</c:when>
				        		<c:otherwise>	
				        			<td style="vertical-align:middle">${buys.yyyy}-${buys.mm}-${buys.dd}</td>
				        			<td style="vertical-align:middle">${buys.no}</td>
				        			<td style="vertical-align:middle">${buys.hang}</td>
					                <td style="vertical-align:middle">
					                	<a href="#" onclick="selectedSeq(${buys.seq});">${buys.proname}</a>
					                </td>
					                <td style="vertical-align:middle">${buys.price}</td>
					                <td style="vertical-align:middle">${buys.qty}</td>
					                <td style="vertical-align:middle">${buys.total}</td>
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
		<form id="buysearch_form" action="buySearch" method="get">
			<div class="col-md-1"></div>
		 	<div class="col-md-10" style="text-align:center;">
		 		<button type="button" id="buysave" class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i> &nbsp&nbspSave&nbsp&nbsp</button>
	 			<button type="reset" id="buyreset" class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i> Reset</button>
	 			<button type="button" id="buyupdate" class="btn btn-success" 
	 				style="display: none;">
	 				<i class="fa fa-eraser" aria-hidden="true"></i> 
	 				Update
	 			</button>
	 			<button type="button" class="btn btn-default" onclick="location.href='index'"><i class="fa fa-reply" aria-hidden="true"></i> Cancel</button>
	 			<button type="button" style="margin-left: 30px" class="btn btn-danger" onclick="location.href='buyInsertForm'">
	 				<i class="fa fa-hacker-news" aria-hidden="true"></i> New
	 			</button>
	 			<button type="button" id="buydelete" class="btn btn-warning" 
	 				style="display: none;">
	 				<i class="far fa-trash-alt"></i>
	 				Delete
	 			</button>
		 		<select id="searchvender" name="searchvender" style="margin-left: 100px;text-align:center;vertical-align: middle;">
					 <c:forEach var="vender" items="${venders}">
					 	<option value="${vender.code}">${vender.name}</option>
					 </c:forEach>
				</select>
				<input type="text" size="8" name="searchyyyy" id="searchyyyy" placeholder="yyyy" style="text-align:center;vertical-align: middle;">-
	 			
	 			<select name="searchmm" id="searchmm">
	 				<c:forEach var="i" begin="1" end="12" step="1" >
			            <option value="${i}">${i}</option>
			        </c:forEach>
	 			</select>
	 			<select name="searchdd" id="searchdd">
	 				<c:forEach var="i" begin="0" end="31" step="1" >
			            <option value="${i}">${i}</option>
			        </c:forEach>
	 			</select>
	 			<button type="button" id="buysearch_btn" class="btn btn-info">
	 				<i class="fa fa-search" aria-hidden="true"></i> 검색
	 			</button>
		 	</div> 
		 	<div class="col-md-1"></div>
		 </form>
		</div>
	</div>
	
	<div id="buyModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">상품매입 Check</h4>
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