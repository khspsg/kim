<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
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
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-2">
				<a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown">
	                	로그인 회원가입
	                </a>
	                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="login2">로그인1</a></li>
				 <li role="presentation"><a role="menuitem" tabindex="-1" href="login3">게시판</a></li>
				 <li role="presentation"><a role="menuitem" tabindex="-1" href="login4">로그인3</a></li>
				 <li role="presentation"><a role="menuitem" tabindex="-1" href="login5">로그인4</a></li>
				 <li role="presentation"><a role="menuitem" tabindex="-1" href="login6">회원가입11</a></li>
				 <li role="presentation"><a role="menuitem" tabindex="-1" href="memberInsert1">회원가입1</a></li>
				 <li role="presentation"><a role="menuitem" tabindex="-1" href="memberInsert2">회원가입2</a></li>
				 <li role="presentation"><a role="menuitem" tabindex="-1" href="memberInsert3">회원가입22</a></li>
				</div>
				
				
				<div class="col-md-2">
	                	<a href="jfreeChart" >
	                	통계
	                </a>
				</div>
				<div class="col-md-2">
					<a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown">
	                	물류관리
	                </a>
	                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="buyInsertForm">매입</a></li>
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="paymentInsertForm">대금지불</a></li>
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="balanceList?yyyy">거래현황</a></li>
	                </ul> 
				</div>
				<div class="col-md-2">
					<a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown">
	                	거래처관리
	                </a>
	                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="venderInsertForm">거래처등록</a></li>
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="venderList">거래처검색</a></li>
	                </ul> 
				</div>
				<div class="col-md-2">
					<a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown">
	                	상품관리
	                </a>
	                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="productInsertForm">상품등록</a></li>
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="productListBook">상품검색</a></li>
	                </ul> 
				</div>
				<div class="col-md-2">
	                <a href="#" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown">
	                	급여관리
	                </a>
	                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="salaryInsertForm">급여등록</a></li>
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="salaryList">급여검색</a></li>
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="salaryTaxForm">급여계산</a></li>
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="salaryrollList?yyyy=${yyyy}+&mm=${mm}">SalaryRoll L
	                    <li role="presentation"><a role="menuitem" tabindex="-1" href="logOut">Logout</a></li>
	                </ul>
				</div>
			</div>
		</div>
	</div>
    </div>
</body>
</html>