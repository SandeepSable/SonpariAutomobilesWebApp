<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head><meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<c:url value='/static/css/header_jsp.css' />" rel="stylesheet"></link>
<link href="./static/font/Shivaji01.ttf"></link>
<link rel="shortcut icon" href="./static/img/sync.png" type="image/x-icon">
<script type="text/javascript" src="./static/js/jquery-3.2.1.min.js">
	$(document).ready(function() {
		$("#nav li").hover(function() {
			$(this).children('ul').hide();
			$(this).children('ul').slideDown('fast');
		}, function() {
			$('ul', this).slideUp('fast');
		});
	});
</script>
<style type="text/css">
body,a,li,ul,div,p,b,tr,td,table,span{
font-family: Shivaji01;
font-size: 20;
}

input{
font-size: 15px;
}
.input-sm{
font-size: 200px;
}
</style>
</head>

<div>
	<div class="row">
		<ul id="nav">

			<li class="site-name"><a href="./home" style="font-size: 30px;">saaonaprI</a></li>



			<li class="facebook"><a href="#">yaujar</a>
				<ul>
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA','USER')">
						<li><a class="" href="./new-user">naivana yaujar</a></li>
						<li><a class="" href="./upcoming">yaujarcyaa maaihtIt badla</a></li>
						<li><a class="" href="./upcoming">yaujar kaZuna Taka</a></li>
						<li><a class="" href="./userList">sava- yaujar pha</a></li>
					</sec:authorize>
				</ul></li>


			<li class="facebook"><a href="#">]tpadna </a>
				<ul>
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA','USER')">
						<li><a class="" href="./add-product">naivana </a></li>
						<li><a class="" href="./upcoming">badla kra</a></li>
						<li><a class="" href="./upcoming">kaZuna Taka</a></li>
						<li><a class="" href="./view-product">sava-  pha</a></li>
					</sec:authorize>
				</ul></li>

			<li class="yahoo"><a href="#">KrodI</a>
				<ul>
					<sec:authorize access="hasAnyRole('ADMIN')">
						<li><a class="" href="./upcoming"> </a></li>
						<li><a class="" href="./upcoming"></a></li>
					</sec:authorize>
				</ul></li>
					<li class="google"><a href="#">ivak`I</a>
				<ul>
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA')">
						<li><a href="./upcoming">   </a></li>
						<li><a href="./upcoming">   </a></li>
						</sec:authorize>
				</ul></li>
			<li class="yahoo"><a href="#">saaza</a>
				<ul>
				
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA','USER')">
					<li><a href="./upcoming">naivana</a></li>
					<li><a href="./upcoming"></a></li>
					<li><a href="./upcoming">sava- pha</a></li>
					</sec:authorize>
				</ul></li>
			<li class="google"><a href="#">baokAp</a>
				<ul>
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA')">
						<li><a href="./upcoming">DoTabaosa baokAp</a></li>
						<li><a href="./upcoming">faoTao baokAp</a></li>
						</sec:authorize>
				</ul></li>
			<li class="twitter"><a href="#">madt</a>
				<ul>
				
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA','USER')">
					<li><a href="./upcoming"></a></li>
					<li><a href="./upcoming"></a></li>
					<li><a href="./upcoming"></a></li>
					<li><a href="./upcoming"></a></li>
					</sec:authorize>
				</ul></li>

			<li style="right: 10%; float: right;" class="twitter"><a href="#"><img alt="User Options" src="./static/img/user-red.png" width="40px" height="40px"></a>
				<ul>
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA','USER')">
						<li class="right"><a href="./logout">laaoga Aa]T</a></li>
					</sec:authorize>

					<sec:authorize access="!hasAnyRole('ADMIN', 'DBA','USER')">
						<li><a href="./new-user">naivana rijasTr kra</a></li>
						<li><a href="./login">laaogaIna kra</a></li>
					</sec:authorize>

				</ul></li>
		</ul>
	</div>
</div>
