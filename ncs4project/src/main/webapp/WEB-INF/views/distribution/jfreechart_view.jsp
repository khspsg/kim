<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<div class="row" style="margin-top:50px;color:#040044"">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<h1><i class="fa fa-sign-in" aria-hidden="true"></i> 실적 통계</h1>
			</div>
			<div class="col-md-3"></div>
			
			<div class="container">
		<div class="row" style="margin-top:50px;color:#040044"">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="text-align: center">
				<img src="${chartpath}"> 
			</div>
			<div class="col-md-3"></div>
</body>
</html>