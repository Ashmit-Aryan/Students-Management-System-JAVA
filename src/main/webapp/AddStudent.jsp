<!DOCTYPE html>
<html>

<head>

<title>Add Student</title>

</head>

<body>

	<h1>Add Student</h1>

	<form action="./AddStudentServlet" method="post">

		<input type="hidden" name="action" value="insert"> <label>Name:</label>

		<input type="text" name="name" required> <br> <br> <label>Email:</label>
		<input type="email" name="email" required> <br> <br>
		<label>Course:</label> <input type="text" name="course" required>
		<br> <br> <label>Age:</label> <input type="number"
			name="age" required> <br> <br> <label>Phone Number:</label>
		<input type="number" name="phone" required> <br> <br>
		<label>Batch:</label> <input type="text" name="batch" required>
		<br> <br>

		<button type="submit">Add Student</button>

	</form>

</body>

</html>