<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bill Generation..</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./static/css/bootstrap.min.css" rel="stylesheet">
<script src="./static/js/bootstrap.js"></script>
<script src="./static/jquery_min.js"></script>
<script type="text/javascript">
$(function() {
    $('select > option').hover(function() {
        $(this).parent().css({fontFamily:Shivaji01})    
})            
})

</script>
<style type="text/css">
input, div, option, select {
	font-family: Shivaji01;
}
input, div, option, select:hover {
	font-family: Shivaji01;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<legend>saaonaprI AaTaomaaobaayala</legend>
			</div>
			<!-- panel preview -->
			<div class="col-sm-5">
				<h4>ibala tyaar kra.</h4>
				<div class="panel panel-default">
					<div class="panel-body form-horizontal payment-form">

						<div class="form-group">
							<label for="product" class="col-sm-3 control-label">vastucao naava</label>
							<div style="font-family: Shivaji01;" class="col-sm-9">
								<select class="form-control" id="pname" name="product">
									<c:forEach items="${products}" var="product">
										<option style="font-family: Shivaji01;">${product.productName}</option>
									</c:forEach>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="description" class="col-sm-3 control-label">saivastr maaihtI</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="description"
									name="description">
							</div>
						</div>
						<div class="form-group">
							<label for="amount" class="col-sm-3 control-label">ikMmat</label>
							<div class="col-sm-9">
								<input type="number" class="form-control" id="amount"
									name="amount">
							</div>
						</div>
						<div class="form-group">
								<label for="date" class="col-sm-3 control-label">naga</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="naga" name="naga">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12 text-right">
								<button type="button" class="btn btn-default preview-add-button">
									<span class="glyphicon glyphicon-plus"></span> jamaa kra
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- / panel preview -->
			<div id="bill" class="col-sm-7">
				<h4>ilasT pha</h4>
				<div class="row">
					<div class="col-xs-12">
						<div class="table-responsive">
							<table class="table preview-table">
								<thead>
									<tr>
										<th>Anau k`maaMk</th>
										<th>vastu</th>
										<th>saivastr maaihtI</th>
										<th>ek naga ikMmat</th>
										<th>ekuNa naga</th>
										<th>sagaLI ikMmat</th>

									</tr>
								</thead>
								<tbody></tbody>
								<!-- preview content goes here-->
							</table>
						</div>
					</div>
				</div>
				<div class="row text-right">
					<div class="col-xs-12">
						<h4>
							ekuNa  <strong><span class="preview-total"></span></strong>
						</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<hr style="border: 1px dashed #dddddd;">
						<button type="button" onclick="PrintElem('bill')" class="btn btn-primary btn-block">ip`MT kra</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function PrintElem(elem)
	{
	    var mywindow = window.open('', 'PRINT', 'height=400,width=600');

	    mywindow.document.write('<html><head><title>' + document.title  + '</title>');
	    mywindow.document.write('</head><body style="font-family:Shivaji01;" >');
	    mywindow.document.write('<h1>saaonaprI iball</h1>');
	    mywindow.document.write(document.getElementById(elem).innerHTML);
	    mywindow.document.write('</body></html>');

	    mywindow.document.close(); // necessary for IE >= 10
	    mywindow.focus(); // necessary for IE >= 10*/

	    mywindow.print();
	    mywindow.close();

	    return true;
	}
	
		function calc_total() {
			var sum = 0;
			$('.input-amount').each(function() {
				sum += parseFloat($(this).text());
			});
			$(".preview-total").text(sum);
		}
		$(document).on('click', '.input-remove-row', function() {
			var tr = $(this).closest('tr');
			tr.fadeOut(200, function() {
				tr.remove();
				calc_total()
			});
		});
var count = 0;
		$(function() {
			$('.preview-add-button')
					.click(
							function() {
								var form_data = {};
                                  count++;
                                  
								form_data["anu"] = count;
								form_data["product"] = $('.payment-form #pname option:selected').val();
								form_data["description"] = $('.payment-form input[name="description"]').val();
								var a = parseFloat($('.payment-form input[name="amount"]').val()).toFixed(2)*parseFloat($('.payment-form input[name="naga"]').val()).toFixed(2);;
								form_data["perUnit"] = parseFloat($('.payment-form input[name="amount"]').val()).toFixed(2);
								form_data["naga"] = $('.payment-form input[name="naga"]').val();
								form_data["amount"] = a;
								form_data["remove-row"] = ' <img width="10px" height="10px" src="./static/img/close.png"/> ';
								var row = $('<tr></tr>');
								$.each(form_data, function(type, value) {
									$('<td class="input-'+type+'"></td>').html(
											value).appendTo(row);
								});
								$('.preview-table > tbody:last').append(row);
								calc_total();
							});
		});
	</script>
</body>
</html>
