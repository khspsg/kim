<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
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
<body>
<form id="login_form4" name="login_form4" action="login4"  method="post">
     
     <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>${title}</title>
        <style>
            //removing style,you can see complete css in the attached source.
        </style>
</head>
<body>
<br/><br/><br/><br/>
<div class="login-block">
    <form name='loginForm'
                  action="<c:url value='../j_spring_security_check' />" method='POST'>
        <h1>Login</h1><br>
        	<label for="id" class="lab_g ">아&nbsp&nbsp&nbsp이&nbsp&nbsp&nbsp디&nbsp&nbsp</label>
        <input type="text" id="username" name="username" placeholder="Username"  /><br>
        <label for="id" class="lab_g ">비&nbsp밀&nbsp번&nbsp호&nbsp&nbsp</label>
        <input type="password" id="password" name="password" placeholder="Password" /><br><br>
        <button class="btn btn-primary btn-block" >LOGIN</button>
    </form>
</div>
</body>
     </form>
</body>
</html>
