<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Student Tracker App</title>
	
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body>
	<h1 class = "h1">FooBar University</h1>
	<h4 class="text-muted">learning with zen by channeling stress into cosmic energy</h4>
	<!-- put new button : add student -->
	<input type="button" value="Add Student"
		onclick="window.location.href = 'add-student-form.jsp'; return false;"
		class="btn btn-secondary"
	/>
	<table class="table table-hover table-striped table-dark">
		<thead>
			<tr>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tempStudent" items="${STUDENT_LIST}">
				<tr>
					<td> ${tempStudent.firstName} </td>
					<td> ${tempStudent.lastName} </td>
					<!-- actually calls tempStudent.getEmail()  -->
					<td> ${tempStudent.email} </td>
				</tr>		
			</c:forEach>
		</tbody>
	</table>
</body>


</html>
















