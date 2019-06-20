<!DOCTYPE html>
<html>
<head>
	<title>Update Student</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
	<h1 class="h1">FooBar University</h1>
	<h4 class="text-muted">learning with zen by channeling stress into cosmic energy</h4>
	<h3>Update Student</h3>
	<form action="StudentControllerServlet" method="GET">
		<input type="hidden" name="command" value="UPDATE" />
		<input type="hidden" name="studentId" value="${THE_STUDENT.id}" />

		<tr class="form-row">
			<div class="form-group col-md-6">
				<label class="label">First name</label>
				<input type="text" name="firstName" placeholder="John" class="form-control" 
				value="${THE_STUDENT.firstName}" />
			</div>
		</tr>
		<tr class="form-row">
			<div class="form-group col-md-6">
				<label class="label">Last name</label>
				<input type="text" name="lastName" placeholder="Doe" class="form-control" 
				value="${THE_STUDENT.lastName}" />
			</div>
		</tr>
		<tr class="form-row">
			<div class="form-group col-md-6">
				<label class="label">email</label>
				<input type="text" name="email" placeholder="johndoe@gmail.com" class="form-control"
				 value="${THE_STUDENT.email}" />
			</div>
		</tr>
		 <button type="submit" value="Save" class="btn btn-primary">submit</button>
	</form>
	
	<div style="clear: both;"></div>
	
	<p>
		<a href="StudentControllerServlet">Back to List</a>
	</p>

</body>

</html>