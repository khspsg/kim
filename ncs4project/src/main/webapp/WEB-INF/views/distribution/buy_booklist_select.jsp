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
<form class="buy_booklist_form" name="buy_booklist_form" 
			method="post" 
			role="form" data-parsley-validate="true">
	<div class="container">
		<div class="row" style="margin-top:30px;color:#040044"">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="text-align: center">
				<h1><i class="fa fa-money" aria-hidden="true"></i> 매입장</h1>
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
						<input name="searchyyyy" id="searchyyyy" class="form-control" type="text" size="20"
							maxlength="6" placeholder="yyyy" data-parsley-type="number" 
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
						<select name="searchmm" id="searchmm" class= "form-control">
	                    	<c:forEach var="i" begin="1" end="12" step="1" >
					            <option value="${i}">${i}</option>
					        </c:forEach>
	                  	</select> 
					</div>
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
						<select name="searchdd" id="searchdd" class= "form-control">
	                    	<c:forEach var="i" begin="1" end="31" step="1" >
					            <option value="${i}">${i}</option>
					        </c:forEach>
	                  	</select> 
					</div>
		 		</div>	 
		 	</div>
		</div> 
		 
		<!-- phone insert tag end --> 
		<div class="row" style="margin-top:30px">  
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align:center">
		 		<div>
		 			<button type="button" id="buybooklistdd" class="btn btn-success" ><i class="fa fa-stack-exchange" aria-hidden="true"></i> &nbsp&nbsp일 매입장&nbsp&nbsp</button>
		 			<button type="button" id="buybooklistmm" class="btn btn-danger"><i class="fa fa-bar-chart" aria-hidden="true"></i> &nbsp&nbsp월 매입장&nbsp&nbsp</button>
		 			<button type="button" class="btn btn-info" onclick="location.href='index'"><i class="fa fa-reply" aria-hidden="true"></i> 취소</button>
		 		</div>	 
		 	</div>
		</div>
		
	</div>
	
</form>
</body>
</html>