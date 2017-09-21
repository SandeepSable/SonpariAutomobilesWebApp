<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home: Sonpari Automobiles</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="./static/googleChart/loader.js"></script>
<link href="./static/css/bootstrap.css" rel="stylesheet"></link>
<link href="./static/css/app.css" rel="stylesheet"></link>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Product', 'Hours per Day'],
  ['Work', 8],
  ['Pending', 2],
  ['Started', 4],
  ['Done', 2],
  ['Waiting', 8]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Product Information', 'width':500, 'height':500};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>

</head>
<body>

	<%@include file="header.jsp"%>

<div id="piechart"></div>
<!-- 
	<div style="align-items: center; margin-left: 2.5%;margin-right: 2.5%; display: none;" >
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			Indicators
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			Wrapper for slides
			<div class="carousel-inner">

				<div class="item active">
					<img height="78%" src="./static/img/win_2.jpg" alt="Los Angeles" style="width: 100%; height: 90%;">
					<div class="carousel-caption">
						<h3>saaonaprI 1</h3>
						<p>saaonaprI 2</p>
					</div>
				</div>

				<div class="item">
					<img height="78%" src="./static/img/win_1.jpg" alt="Chicago" style="width: 100%; height: 90%;">
					<div class="carousel-caption">
						<h3>saaonaprI 1</h3>
						<p>saaonaprI 2</p>
					</div>
				</div>

				<div class="item" >
					<img src="./static/img/win_1.jpg" alt="New York" style="width: 100%; height: 90%;">
					<div class="carousel-caption">
						<h3>saaonaprI 1</h3>
						<p>saaonaprI 2</p>
					</div>
				</div>

			</div>

			Left and right controls
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	
 -->	
	<%@include file="footer.jsp"%>

</body>
</html>