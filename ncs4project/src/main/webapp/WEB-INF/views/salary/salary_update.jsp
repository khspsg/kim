<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="salaryupdate_form" name="memberupdate_form" 
			action="salaryUpdate" method="post" enctype="multipart/form-data"
			role="form" data-parsley-validate="true">
	<div class="container">
		<div class="row" style="margin-top:30px;color:#040044"">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<h1>Salary Update</h1>
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row" style="margin-top:30px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-user-circle-o" aria-hidden="true"></i> 사원번호&nbsp&nbsp&nbsp&nbsp</span>
						<input name="empno" id="empno" class="form-control" type="text" size="20" value="${salary.empno}"
							readonly="readonly"/>
					</div>
		 		</div>	 
		 	</div>
		</div> 
		
		<div class="row"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div id="empnoError" style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-user" aria-hidden="true"></i>  &nbsp이 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 름&nbsp&nbsp</span>
						<input name="name" id="name" class="form-control"
						 type="text" size="16" value="${salary.name}"
						 required="true" data-parsley-error-message="이름을 입력하세요!"
						 data-parsley-errors-container="div[id='nameError']"/>
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
							<i class="fa fa-building" aria-hidden="true"></i>  &nbsp부 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 서&nbsp&nbsp</span>
						<select name="dept" class= "form-control">
							<option value="개발부" <c:if test="${salary.dept =='개발부'}">selected</c:if> >개발부</option>
							<option value="생산부" <c:if test="${salary.dept =='생산부'}">selected</c:if> >생산부</option>
							<option value="기획부" <c:if test="${salary.dept =='기획부'}">selected</c:if> >기획부</option>
							<option value="총무부" <c:if test="${salary.dept =='총무부'}">selected</c:if> >총무부</option>
	                  	</select> 
					</div>
		 		</div>	 
		 	</div>
		</div>
		<div class="row"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div id="nameError"  style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
		 		<div>
		 			<div class="input-group date" id='datetimepicker1'>
						<span class="input-group-addon">
							<i class="fa fa-calendar" aria-hidden="true"></i> &nbsp입사일자 &nbsp&nbsp</span>
						<input name="input_date" class="form-control" value="${salary.input_date}"/>
						<span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    	</span>
					</div>
		 		</div>	 
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px; text-align: center;" > 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="background-color: #3E4551">
		 		  <span style="color:white;">소득 내역</span>
		 	</div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
                <span class="col-md-6" style="text-align: left">
                	<div class="input-group">
	                    <span class= "input-group-addon"><i class="fa fa-money" aria-hidden="true"></i> 기본급&nbsp&nbsp</span>
	                  	<input type="text" name="pay" size="15" data-parsley-type="number" value="${salary.pay}"
							required="true" data-parsley-error-message="숫자만 입력하세요!">
	               </div>
                </span>
                <span class="col-md-6" style="text-align: right">
                	<div class="input-group">
	                    <span class= "input-group-addon"><i class="fa fa-credit-card-alt" aria-hidden="true"></i> 수당</span>
	                  	<input type="text" name="extra" size="15" data-parsley-type="number" value="${salary.extra}"
							required="true" data-parsley-error-message="숫자만 입력하세요!"> 
	               </div>
                </span>
            </div>
		</div>
		<div class="row" style="margin-top:10px; text-align: center;" > 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="background-color: #ffbb33">
		 		  부양 가족 공제
		 	</div>
		</div>
		
		<!-- dependent insert tag start -->
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
                <span class="col-md-6" style="text-align: left">
                	<div class="input-group">
	                    <span class= "input-group-addon"><i class="fa fa-venus-mars" aria-hidden="true"></i> 배우자&nbsp&nbsp&nbsp&nbsp</span>
	                  	<select name="partner" class= "form-control">
	                  		<option value="0" <c:if test="${salary.partner =='0'}">selected</c:if> >0</option>
	                  		<option value="1" <c:if test="${salary.partner =='1'}">selected</c:if> >1</option>
	                  	</select>
	               </div>
                </span>
                <span class="col-md-6" style="text-align: right">
                	<div class="input-group">
	                    <span class= "input-group-addon"><i class="fa fa-child" aria-hidden="true"></i> 부양자20&nbsp</span>
	                  	<select name="dependent20" class= "form-control" >
	                  		<option value="0" <c:if test="${salary.dependent20 =='0'}">selected</c:if> >0</option>
	                  		<option value="1" <c:if test="${salary.dependent20 =='1'}">selected</c:if> >1</option>
	                  		<option value="2" <c:if test="${salary.dependent20 =='2'}">selected</c:if> >2</option>
	                  		<option value="3" <c:if test="${salary.dependent20 =='3'}">selected</c:if> >3</option>
	                  		<option value="4" <c:if test="${salary.dependent20 =='4'}">selected</c:if> >4</option>
	                  		<option value="5" <c:if test="${salary.dependent20 =='5'}">selected</c:if> >5</option>
	                  		<option value="6" <c:if test="${salary.dependent20 =='6'}">selected</c:if> >6</option>
	                  	</select>
	               </div>
                </span>
            </div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
                <span class="col-md-6" style="text-align: left">
                	<div class="input-group">
	                    <span class= "input-group-addon"><i class="fa fa-user-o" aria-hidden="true"></i> 부양자60</span>
	                  	<select name="dependent60" class= "form-control">
	                    	<option value="0" <c:if test="${salary.dependent60 =='0'}">selected</c:if> >0</option>
	                  		<option value="1" <c:if test="${salary.dependent60 =='1'}">selected</c:if> >1</option>
	                  		<option value="2" <c:if test="${salary.dependent60 =='2'}">selected</c:if> >2</option>
	                  		<option value="3" <c:if test="${salary.dependent60 =='3'}">selected</c:if> >3</option>
	                  		<option value="4" <c:if test="${salary.dependent60 =='4'}">selected</c:if> >4</option>
	                  		<option value="5" <c:if test="${salary.dependent60 =='5'}">selected</c:if> >5</option>
	                  		<option value="6" <c:if test="${salary.dependent60 =='6'}">selected</c:if> >6</option>
	                  	</select>
	               </div>
                </span>
                <span class="col-md-6" style="text-align: right">
                	<div class="input-group">
	                    <span class= "input-group-addon"><i class="fa fa-wheelchair" aria-hidden="true"></i> 장애인&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	                  	<select name="disabled" class= "form-control" >
	                    	<option value="0" <c:if test="${salary.disabled =='0'}">selected</c:if> >0</option>
	                  		<option value="1" <c:if test="${salary.disabled =='1'}">selected</c:if> >1</option>
	                  		<option value="2" <c:if test="${salary.disabled =='2'}">selected</c:if> >2</option>
	                  		<option value="3" <c:if test="${salary.disabled =='3'}">selected</c:if> >3</option>
	                  		<option value="4" <c:if test="${salary.disabled =='4'}">selected</c:if> >4</option>
	                  		<option value="5" <c:if test="${salary.disabled =='5'}">selected</c:if> >5</option>
	                  		<option value="6" <c:if test="${salary.disabled =='6'}">selected</c:if> >6</option>
	                  	</select>
	               </div>
                </span>
            </div>
		</div>
		
		<div class="row" style="margin-top:10px"> 
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6">
                <span class="col-md-6" style="text-align: left">
                	<div class="input-group">
	                    <span class= "input-group-addon"><i class="fa fa-female" aria-hidden="true"></i> 부녀가장</span>
	                  	<select name="womanpower" class= "form-control">
	                    	<option value="0" <c:if test="${salary.womanpower =='0'}">selected</c:if> >0</option>
	                  		<option value="1" <c:if test="${salary.womanpower =='1'}">selected</c:if> >1</option>
	                  	</select>
	               </div>
                </span>
                <span class="col-md-6" style="text-align: right">
                	 <div class="input-group">
	                    <span class= "input-group-addon"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> 급여계산</span>
	                  	<select name="yn" class= "form-control">
	                  		<option value="y" <c:if test="${salary.yn =='1'}">selected</c:if> >yes</option>
	                  		<option value="n" <c:if test="${salary.yn =='9'}">selected</c:if> >no</option>
	                  	</select>
	               </div>
                </span>
            </div>
		</div>
		
		<!-- phone insert tag end --> 
		<div class="row" style="margin-top:30px">  
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align:center">
		 		<div>
		 			<button class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i> &nbsp&nbspSave&nbsp&nbsp</button>
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
	
	<div id="empnoModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">사원번호 Check</h4>
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