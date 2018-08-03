<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="memberinsert_form3" name="memberinput_form3"
		action="memberInsert3" method="post" role="form"
		data-parsley-validate="true">
		<div class="container"  >
			<div class="row" style="margin-top: 50px; color: #040044">
				<div class="col-md-3"></div>
				<div class="col-md-6" style="text-align: center" >
					<h1>
						<i class="fa fa-sign-in" aria-hidden="true"></i> 회원가입
					</h1>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>

		<div class="row" style="margin-top: 30px">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="text-align: left">
				<div>
					<tr>
						<td id="title">성&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp별</td>&nbsp&nbsp&nbsp&nbsp&nbsp

						<td><input type="radio" name="gender" value="남" checked><font
							color="#228B22">남&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font>
							<input type="radio" name="gender" value="여" checked><font
							color="#FF00FF">여</font></td>
					</tr>
				</div>
			</div>
		</div>

		<div class="row" style="margin-top: 30px">
			<div class="col-md-2"></div>
			<div class="col-md-4" style="text-align: left">
				<div>
					<tr>
						<td id="title">생&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp일</td>&nbsp&nbsp&nbsp&nbsp&nbsp

						<td><input type="text" name="birthyy" maxlength="4"
							placeholder="년(4자)" size="6"> <select name="birthmm">
								<option value="">월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select> <select name="birthmm">
								<option value="">일</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
						</select></td>
					</tr>
				</div>
			</div>
		</div>


		<div class="row" style="margin-top: 20px">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="text-align: left">
				<div>
					<tr>
						<td id="title">전&nbsp화&nbsp&nbsp&nbsp번&nbsp호</td>&nbsp&nbsp&nbsp

						<td><select name="mail2">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>019</option>

						</select>- <input type="text" name="phone" />- <input type="text"
							name="phone" /></td>
					</tr>
				</div>
			</div>
		</div>


		<div class="row" style="margin-top: 20px">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="text-align: left">
				<div>
					<tr>
						<td id="title">주&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp소</td>&nbsp&nbsp&nbsp&nbsp&nbsp

						<td><input type="text" size="50" name="address" /></td>
					</tr>
				</div>
			</div>
		</div>
		
		<div class="row" style="margin-top: 30px">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="text-align: left">
				<div>
					<tr>
						<td id="title">선&nbsp호&nbsp&nbsp&nbsp장&nbsp르</td>&nbsp&nbsp&nbsp

						<td><input type="radio" name="gender" value="코미디" checked><font
							color="#228B22">코미디&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font>
							<input type="radio" name="gender" value="액션" checked><font
							color="#FF00FF">액션&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font></td>
							<input type="radio" name="gender" value="멜로" checked><font
							color="#228B22">멜로&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</font>
							<input type="radio" name="gender" value="드라마" checked><font
							color="#FF00FF">드라마</font></td>
					</tr>
				</div>
			</div>
		</div>


		<br> <input type="submit" class="btn btn-info" value="가입" /> <input
			type="button" class="btn btn-success" value="취소">




	</form>
</body>
</html>