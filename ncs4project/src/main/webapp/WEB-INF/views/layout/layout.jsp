<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<head>
<content tag="local_script">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Itschool ncs3
    </title>
    <link rel="icon" href="resources/images/favicon.ico" />
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="resources/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="resources/assets/css/style.css" rel="stylesheet" />
    <link href="resources/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link href="resources/bootstrap-3.3.7-dist/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="resources/bootstrap-3.3.7-dist/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="resources/bootstrap-3.3.7-dist/css/itschool.css" rel="stylesheet">
    
    <script src="resources/js/ncs3.js"></script>
    <style>
    	.menu-section {
		    background-color: #f7f7f7;
		    border-bottom: 5px solid #1D0C47;
		    width: 100%;
		}
		@media screen and (max-height: 900px) {
            .footer{
              	display: none;
            }
       }
    </style>
</content>
</head>
<body class="main-header">
<div class="contatiner">
    <div id="wrapper">
        <!-- Navigation -->
        <page:applyDecorator name="layoutheader" />
        
       	<div class="container-fluid" align="center">
        	<div id="page-wrapper" style="background-color:#fff; display: inline-block;text-align: center;">
				<decorator:body/>
			</div>
        </div>    
        <!-- /#page-wrapper -->
		
    </div>
    <!-- /#wrapper -->
	<div class="footer navbar-fixed-bottom" style="margin-top:50px;text-align: center !important;width:100%">
		<div class="col-md-3">
			<img src="resources/images/customdiscussion.png" width="200" height="100"/>
		</div>
		<div class="col-md-6" style="text-align: left">
			주)솔루션테크 대표이사 배수환.  개인정보 관리 책임자 백승구 email: help@itschool.or.kr <br>
		 	주소 (35300) 대전광역시 서구 계룡로 636(용문동,도산빌딩7층) 대표번호 042)525-2666 Fax 042)522-9666<br>
		            ⓒ Copyright  2018 Itschool All rights reserved.
		</div>
		<div class="col-md-3"></div>
	</div>
</div>	
	
	 <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="resources/assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="resources/assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script type="text/javascript" src="resources/bootstrap-3.3.7-dist/js/moment.min.js"></script>
    <script src="resources/assets/js/custom.js"></script>
    <script src="resources/js/ncs3.js"></script>
    
<!--     <script src="resources/bootstrap-3.3.7-dist/js/itschool.js"></script> -->
    <script src="resources/bootstrap-3.3.7-dist/js/parsley.min.js"></script>
    <script src="resources/bootstrap-3.3.7-dist/js/jquery.dataTables.min.js"></script>
  	<script src="resources/bootstrap-3.3.7-dist/js/dataTables.bootstrap.min.js"></script>
  	<script src="resources/bootstrap-3.3.7-dist/js/dataTables.buttons.min.js"></script>
  	<script src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
  	<script type="text/javascript" src="resources/bootstrap-3.3.7-dist/js/moment.min.js"></script>
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <decorator:getProperty property="page.local_script"/>
</body>
</html>
