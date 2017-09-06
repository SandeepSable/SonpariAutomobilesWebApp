<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<link href="<c:url value='/static/css/bootstrap.css' />"rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<style>
td
{
    word-wrap: break-word;
}
</style>
</head>

<body>
	<%@include file="header.jsp"%>

	<div class="">
		<div class="">
			<!-- Default panel contents -->
			<div class="">
				<span class="">List of Products </span>
			</div>
			
			<table  border="1" style="table-layout: fixed; width: 100%; overflow: visible;">
				<thead>
					<tr>
						<th>Product Id</th>
						<th>Product Name</th>
						<th>Alias Name</th>
						<th>Description</th>
						<th>Manufacturer</th>
						<th>Price</th>
						<th>Warrenty</th>
						<th>GST Tax</th>
						<th>Stored Location</th>
						<th>Is Disabled</th>
						<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
							<th width="100">Edit</th>
						</sec:authorize>
						<sec:authorize access="hasRole('ADMIN')">
							<th width="100">Delete</th>
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
							<td>${product.warrenty}</td>
							<td>${product.gstTax}</td>
							<td>${product.storageLocation}</td>
							<td>${product.isDisabled}</td>
							<sec:authorize access="hasAnyRole('ADMIN', 'DBA')">
								<td><a href="<c:url value='/edit-product-${product.productId}' />"
									class="btn btn-success custom-width">edit</a></td>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ADMIN','DBA')">
								<td><a href="<c:url value='/delete-product-${product.productId}' />"
									class="btn btn-danger custom-width">delete</a></td>
							</sec:authorize>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
			<div class="well">
				<a href="<c:url value='/add-product' />">Add New Product</a>
			</div>
		</sec:authorize>
	</div>
</body>
</html>