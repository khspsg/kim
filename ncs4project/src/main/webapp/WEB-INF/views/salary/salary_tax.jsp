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
<form class="salarytax_form" name="salarytax_form" 
			method="post" 
			role="form" data-parsley-validate="true">
	<div class="container">
		<div class="row" style="margin-top:30px;color:#040044"">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="text-align: center">
				<h1><i class="fa fa-money" aria-hidden="true"></i> Salary Tax</h1>
			</div>
			<div class="col-md-4"></div>
		</div>
		
		<div class="row" style="margin-top:30px"> 
		 	<div class="col-md-4"></div>
		 	<div class="col-md-4">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-calendar-plus-o" aria-hidden="true"></i> 처리년도&nbsp&nbsp&nbsp&nbsp</span>
						<input name="yyyy" id="taxyyyy" class="form-control" type="text" size="20"
							maxlength="6" placeholder="yyyy" data-parsley-type="number" value="${yyyy}"
							required="true" data-parsley-error-message="숫자4자리 년도를 입력하세요!"
							data-parsley-errors-container="div[id='yyyyError']"/>
					</div>
		 		</div>	 
		 	</div>
		</div> 
		<div class="row"> 
		 	<div class="col-md-4"></div>
		 	<div class="col-md-4">
		 		<div id="yyyyError" style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		<div class="row" style="margin-top:30px"> 
		 	<div class="col-md-4"></div>
		 	<div class="col-md-4">
		 		<div>
		 			<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-calendar-plus-o" aria-hidden="true"></i> 처리 월&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<select name="mm" id="taxmm" class= "form-control">
	                    	<c:forEach var="i" begin="1" end="12" step="1" >
					            <option value="${i}">${i}</option>
					        </c:forEach>
	                  	</select> 
					</div>
		 		</div>	 
		 	</div>
		</div> 
		<div class="row"> 
		 	<div class="col-md-4"></div>
		 	<div class="col-md-4">
		 		<div id="mmError" style="color:#f00">
		 		</div> 
		 	</div>
		</div>
		
		 
		<!-- phone insert tag end --> 
		<div class="row" style="margin-top:30px">  
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align:center">
		 		<div>
		 			<button type="button" id="salarytaxbtn" class="btn btn-success"><i class="fa fa-creative-commons" aria-hidden="true"></i> &nbsp&nbsp급여생성&nbsp&nbsp</button>
		 			<button type="button" id="salarytaxdel" class="btn btn-danger" ><i class="fa fa-trash" aria-hidden="true"></i> &nbsp&nbsp생성삭제&nbsp&nbsp</button>
		 			<button type="button" class="btn btn-info" onclick="location.href='index'"><i class="fa fa-reply" aria-hidden="true"></i> 취소</button>
		 		</div>	 
		 	</div>
		</div>
		
	</div>
	
	<div id="salarytaxModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">급여계산 Check</h4>
				</div>
				<div class="modal-body">
				<p><span id="modalmsg"> Some text in modal</span>
				<p><span id="modalmsgnew"> </span>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" id="taxbtn" class="btn btn-success"
					 data-dismiss="modal">확인</button>
					<button type="button" id="taxcancelbtn"  class="btn btn-danger"
					 data-dismiss="modal">취소</button> 
					 
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>