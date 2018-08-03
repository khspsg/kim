<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product List</title>
</head>
<body>
<form id="product_delete" action="productDelete" method="post">
	<table id="exampleproduct" class="table table-striped table-bordered" cellspacing="0" width="100%">
        	<thead>
            <tr>
                <th width="5"><input type="checkbox" id="allchk"></th>
                <th>code</th>
                <th>품명</th>
                <th>전년말</th>
                <th>구분</th>
                <th>1월</th>
                <th>2월</th>
                <th>3월</th>
                <th>4월</th>
                <th>5월</th>
                <th>6월</th>
                <th>7월</th>
                <th>8월</th>
                <th>9월</th>
                <th>10월</th>
                <th>11월</th>
                <th>12월</th>
                <th>현재고</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${products}">
            	<tr style="text-align: center;">
            		<td width="5" style="vertical-align:middle">
            			<input type="checkbox" id="unitchk" name="unitchk" value="${product.code}">
            		</td>
	                <td class="text-center" style="vertical-align:middle">
                		<a href="productUpdateForm?code=${product.code}">
                		${product.code}
                		</a>
	                </td>
	                <td style="vertical-align:middle">${product.name}</td>
	                <td style="vertical-align:middle">${product.preyystock}</td>
	                <td class="text-center">
	                	<div style="background-color: #5bc0de;color:#fff">매입</div> 
	                	<div style="background-color: #428bca;color:#fff">매출</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy01}</div> 
	                	<div>${product.sale01}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy02}</div> 
	                	<div>${product.sale02}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy03}</div> 
	                	<div>${product.sale03}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy04}</div> 
	                	<div>${product.sale04}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy05}</div> 
	                	<div>${product.sale05}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy06}</div> 
	                	<div>${product.sale06}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy07}</div> 
	                	<div>${product.sale07}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy08}</div> 
	                	<div>${product.sale08}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy09}</div> 
	                	<div>${product.sale09}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy10}</div> 
	                	<div>${product.sale10}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy11}</div> 
	                	<div>${product.sale11}</div>
	                </td>
	                <td class="text-center">
	                	<div>${product.buy12}</div> 
	                	<div>${product.sale12}</div>
	                </td>
	                <td style="vertical-align:middle;background-color: #428bca;color:#fff">
	               		${product.stock}
	                </td>
	            </tr>
            </c:forEach>
            </tbody>
        
    </table>
    <div id="productdelModal" class="modal fade" role="dialog">
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