<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Registration Form</title>
<script>
	$(document).on('ready', function() 
	{
		$("#file-0b").fileinput();
	});
</script>
<style type="text/css">
input
{
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
<br>
 	<form:form method="POST" action="./add-product?${_csrf.parameterName}=${_csrf.token}" modelAttribute="product" class="form-horizontal" enctype="multipart/form-data">
		<div style="margin-left: 5%;">
			<div class="column">
				<div class="form-group col-md-8">
					<label class="col-md-4 control-lable" for="productName">vastucao
						naava</label>
					<div class="col-md-5">
						<form:input type="text" path="productName" id="productName"
							class="form-control input-sm" />
					</div>
					<div class="has-error">
						<form:errors path="productName" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-8">
					<label class="col-md-4 control-lable" for="Description">saivastr
						maaihtI</label>
					<div class="col-md-5">
						<form:input type="text" path="description" id="description"
							class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="description" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-8">
					<label class="col-md-4 control-lable" for="manufacturerName">kMpnaIcao naava </label>
					<div class="col-md-5">
						<form:input type="text" path="manufacturerName"
							id="manufacturerName" class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="manufacturerName" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-8">
					<label class="col-md-4 control-lable" for="warrenty">hmaI</label>
					<div class="col-md-5">
						<form:input type="text" path="warrenty" id="warrenty"
							class="form-control input-sm" />
					</div>
					<div class="has-error"></div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-8">
					<label class="col-md-4 control-lable" for="price">ikMmat</label>
					<div class="col-md-5">
						<form:input type="number" path="price" id="price"
							class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="price" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-8">
					<label class="col-md-4 control-lable" for="storageLocation">sTaok</label>
					<div class="col-md-5">
						<form:input type="text" path="stock" id="storageLocation"
							class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="stock" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="column">
			<div class="form-group col-md-8">
					<label class="col-md-4 control-lable" for="gstTax">jaIesaTI</label>
					<div class="col-md-5">
						<form:input type="number" path="gstTax" id="gstTax"
							class="form-control input-sm" />

					</div>
					<div class="has-error">
						<form:errors path="gstTax" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="column">
				<div class="form-group col-md-8">
					<label class="col-md-4 control-lable" for="storageLocation">zovalaolao izkaNa</label>
					<div class="col-md-5">
						<form:input style="font-size:25px;" type="text" path="storageLocation" id="storageLocation"
							class="form-control input-sm" />
					</div>
					<div class="has-error">
						<form:errors path="storageLocation" class="help-inline" />
					</div>
				</div>
			</div>

			<div class="column">
				<div class="" style="text-align: center;">
					<button type="submit" value="izk Aaho" class="btn btn-primary btn-small">izk Aaho</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-primary btn-small" type="reset">rdd kra</button>
				</div>
			</div>
	
		</div>
	</form:form>
	
</body>
<script>
	$(document).ready(function() {
		$("#product_image").fileinput({
			'showPreview' : true,
			'allowedFileExtensions' : [ 'jpg', 'png', 'gif' ],
			'elErrorContainer' : '#errorBlock'
		});
	});
</script>
</html>
