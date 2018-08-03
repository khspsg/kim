<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<!-- decare  decorator:getProperty property="page.local_script" 
     in layout.jsp then beetween content tag content end tag can 
     seperate use js or style -->

<head>
  <title>Home</title>
</head>
<body >
<form name="index_form" action="main" method="post">
	<div class="container">
		<div class="row col-md-12" style="margin-top:50px">
			<div class="container" align="center">
    <!-- Indicators -->
		    <div id="myCarousel" class="carousel slide" data-ride="carousel">
		        <!-- Wrapper for slides -->
		        <div class="carousel-inner" role="listbox">
			        <c:forEach var="launchers" items="${launchers}" varStatus="status">
			        	<c:choose>
						  	<c:when test="${status.first}">
						     	<div class="item active">
						  	</c:when>
						  	<c:otherwise>
						     	<div class="item">
						  	</c:otherwise>
						</c:choose>
		                <img src="${launchers}" style="width:100%;height:300px" alt="Korea">
		                <div class="carousel-caption">
<!-- 		                    <h3>Header of Slide 1</h3> -->
<!-- 		                    <p>Details of Slide 1. Lorem Ipsum Blah Blah Blah....</p> -->
		                </div>
		            </div>
		        </c:forEach>    
		        </div>
		        <!-- Left and right controls -->
		        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		            <span class="fa fa-angle-left" aria-hidden="true"></span>
		            <span class="sr-only">Previous</span>
		        </a>
		        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		            <span class="fa fa-angle-right" aria-hidden="true"></span>
		            <span class="sr-only">Next</span>
		        </a>
		        <ol class="carousel-indicators">
			        <c:forEach var="launchers" items="${launchers}" varStatus="loop">
		        		<c:choose>
						  	<c:when test="${status.first}">
						     	<li data-target="#myCarousel" data-slide-to="${loop.index}" class="active"></li>
						  	</c:when>
						  	<c:otherwise>
						     	<li data-target="#myCarousel" data-slide-to="${loop.index}"></li>
						  	</c:otherwise>
						</c:choose>
			        </c:forEach>
		        </ol>
		    </div>
		</div>	
	</div>
</form>
</body>
</html>
