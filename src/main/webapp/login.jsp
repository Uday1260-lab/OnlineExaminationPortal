<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Examination Portal Login Page</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
}

html {
	font-size: 62.5%;
	line-height: 1.5;
}

body {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	background-image: linear-gradient(to bottom, #EEEEEE, #DDDDDD);
}

.login-page-main {
	min-height: 30vh;
	background-image: linear-gradient(to right bottom, #29BB89, #CDC733);
}

.login-page-main-heading {
	text-align: center;
	font-size: 5rem;
	transition: all 0.25s;
	padding-top: 7.5rem;
	color: #FEFFDE;
}

.login-page-main-heading:hover {
	transform: translateY(-5px);
	color: #05595B;
}

.login-section {
	min-height: 70vh;
	margin-left: 10vw;
	margin-right: 10vw;
	width: 80vw;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(40rem, 1fr));
	justify-items: center;
	align-items: center;
}

.login-section-group {
	display: flex;
	flex-direction: column;
	justify-content: start;
	width: 70%;
	padding: 2rem 4rem;
	border-radius: 2rem;
	background-image: linear-gradient(to right bottom, #CDF3A2, #93D9A3);
	min-height: 75%;
}

.login-section-group-heading {
	color: #7C3E66;
	font-size: 3rem;
	transition: all 0.2s;
	padding-bottom: 1rem;
}

.login-section-group-heading:hover {
	color: #4D96FF;
	transform: translate(-2px) scale(1.05);
}

.login-section-group-form {
	font-size: 1.75rem;
}

.label-input {
	display: flex;
	justify-content: space-between;
	margin-bottom: 0.75rem;
}

.login-section-group-form-button {
	align-self: center;
	width: 80%;
	border-radius: 1rem;
	height: 5rem;
	margin-left: 10%;
	margin-right: 10%;
	background-color: #4D96FF;
	border: none;
	margin-top: 2rem;
	transition: all 0.2s;
	color: #DDDDDD;
}

.login-section-group-form-button:hover {
	transform: translateY(-3px) scale(1.05);
	box-shadow: 0 1rem 2rem rgba(0, 0, 0, 0.1);
}

.login-section-group-form-input {
	border: none;
	border-bottom: 2px solid #0AA1DD;
	padding: 0.5rem 1rem;
	font-size: 1.5rem;
	border-radius: 0.5rem;
	transition: all 0.2s;
}

.login-section-group-form-input:focus {
	outline: none;
	transform: scale(1.1);
	border-bottom: 3px solid #1F4690;
}

.login-section-group-form-input:hover {
	transform: scale(1.1);
	border-bottom: 3px solid #3A5BA0;
}

.login-section-group-form-label {
	color: #7C3E66;
	transition: all 0.2s;
}

.login-section-group-form-label:hover {;
	color: #4D96FF;
	transform: scale(1.1);
}

.login-section-group-form-p {
	font-size: 1.25rem;
	transition: all 0.2s;
	width: max-content;
}

.login-section-group-form-p:hover {
	transform: scaleY(1.2) scaleX(1.1);
	color: #4D96FF;
}
</style>
</head>
<body>
<% session.setAttribute("reloaded", false); %>
	<div class="login-page-main">
		<h1 class="login-page-main-heading">Online Examination Portal
			Login Page</h1>

	</div>

	<div class="login-section">
		<div class="login-section-group">

			<h1 class="login-section-group-heading">Administrator Login Form</h1>


			<form class="login-section-group-form" action="adminLogin"
				method="post">

				<div class="label-input">
					<label class="login-section-group-form-label">Admin Name: </label><input
						class="login-section-group-form-input" type="text"
						placeholder="Admin name here..." required="required"
						name="adminName" />
				</div>
				<div class="label-input">
					<label class="login-section-group-form-label">Admin Email:
					</label><input class="login-section-group-form-input" type="email"
						placeholder="Admin email here..." required="required"
						name="adminEmail" />
				</div>
				<div class="label-input">
					<label class="login-section-group-form-label">Password: </label><input
						class="login-section-group-form-input" type="password"
						placeholder="Password" required="required" name="password" />
				</div>
				<button class="login-section-group-form-button" type="submit">Login</button>


			</form>


		</div>


		<div class="login-section-group">

			<h1 class="login-section-group-heading">Users Login Form</h1>


			<form class="login-section-group-form" action="userLogin" method="post">

				<div class="label-input">
					<label class="login-section-group-form-label">User Name: </label><input
						class="login-section-group-form-input" type="text"
						placeholder="User name here..." required="required"
						name="username" />
				</div>
				<div class="label-input">
					<label class="login-section-group-form-label">User Email: </label><input
						class="login-section-group-form-input" type="email"
						placeholder="User email here..." required="required"
						name="useremail" />
				</div>
				<div class="label-input">
					<label class="login-section-group-form-label">Password:
					</label><input class="login-section-group-form-input" type="password"
						placeholder="User password here..." required="required"
						name="userpassword" />
				</div>
				<p class="login-section-group-form-p">*Password same as given by the Admin.</p>
				<button class="login-section-group-form-button" type="submit">Login</button>


			</form>


		</div>

	</div>

</body>
</html>