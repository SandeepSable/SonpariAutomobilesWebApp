<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success Page</title>
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="generic-container">
		<div class="alert alert-success lead">${success}</div>
		<sec:authorize access="hasAnyRole('ADMIN','DBA')">
		<span class="well floatRight"><a href="<c:url value='/home' />">vaapsa</a></span> 
		</sec:authorize>
	</div>
</body>

</html>