<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Users List</title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<style>
td,th
{   text-align: center;
    word-wrap: break-word;
}
</style>

</head>

<body>
<%@include file="header.jsp" %>

	<div class="">
		<div class="panel panel-default">
			  <!-- Default panel contents -->
			  
			<div class="">
                <span class="" style="margin-left: 1%;"> 
				<sec:authorize access="hasRole('ADMIN')">
		 		<a href="<c:url value='/new-user' />">naivana tyaar kra</a>
        	 	</sec:authorize></span>
				<span style="margin-left: 40%;" class="">sava- yaujarcaI maaihtI </span>
			</div>
			<table class="" border="1" style="table-layout: fixed; width: 100%; overflow: visible;">
	    		<thead>
		      		<tr>
                        <th>yaujar AayaDI</th>
				        <th>pihlao naava</th>
				        <th>AaDnaava</th>
				        <th>[-  maola</th>
				        <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
				        	<th width="100"></th>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
				        	<th width="100"></th>
				        </sec:authorize>
				        
					</tr>
		    	</thead>
	    		<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
					    <td>${user.ssoId}</td>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td style="font-family: Monospace;" >${user.email}</td>
					    <sec:authorize access="hasAnyRole('ADMIN', 'DBA')">
							<td><a href="<c:url value='/edit-user-${user.ssoId}' />" class="btn btn-success custom-width">badla kra</a></td>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
							<td><a href="<c:url value='/delete-user-${user.ssoId}' />" class="btn btn-danger custom-width">kaZuna Taka </a></td>
        				</sec:authorize>
					</tr>
				</c:forEach>
	    		</tbody>
	    	</table>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
		 	<div class="well">
		 		<a href="<c:url value='/new-user' />">naivana tyaar kra</a>
		 	</div>
	 	</sec:authorize>
   	</div>
   	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>