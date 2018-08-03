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
	<form id="login_form3" name="login_form3" action="login3" method="post">
		<div class="container">
			<div class="row" style="margin-top: 50px; color: #040044">
				<div class="col-md-12" style="text-align: left">
					<h1>
						<i class="fa fa-sign-in" aria-hidden="true"></i> 고객센터
					</h1>
				</div>
			</div>



			<div class="row" style="margin-top: 30px">
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<div style="margin-top: 10px">
						<div class="input-group">
							<a href="#seq?key" class="dropdown-toggle" id="ddlmenuItem"
								data-toggle="dropdown">FAQ</a>
								
						</div>
					</div>
					<div style="margin-top: 10px">
						<div class="input-group">
							<a href="#" class="dropdown-toggle" id="ddlmenuItem"
								data-toggle="dropdown">공지사항</a>
						</div>
					</div>
					<div style="margin-top: 10px">
						<div class="input-group">
							<a href="#" class="dropdown-toggle" id="ddlmenuItem"
								data-toggle="dropdown">1:1문의</a>
						</div>
					</div>
					<div style="margin-top: 10px">
						<div class="input-group">
							<a href="#" class="dropdown-toggle" id="ddlmenuItem"
								data-toggle="dropdown">관람/대관문의</a>
						</div>
					</div>
					<div style="margin-top: 10px">
						<div class="input-group">
							<a href="#" class="dropdown-toggle" id="ddlmenuItem"
								data-toggle="dropdown">분실물안내</a>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="pre-scrollable" style="margin-top: 10px; height: 450px">
						<table class="table table-striped table-bordered">
							<tbody>
								<c:forEach var="movs" items="${movs}">
									<tr style="text-align: center;">
										<c:choose>
											<c:when test="${movs.hang==0 && movs.no !=0}">
												<td
													style="vertical-align: middle; background-color: #90a4ae; color: #fff"><a
													href="movPageList"></a>항번</td>
												<td
													style="vertical-align: middle; background-color: #90a4ae; color: #fff">글쓴이</td>
												<td
													style="vertical-align: middle; background-color: #90a4ae; color: #fff">제목</td>
												<td
													style="vertical-align: middle; background-color: #90a4ae; color: #fff">첨부파일</td>
												<td
													style="vertical-align: middle; background-color: #90a4ae; color: #fff">작성일</td>
												<td
													style="vertical-align: middle; background-color: #90a4ae; color: #fff">조회수</td>
											</c:when>

										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>