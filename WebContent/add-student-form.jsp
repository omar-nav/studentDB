<!DOCTYPE html>
<html>
<head>
	<title>Add Student</title>
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
	<h1 class="h1">FooBar University</h1>
	<h4 class="text-muted">learning with zen by channeling stress into cosmic energy</h4>
	<h3>Add Student</h3>
	<form action="StudentControllerServlet" method="POST">
		<input type="hidden" name="command" value="ADD" />
		<tr class="form-row">
			<div class="form-group col-md-6">
				<label class="label">First name</label>
				<input type="text" name="firstName" placeholder="John" class="form-control"/>
			</div>
		</tr>
		<tr class="form-row">
			<div class="form-group col-md-6">
				<label class="label">Last name</label>
				<input type="text" name="lastName" placeholder="Doe" class="form-control"/>
			</div>
		</tr>
		<tr class="form-row">
			<div class="form-group col-md-6">
				<label class="label">email</label>
				<input type="text" name="email" placeholder="johndoe@gmail.com" class="form-control"/>
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