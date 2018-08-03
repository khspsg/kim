<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>balance List</title>
</head>
<body>
<form id="balance_list" action="balanceList" method="get">
	<h1> 거래현황 </h1>
	<table id="examplebalance" class="table table-striped table-bordered" cellspacing="0" width="100%">
        	<thead>
            <tr>
                <th>년도</th>
                <th>거래처명</th>
                <th>전월이월</th>
                <th>거래금액</th>
                <th>현금지불</th>
                <th>어음지불</th>
                <th>카드지불</th>
                <th>기타지불</th>
                <th>현재잔액</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="balance" items="${balances}">
            	<tr style="text-align: center;">
	                <td style="vertical-align:middle">${balance.yyyy}</td>
	                <td style="vertical-align:middle">
	                	<a href="balanceDetail?yyyy=${balance.yyyy}&vendcode=${balance.vendcode}">${balance.vendname}</a>
	                </td>
	                <td style="vertical-align:middle">${balance.preyybalance}</td>
	                <td style="vertical-align:middle">${balance.dealtot}</td>
	                <td style="vertical-align:middle">${balance.cashtot}</td>
	                <td style="vertical-align:middle">${balance.checktot}</td>
	                <td style="vertical-align:middle">${balance.cardtot}</td>
	                <td style="vertical-align:middle">${balance.etctot}</td>
	                <td style="vertical-align:middle">${balance.balance}</td>
	            </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            	<tr>
            		<td colspan="9">
            		 	<div class="input-group">
							<span class="input-group-addon">
								<i class="fa fa-search" aria-hidden="true"></i></span>
							<input name="yyyy" id="yyyy" class="form-control"
							 type="text" size="16" placeholder="yyyy""/>
						</div>
						<button type="submit" class="btn btn-info">검색</button>
            		</td>
            	</tr>
            </tfoot>
    </table>
     
</form>
</body>
</html>