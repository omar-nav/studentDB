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
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tempStudent" items="${STUDENT_LIST}">
			<!-- set up a link for each student -->
			<c:url var="tempLink" value="StudentControllerServlet">
				<c:param name="command" value="LOAD" />
				<c:param name="studentId" value="${tempStudent.id}" />
			</c:url>
			
			<!-- set up a link to delete account -->
			<c:url var="deleteLink" value="StudentControllerServlet">
				<c:param name="command" value="DELETE" />
				<c:param name="studentId" value="${tempStudent.id}" />
			</c:url>
			
				<tr>
					<td> ${tempStudent.firstName} </td>
					<td> ${tempStudent.lastName} </td>
					<!-- actually calls tempStudent.getEmail()  -->
					<td> ${tempStudent.email} </td>
					<td> 
						<a href="${tempLink}">Update</a>
						 |
						<a href="${deleteLink}"
						onclick="return confirm('Are you sure?')">
						Delete</a>						
					</td>
				</tr>		
			</c:forEach>
		</tbody>
	</table>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>


</html>
















