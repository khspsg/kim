<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
	<title>Home</title>
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
	 
</script>
<body>
<div class="container" style="margin-top: 50px">
    <a href="index.jsp">이동</a>
	<div class="row">
		<div class="col-md-9"></div>
		<div class="col-md-3">
		<label class="btn btn-warning" role="button"><a href="boardPageList">게시판</a></label>
		<c:choose>
		    <c:when test="${sessionemail == null}">
		    	<label class="btn btn-primary" role="button"><a href="loginForm"><font color="#ffffff">Login</font></a></label>
		    </c:when>
		    <c:otherwise>
		    	<label class="btn btn-primary" role="button" style="color: #fff">
                        <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown">
                        <img src="${sessionphoto}" class="rounded-circle"
								style="border: 1px solid;" width="30px" height="30px">
                       <font color="#ffffff"> ${sessionname} <i class="fa fa-angle-down"></i></font></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="memberUpdateForm?email=${sessionemail}">정보수정</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="logOut">Logout</a></li>
                        </ul>
		    	</label>
		    </c:otherwise>
		</c:choose>
			
		</div>
	</div>
	<div class="row" style="margin-top: 100px"> 
	</div>
	<c:forEach begin="1" end ="2" var="x" step="1">
		<div class="row" style="margin-top: 30px"> 
		    	<div class="col-md-3"></div>
		    	<div class="col-md-2" id="image${x}1">
		     		<a href="#"><img src="resources/images/image${x}1.jpg" class="rounded-circle"
							style="border: 1px solid;" width="140px" height="140px"></a>
		    	</div>
		    	<div class="col-md-2" id="image${x}2">
		     		<a href="#"><img src="resources/images/image${x}2.jpg" class="rounded-circle"
							style="border: 1px solid;" width="140px" height="140px"></a>
		    	</div>
		    	<div class="col-md-2" id="image${x}3">
		     		<a href="#"><img src="resources/images/image${x}3.jpg" class="rounded-circle"
							style="border: 1px solid;" width="140px" height="140px"></a>
		    	</div>
		    	<div class="col-md-3"></div>
		  	</div>
		
	</c:forEach>
</div> 
</body>
</html>
