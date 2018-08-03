<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Salary List</title>
</head>
<body>
<form id="vender_delete" action="venderList" method="post">
	<table id="examplevender" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th width="5"><input type="checkbox" id="allchk"></th>
                <th>code</th>
                <th>거래처명</th>
                <th>사업자번호</th>
                <th>대표자</th>
                <th>우편번호</th>
                <th>addr1</th>
                <th>addr2</th>
                <th>전화번호</th>
            </tr>
            <tbody>
            <c:forEach var="vender" items="${venders}">
            	<tr style="text-align: left">
            		<td width="5"><input type="checkbox" id="unitchk" name="unitchk" value="${vender.code}"></td>
	                <td class="text-center">
	                	<a href="venderUpdateForm?code=${vender.code}">
	                	${vender.code}
	                	</a>
	                </td>
	                <td>${vender.name}</td>
	                <td class="text-center">${vender.busno1}-${vender.busno2}-${vender.busno3}</td>
	                <td class="text-center">${vender.ceoname}</td>
	                <td class="text-center">${vender.zipcode}</td>
	                <td class="text-center">${vender.newaddr}</td>
	                <td class="text-center">${vender.detailaddr}</td>
	                <td class="text-center">${vender.officeno1}-${vender.officeno2}-${vender.officeno3}</td>
	            </tr>
            </c:forEach>
            </tbody>
        </thead>
    </table>
    <div id="venderdelModal" class="modal fade" role="dialog">
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