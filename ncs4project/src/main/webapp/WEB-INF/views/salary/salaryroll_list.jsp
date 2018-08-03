<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<content tag="local_script">
<script type="text/javascript">
	$(document).ready(function(){
		$('.footer').hide();
	});
</script>
</content>
</head>
<body>
	<form action="salaryrollList" method="get" >
	<div class="container">
		<div class="row" style="margin-top:50px">
			<div class="col-md-1"></div>
			<div class="col-md-10" style="text-align: center;color:#040044">
				<h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i> SalaryRoll List</h1>
			</div>
		</div>
		<div class="row" style="margin-top:20px">
			<div class="col-md-12" style="text-align: center">
				<table class="table table-striped table-bordered" cellspacing="0" width="100%">
			        <thead>
			            <tr style="text-align: center">
			                <th>처리년월</th>
			                <th>부서</th>
			                <th>사원번호</th>
			                <th>이름</th>
			                <th>pay12</th>
			                <th>소득공제</th>
			                <th>소득금액</th>
			                <th>인적공제</th>
			                <th>연금보험</th>
			                <th>특별공제</th>
			                <th>과세표준</th>
			                <th>산출세액</th>
			                <th>세액공제</th>
			                <th>결정세액</th>
			                <th>간이세액</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<c:forEach var="roll" items="${rolls}">
				            <c:choose>
			        			<c:when test="${(roll.yyyy == '총계' && roll.yyyy == '총계')
			        			|| (roll.mm == '총계' && roll.empno == '부서소계')}">
			        				<tr style="text-align: left">
			        				</tr>
			        			</c:when>
			        			<c:otherwise>
			        				<tr style="text-align: left">
			        					<c:choose>
			        						<c:when test="${(roll.dept != '소계') && (roll.empno == '부서소계')}">
			        							<td class="text-center"> </td>
								                <td class="text-center"><font color="#002266">${roll.dept}</font></td>
								                <td class="text-center"><font color="#002266">${roll.empno}</font></td>
								                <td class="text-center"> </td>
			        						</c:when>
			        						<c:when test="${(roll.dept == '소계') && (roll.empno == '부서소계')}">
			        							<td class="text-center"> </td>
								                <td class="text-center"><font color="#670000">총계</font></td>
								                <td class="text-center"> </td>
								                <td class="text-center"> </td>
			        						</c:when>
			        						<c:otherwise>
			        							<td class="text-center">${roll.yyyy}-${roll.mm}</td>
								                <td class="text-center">${roll.dept}</td>
								                <td class="text-center">${roll.empno}</td>
								                <td class="text-center">${roll.name}</td>
			        						</c:otherwise>
			        					</c:choose>
						            	
						                
						                <td class="text-center">${roll.sumpay}</td>
						                <td class="text-center">${roll.incomededuction}</td>
						                <td class="text-center">${roll.incomeamount}</td>
						                <td class="text-center">${roll.personaldeduction}</td>
						                <td class="text-center">${roll.annuityinsurance}</td>
						                <td class="text-center">${roll.specialdeduction}</td>
						                <td class="text-center">${roll.standardamount}</td>
						                <td class="text-center">${roll.calculatedtax}</td>
						                <td class="text-center">${roll.incometaxdeduction}</td>
						                <td class="text-center">${roll.decidedtax}</td>
						                <td class="text-center">${roll.simpletax}</td>
						            </tr>
			        			</c:otherwise>
			        		</c:choose>
            			</c:forEach>
            		</tbody>
            	</table>
            
			</div>
		</div>
		<div class="row" style="margin-top:10px">  
		 	<div class="col-md-12" style="text-align:center">
		 		<span class="input-group form-control form-inline" style="border:0">
		 			<input type="text" name="yyyy" placeholder="yyyy" value="${yyyy}">
		 			<select name="mm">
		 				<c:forEach var="x" begin="1" end="12">
		 					<option value="${x}" <c:if test="${mm ==x}">selected</c:if> >${x}</option>
		 				</c:forEach>
		 			</select>
		 			<button type="submit" class="btn btn-info" ><i class="fa fa-search" aria-hidden="true" style="display:inline-block;" ></i> 검색</button>
		 		</span>
		 	</div>
		</div>
		
		<!-- Modal -->
		<div id="loginModal" class="modal fade" role="dialog">
		  	<div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			      	<div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">글삭제</h4>
			      	</div>
			      <div class="modal-body">
			      	<p><span id="modalmsg"><font color=red>삭제 하시겠습니까 ?</font></span></p>
			      </div>
			      <div class="modal-footer" style="text-align: center">
			      	<button type="button" id="del" class="btn btn-success" data-dismiss="modal">확인</button>
			        <button type="button" id="pass" class="btn btn-warning" data-dismiss="modal">취소</button>
			      </div>
			    </div>
		  	</div>
		</div> 
		
	</div>
		
	</form>
</body>
</html>