<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product Details Form</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

</head>

<body style="background-color: rgb(245, 245, 245);">
	<%@include file="header.jsp"%>

	<div style="margin-left: 15%; margin-right: 15%;" class="">
		<form:form action ="./edit-product?productId=${product.productId}" method="POST" modelAttribute="product" class="form-horizontal">

					<div class="column">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="productId">Product
								ID</label>
							<div class="col-md-7">
								<form:input type="text" name="productId" path="productId" id="productId"
									class="form-control input-sm" disabled="true" />
							</div>
							<div class="has-error">
								<form:errors path="productId" class="help-inline" />
							</div>
						</div>
					</div>
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="productName">Product
						Name</label>
					<div class="col-md-7">
						<form:input type="text" path="productName" id="productName"
							class="form-control input-sm" />
					</div>
					<div class="has-error">
						<form:errors path="productName" class="help-inline" />
					</div>
				</div>
			</div>

			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="asliasName">Alias
						name</label>
					<div class="col-md-7">
						<form:input type="text" path="aliasName" id="aliasName"
							class="form-control input-sm" />
					</div>
					<div class="has-error">
						<form:errors path="aliasName" class="help-inline" />
					</div>
				</div>
			</div>

			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="Description">Description</label>
					<div class="col-md-7">
						<form:input type="text" path="description" id="description"
							class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="description" class="help-inline" />
					</div>
				</div>
			</div>

			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="manufacturerName">Manufacturer
					</label>
					<div class="col-md-7">
						<form:input type="text" path="manufacturerName"
							id="manufacturerName" class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="manufacturerName" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="warrenty">Warrenty</label>
					<div class="col-md-7">
						<form:input type="text" path="warrenty" id="warrenty"
							class="form-control input-sm" />
					</div>
					<div class="has-error"></div>
				</div>
			</div>


			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="price">Price</label>
					<div class="col-md-7">
						<form:input type="number" path="price" id="price"
							class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="price" class="help-inline" />
					</div>
				</div>
			</div>

			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="price">Tax-(GST)</label>
					<div class="col-md-7">
						<form:input type="number" path="gstTax" id="gstTax"
							class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="gstTax" class="help-inline" />
					</div>
				</div>
			</div>


			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="storageLocation">Rack</label>
					<div class="col-md-7">
						<form:input type="text" path="storageLocation"
							id="storageLocation" class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="storageLocation" class="help-inline" />
					</div>
				</div>
			</div>


			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="isDisabled">Is
						Disabled ?</label>
					<div class="col-md-7">
						<form:input type="Checkbox" path="isDisabled" id="isDisabled"
							class="form-control input-sm" />
					</div>
					<div class="has-error">
						<form:errors path="isDisabled" class="help-inline" />
					</div>
				</div>
			</div>

			<div style="text-align: center;" class="column">
				<div class="form-actions">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="Update"	class="btn btn-primary btn-sm" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<c:url value='/view-product' />">Cancel</a>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Register"
								class="btn btn-primary btn-sm" /> or <a
								href="<c:url value='/' />">Cancel</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form:form>
	</div>