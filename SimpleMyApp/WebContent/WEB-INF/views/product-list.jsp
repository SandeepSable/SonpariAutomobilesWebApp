<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<link href="./static/datatable/bootstrap.min.css" rel="stylesheet">
<script src="./static/datatable/jquery.min.js"></script>
<link rel="stylesheet" href="./static/datatable/jquery.dataTables.min.css">
<script type="text/javascript" src="./static/datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="./static/datatable/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() 
	{
		$('#example').DataTable();
	});
</script>
</head>

<body>
	<div class="" style="position: relative;">
		<div class="">
			<!-- Default panel contents -->
			<table id="example" class="display" width="100%" cellspacing="0" style="font-family: Shivaji01;">
				<thead>
					<tr>
						<th>Anau k`maaMk</th>
						<th>vastucao naava</th>
						<th>pyaa-yaI naava</th>
						<th>saivastr maihtI</th>
						<th>kMpnaIcao naava</th>
						<th>ikMmat</th>
						<th>sTaok</th>
						<th>hmaI</th>
						<th>Saasanaacaa kr</th>
						<th>zovalaolao izkaNa</th>
						<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
							<th width="100">badla kra</th>
						</sec:authorize>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="product">
						<tr>
							<td>${product.productId}</td>
							<td>${product.productName}</td>
							<td>${product.aliasName}</td>
							<td>${product.description}</td>
							<td>${product.manufacturerName}</td>
							<td>${product.price}</td>
							<td>${product.stock}</td>
							<td>${product.warrenty}</td>
							<td>${product.gstTax}</td>
							<td>${product.storageLocation}</td>
							<sec:authorize access="hasAnyRole('ADMIN', 'DBA')">
								<td nowrap="nowrap"> 
								 <a	href="<c:url value='/edit-product-${product.productId}' />"	class="btn btn-success custom-width">badla kra</a>
								 <a href="<c:url value='/delete-product-${product.productId}' />" class="btn btn-danger custom-width">kaZuna Taka</a>
								</td>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ADMIN','DBA')">
								<td colspan="1">
							</sec:authorize>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
			<div class="" style="background: navy; ; height: 1%; font-size: 20px; vertical-align: middle; ">
				<a style="font-family: Shivaji01;" href="<c:url value='/add-product' />">naivana tyaar kra</a>
			</div>
		</sec:authorize>
	</div>
</body>
</html>