<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Registration Form</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

</head>

<body>
	<%@include file="header.jsp"%>

<div style="margin-left: 15%; margin-right: 15%" class="">
	 	<form:form method="POST" action="./add-product?${_csrf.parameterName}=${_csrf.token}" modelAttribute="product" class="form-horizontal" enctype="multipart/form-data">
	     <br>
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="productName">vastucao naava</label>
					<div class="col-md-7">
						<form:input type="text" path="productName" id="productName" class="form-control input-sm"/>
					</div>
					<div class="has-error">
							<form:errors path="productName" class="help-inline"/>
						</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="Description">saivastr maaihtI</label>
					<div class="col-md-7">
						<form:input type="text" path="description" id="description" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="description" class="help-inline"/>
						</div>
				</div>
			</div>
			
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="manufacturerName">]tpadk kMpnaIcao naava </label>
					<div class="col-md-7">
						<form:input type="text" path="manufacturerName" id="manufacturerName" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="manufacturerName" class="help-inline"/>
						</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="warrenty">hmaI</label>
					<div class="col-md-7">
						<form:input type="text" path="warrenty" id="warrenty" class="form-control input-sm" />
					</div>
					<div class="has-error">
						</div>
				</div>
			</div>
			
			
		<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="price">ikMmat</label>
					<div class="col-md-7">
						<form:input type="number" path="price" id="price" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="price" class="help-inline"/>
						</div>
				</div>
			</div>
		<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="storageLocation">sTaok</label>
					<div class="col-md-7">
						<form:input style="font-size:25px;" type="text" path="stock" id="storageLocation" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="stock" class="help-inline"/>
						</div>
				</div>
			</div>

			
		<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="gstTax">jaIesaTI</label>
					<div class="col-md-7">
						<form:input type="number" path="gstTax" id="gstTax" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="gstTax" class="help-inline"/>
						</div>
				</div>
			</div>
			
		<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="storageLocation">zovalaolao izkaNa</label>
					<div class="col-md-7">
						<form:input style="font-size:25px;" type="text" path="storageLocation" id="storageLocation" class="form-control input-sm" />
						
					</div>
					<div class="has-error">
							<form:errors path="storageLocation" class="help-inline"/>
						</div>
				</div>
			</div>
		
		
			<div class="column">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="filePath">vastucaa faoTao</label>
					<div class="col-md-7">
						<input style="font-family:Monospace;" type="file" class="file" data-show-preview="false" name="photo" id="photo" class="form-control" />
					</div>
					<div class="has-error">
					</div>
				</div>
			</div>
<div></div>
			<div class="column">
				<div class="form-actions" style="text-align: center;">
							<input type="submit" value="izk Aaho" class="btn btn-primary btn-sm"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="<c:url value='/' />"><button class="btn btn-primary btn-small" type="button">rdd kra</button></a>
				</div>
			</div>
		</form:form>
	</div>