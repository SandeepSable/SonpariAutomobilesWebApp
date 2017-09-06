<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<div
	style="position: absolute; top: 10%; left: 0%; size: 30%; min-height: 80%; max-height: auto; border: thin; border-style: double; border-color: #2da7e3; width: 20%; height: 50%;">

<div style="background-color: green; color: white; text-align: center;"><h4>Frequently Used Options</h4></div>
	<div class="vertical-menu">
	    <sec:authorize access="hasAnyRole('ADMIN','DBA')">
			<a class="" href="./user-list">User List</a>
		</sec:authorize>
		
		<a href="#">Link 1</a> 
		<a href="#">Link 2</a> 
		<a href="#">Link 3</a>
		<a href="#">Link 4</a>
	</div>

</div>

