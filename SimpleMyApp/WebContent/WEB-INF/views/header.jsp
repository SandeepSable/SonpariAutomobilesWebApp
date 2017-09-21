<%@ page import="com.ibm.app.controller.AppController"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head><meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<c:url value='/static/css/header_jsp.css' />" rel="stylesheet"></link>
<link href="./static/font/Shivaji01.ttf"></link>
<link rel="shortcut icon" href="./static/img/sync.png" type="image/x-icon">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="./static/temp/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="./static/temp/themes/explorer/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="./static/temp/js/plugins/sortable.js" type="text/javascript"></script>
    <script src="./static/temp/js/fileinput.js" type="text/javascript"></script>
    <script src="./static/temp/themes/explorer/theme.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
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
body,a,li,ul,div,p,b,tr,td,table,span,INPUT,input{
font-family: Shivaji01;
font-size: 20px;
}

input{
font-size: 20px;
}
.input-sm{
font-size: 20px;
}
</style>
</head>

<div>
	<div class="row">
		<ul id="nav" style="position: relative; top:0px; bottom: 50%; right: 100px; left: 10px;">

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
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA','USER')">
						<li><a href="./sale1"> ivak`I vastu 1 </a></li>
						<li><a href="./sale2">ivak`I vastu 2 </a></li>
						</sec:authorize>
				</ul></li>
			<li class="yahoo"><a href="#">saaza</a>
				<ul>
				
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA','USER')">
					<li><a href="./add-stock">naivana</a></li>
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
		
			<li class="google"><a href="#">irpaoT-</a>
				<ul>
					<sec:authorize access="hasAnyRole('ADMIN', 'DBA')">
						<li><a href="./upcoming">AazvaDa</a></li>
						<li><a href="./upcoming">vaaiYa-k</a></li>
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
						<li class="right"><a href="./logout">laaoga Aa]T <b><%=AppController.getCurrentUserName() %></b> </a></li>
					</sec:authorize>

					<sec:authorize access="!hasAnyRole('ADMIN', 'DBA','USER')">
						<li><a href="./new-user">naivana rijasTr kra</a></li>
						<li><a href="./login">laaogaIna kra</a></li>
					</sec:authorize>

				</ul></li>
		</ul>
	</div>
</div>
