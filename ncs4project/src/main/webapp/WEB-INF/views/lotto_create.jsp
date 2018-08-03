<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lotto</title>
<content tag="local_script">
<style>
	.lottoback_yello{
		background-color: #FDBB3C;
		border-radius: 30px 30px 30px 30px;
		border:1px solid blue;
		color: #ffffff;
	}
	.lottoback_blue{
		background-color: #3887DF;
		border-radius: 30px 30px 30px 30px;
		border:1px solid blue;
		color: #ffffff;
	}
	.lottoback_black{
		background-color: #5E5E5E;
		border-radius: 30px 30px 30px 30px;
		border:1px solid blue;
		color: #ffffff;
	}
</style>
 
</content>

</head>

<body>
<form id="login_form" name="login_form" action="lottoCreate"  method="get">
	<div class="container">
		<div class="row" style="margin-top:50px;color:#040044"">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="text-align: center">
				<h1><i class="fa fa-creative-commons" aria-hidden="true"></i> Lotto 생성</h1>
			</div>
			<div class="col-md-2"></div>
		</div>
			<div class="row" style="margin-top:30px"> 
			 	<div class="col-md-2"></div>
			 	<div class="col-md-8">
		 			<div class="col-md-12">
		 				<div class="col-md-3">
		 					번호
		 				</div>
		 				<div class="col-md-1">
		 					1
		 				</div>
		 				<div class="col-md-1">
		 					2
		 				</div>
		 				<div class="col-md-1">
		 					3
		 				</div>
		 				<div class="col-md-1">
		 					4
		 				</div>
		 				<div class="col-md-1">
		 					5
		 				</div>
		 				<div class="col-md-1">
		 					6
		 				</div>
<!-- 		 				<div class="col-md-3"> -->
<!-- 		 					보너스 -->
<!-- 		 				</div> -->
		 			</div>	 
			 	</div>
			</div>
			<c:forEach var="topmany" items="${topmanys}" begin="0" end="9" >
				<div class="row" style="margin-top:10px"> 
				 	<div class="col-md-2"></div>
				 	<div class="col-md-8">
			 			<div class="col-md-12">
			 				<div class="col-md-3">
			 					${topmany.topno}
			 				</div>
			 				<c:choose>
			 					<c:when test="${topmany.num1 le 10}">
			 						<div class="col-md-1 lottoback_yello">${topmany.num1}</div>
			 					</c:when>
			 					<c:when test="${topmany.num1 le 20}">
			 						<div class="col-md-1 lottoback_blue">${topmany.num1}</div>
			 					</c:when>
			 					<c:otherwise>
			 						<div class="col-md-1 lottoback_black">${topmany.num1}</div>
			 					</c:otherwise>
			 				</c:choose>
			 				
			 				
			 				<c:choose>
			 					<c:when test="${topmany.num2 le 10}">
			 						<div class="col-md-1 lottoback_yello">${topmany.num2}</div>
			 					</c:when>
			 					<c:when test="${topmany.num2 le 20}">
			 						<div class="col-md-1 lottoback_blue">${topmany.num2}</div>
			 					</c:when>
			 					<c:otherwise>
			 						<div class="col-md-1 lottoback_black">${topmany.num2}</div>
			 					</c:otherwise>
			 				</c:choose>
			 				
			 				<c:choose>
			 					<c:when test="${topmany.num3 le 10}">
			 						<div class="col-md-1 lottoback_yello">${topmany.num3}</div>
			 					</c:when>
			 					<c:when test="${topmany.num3 le 20}">
			 						<div class="col-md-1 lottoback_blue">${topmany.num3}</div>
			 					</c:when>
			 					<c:otherwise>
			 						<div class="col-md-1 lottoback_black">${topmany.num3}</div>
			 					</c:otherwise>
			 				</c:choose>
			 				
			 				<c:choose>
			 					<c:when test="${topmany.num4 le 10}">
			 						<div class="col-md-1 lottoback_yello">${topmany.num4}</div>
			 					</c:when>
			 					<c:when test="${topmany.num4 le 20}">
			 						<div class="col-md-1 lottoback_blue">${topmany.num4}</div>
			 					</c:when>
			 					<c:otherwise>
			 						<div class="col-md-1 lottoback_black">${topmany.num4}</div>
			 					</c:otherwise>
			 				</c:choose>
			 				
			 				<c:choose>
			 					<c:when test="${topmany.num5 le 10}">
			 						<div class="col-md-1 lottoback_yello">${topmany.num5}</div>
			 					</c:when>
			 					<c:when test="${topmany.num5 le 20}">
			 						<div class="col-md-1 lottoback_blue">${topmany.num5}</div>
			 					</c:when>
			 					<c:otherwise>
			 						<div class="col-md-1 lottoback_black">${topmany.num5}</div>
			 					</c:otherwise>
			 				</c:choose>
			 				
			 				<c:choose>
			 					<c:when test="${topmany.num6 le 10}">
			 						<div class="col-md-1 lottoback_yello">${topmany.num6}</div>
			 					</c:when>
			 					<c:when test="${topmany.num6 le 20}">
			 						<div class="col-md-1 lottoback_blue">${topmany.num6}</div>
			 					</c:when>
			 					<c:otherwise>
			 						<div class="col-md-1 lottoback_black">${topmany.num6}</div>
			 					</c:otherwise>
			 				</c:choose>
			 				 
			 				 
			 			</div>	 
				 	</div>
				</div>
			</c:forEach> 
		<div class="row" style="margin-top:30px">  
		 	<div class="col-md-2"></div>
		 	<div class="col-md-4" style="text-align:center">
	 			<button  type="button" id="append" class="btn btn-danger" onclick="location.href='lottoNewnoAppend'"  style="width:100%"><i class="fa fa-sign-in" aria-hidden="true"></i> &nbsp&nbsp 신규당첨번호 등록</button>
		 	</div>
		 	<div class="col-md-4" style="text-align:center">
	 			<button  id="create" class="btn btn-primary" style="width:100%"><i class="fa fa-sign-in" aria-hidden="true"></i> &nbsp&nbsp Lotto 생성</button>
		 	</div>
		</div>	
		 
	</div>
</form>
 
</body>
</html>