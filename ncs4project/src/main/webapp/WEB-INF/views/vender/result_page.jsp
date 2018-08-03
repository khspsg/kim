<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<form action="venderList" method="get">
		<div class="container">
			<div class="row" style="margin-top:70px">
				<div class="col-md-3"></div>
				<div class="col-md-6" style="text-align: center">
					<h1>Result Page</h1>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top:30px">
				<div class="col-md-3"></div>
				<div class="col-md-6" style="text-align: center">
					${msg}
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top:30px">  
		 	<div class="col-md-3"></div>
		 	<div class="col-md-6" style="text-align:center">
	 			<button type="submit" class="btn btn-primary" style="width:100%"><i class="fa fa-sign-in" aria-hidden="true"></i> &nbsp&nbsp 확인</button>
		 	</div>
		</div>	
		</div>
	</form>
</body>
</html>