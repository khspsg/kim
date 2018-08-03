<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buy List</title>
</head>
<body>
<form id="buylist_delete" action="buyListDelete" method="post">
	<div class="pre-scrollable" style="margin-top: 10px;height: 450px">
		<table class="table table-striped table-bordered" >
       	<thead>
       	<tr align="left">
       		<td colspan="3">${buy.vendname}(${buy.vendcode})</td><td colspan="3">${buy.yyyy}-${buy.mm}-${buy.dd}</td>
       	</tr> 
           <tr>
               <th style="text-align: center">매입번호</th>
               <th style="text-align: center">거래처코드</th>
               <th style="text-align: center">거래처명</th>
               <th style="text-align: center">상품코드</th>
               <th style="text-align: center">상품명</th>
               <th style="text-align: center">단가</th>
               <th style="text-align: center">수량</th>
               <th style="text-align: center">금액</th>
               <th style="text-align: center">비고</th>
           </tr>
           </thead>
           <tbody>
     	   <c:forEach var="buy" items="${buys}">
           		<tr style="text-align: center;">
          		<c:choose>
        		<c:when test="${(buy.vendcode != null) && (buy.no != 0) && buy.hang==0 }">
        			<td> </td>
        			<td> </td>
        			<td> </td>
        			<td> </td>
        			<td style="background-color: #90a4ae;color:#fff">소  계</td>
        			<td style="background-color: #90a4ae;color:#fff"> </td>
	                <td style="background-color: #90a4ae;color:#fff"> </td>
	                <td style="background-color: #90a4ae;color:#fff">${buy.total}</td>
	                <td style="background-color: #90a4ae;color:#fff"> </td>
        		</c:when>
        		<c:when test="${ buy.vendcode != null && buy.no == 0 && buy.hang == 0 }">
        			<td> </td>
        			<td> </td>
        			<td> </td>
        			<td> </td>
        			<td style="background-color: #90a4ae;color:#fff">거래처 합계</td>
        			<td style="background-color: #90a4ae;color:#fff"> </td>
	                <td style="background-color: #90a4ae;color:#fff"> </td>
	                <td style="background-color: #90a4ae;color:#fff">${buy.total}</td>
	                <td style="background-color: #90a4ae;color:#fff"> </td>
        		</c:when>
        		<c:when test="${(buy.vendcode == null && buy.no == 0 && buy.hang == 0) || (buy.vendcode == null && buy.no != 0 && buy.hang == 0) }">
        			<td></td>
        			<td> </td>
        			<td> </td>
        			<td> </td>
        			<td style="background-color: #90a4ae;color:#fff">총  계</td>
        			<td style="background-color: #90a4ae;color:#fff"> </td>
	                <td style="background-color: #90a4ae;color:#fff"> </td>
	                <td style="background-color: #90a4ae;color:#fff">${buy.total}</td>
	                <td style="background-color: #90a4ae;color:#fff"> </td>
        		</c:when>
        		
        		<c:otherwise>	
        			<td style="vertical-align:middle">
        				${buy.yyyy}-${buy.mm}-${buy.dd}-${buy.no}-${buy.hang}
        			</td>
        			<td style="vertical-align:middle">${buy.vendcode}</td>
	                <td style="vertical-align:middle">${buy.vendname}</td>
	                <td style="vertical-align:middle">${buy.procode}</td>
	                <td style="vertical-align:middle">${buy.proname}</td>
	                <td style="vertical-align:middle">${buy.price}</td>
	                <td style="vertical-align:middle">${buy.qty}</td>
	                <td style="vertical-align:middle">${buy.total}</td>
	                <td style="vertical-align:middle">${buy.memo}</td>
        		</c:otherwise>
        	</c:choose>
         	</tr>
         </c:forEach>
         </tbody>
        	</table>
	</div>
    <div id="salarydelModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Delete Check</h4>
				</div>
				<div class="modal-body">
				<p><span id="modalmsg"> Some text in modal</span>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" id="usebtn" class="btn btn-success"
					 data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
    
</form>
</body>
</html>