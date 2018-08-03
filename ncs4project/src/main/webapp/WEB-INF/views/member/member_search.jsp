<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
</head>
<script type="text/javascript">
	 
	$(document).ready(function(){
		 
		 
	});
</script>
<body>
	<form name="member_search" id="member_search" 
		method="post" action="memberSearch">
		<div class="container">
			<div class="row" style="margin-top: 50px; color: #040044">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="text-align: center">
					<h1>Member Search</h1>
				</div>
				<div class="col-md-2"></div>
			</div>
			<table class="table table-striped table-bordered" 
				 cellspacing="0" width="100%">
			<c:forEach var="member" items="${members}"  varStatus="status">
				<c:if test="${member.photo != null }">
					<tr>
						<td><img src="${member.photo}" class="rounded-circle"
								style="border: 1px solid;" width="40px" height="40px">
						</td>
						<td style="text-align: left;vertical-align: middle;">
			                	<a href="memberUpdateForm?email=${member.email}">${member.email}</a>
		                </td>
		                <td style="text-align: left;vertical-align: middle;">${member.name}</td>
		                <td style="text-align: left;vertical-align: middle;">${member.phone1}-${member.phone2}-${member.phone3}</td>
					</tr>
				</c:if>
			</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>