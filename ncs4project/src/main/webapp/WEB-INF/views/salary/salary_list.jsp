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
<form id="salary_delete" action="salaryDelete" method="post">
	<table id="examplesalary" class="table table-striped table-bordered" cellspacing="0" width="100%">
        	<thead>
	            <tr>
	                <th width="5"><input type="checkbox" id="allchk"></th>
	                <th>사원번호</th>
	                <th>부서</th>
	                <th>성명</th>
	                <th>기본급</th>
	                <th>수당</th>
	                <th>배우자</th>
	                <th>부양20</th>
	                <th>부양60</th>
	                <th>장애자</th>
	                <th>부녀가장</th>
	                <th>처리유무</th>
	            </tr>
            </thead>
            <tbody>
            <c:forEach var="salary" items="${salarys}">
            	<tr style="text-align: left">
            		<td width="5"><input type="checkbox" id="unitchk" name="unitchk" value="${salary.empno}"></td>
	                <td class="text-center">
	                	<a href="salaryUpdateForm?empno=${salary.empno}">
	                	${salary.empno}
	                	</a>
	                </td>
	                <td>${salary.dept}</td>
	                <td>${salary.name}</td>
	                <td class="text-center">${salary.pay}</td>
	                <td class="text-center">${salary.extra}</td>
	                <td class="text-center">${salary.partner}</td>
	                <td class="text-center">${salary.dependent20}</td>
	                <td class="text-center">${salary.dependent60}</td>
	                <td class="text-center">${salary.disabled}</td>
	                <td class="text-center">${salary.womanpower}</td>
	                <td class="text-center">${salary.yn}</td>
	            </tr>
            </c:forEach>
            </tbody>
        
    </table>
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