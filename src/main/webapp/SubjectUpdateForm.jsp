<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subject Update Form</title>
<style>
* {
	margin: 0;
	padding: 0;
}

html {
	font-size: 62.5%;
}

body {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	line-height: 1.5;
	min-height: 100vh;
	background-color: #EEEEEE;
}

.list-page-header {
	min-height: 15vh;
	background-image: linear-gradient(to right bottom, #29BB89, #CDC733);
}

.list-page-header-main-heading {
	font-size: 4rem;
	transition: all 0.25s;
	padding-top: 2.75rem;
	color: #05595B;
	padding-left: 2.5rem;
}

.list-page-header-main-heading:hover {
	transform: translateY(-5px);
	color: #FEFFDE;
}

.list-page-nav {
	background-image: linear-gradient(to right, #242F9B, #CA82FF);
	min-height: 10vh;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.list-page-nav-h3 {
	font-size: 2.5rem;
	transition: all 0.2s;
	padding-left: 2.5rem;
	color: #DBDFFD;
}

.list-page-nav-a:link, .list-page-nav-a:visited {
	background-color: #C7D36F;
	text-decoration: none;
	font-size: 2rem;
	color: #4B5D67;
	border-radius: 1rem;
	margin-right: 7.5rem;
	padding: 0.35rem 0.7rem;
	transition: all 0.2s;
}

.list-page-nav-a:hover {
	transform: scale(1.1) translateY(-2px);
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.25);
}

.update-section-div {
	margin-top: 5rem; min-height : 30vh;
	justify-content: center;
	align-items: center;
	width: 80vw;
	margin-left: 10vw;
	margin-right: 10vw;
	display: flex;
	flex-direction: column;
	min-height: 30vh;
	jus
}

.update-section-div-h3 {
	font-size: 2rem;
	text-align: center;
	margin-bottom: 1rem;
}

.update-section-div-label {
	font-size: 1.5rem;
	margin-right: 0.5rem;
	transition: all 0.2s;
}

.update-section-div-label:hover {
	color: #0AA1DD;
}

.update-section-div-input {
	border: none;
	padding: 0.25rem 0.5rem;
	border-bottom: 2px green solid;
	border-radius: 0.5rem;
	transition: all 0.2s;
}

.update-section-div-input:focus {
	outline: none;
	border-bottom: 2px blue solid;
}

.update-section-div-btn {
	padding: 0.25rem 0.5rem;
	border: none;
	border-bottom: 2px blue solid;
	border-radius: 0.5rem;
	background-color: #0AA1DD;
	color: #FCFFE7;
	margin-left: 0.25rem;
	transition: all 0.2s;
}

.update-section-div-btn:hover {
	transform: scaleX(1.05) translateY(-1px);
	background-color: #5463FF;
	border-bottom: 2px #FF5D5D solid;
}

.update-section-div-h1 {
	margin-top: 2.5rem;
	 font-size : 2.5rem;
	text-align: left;
}

hr {
	width: 50%;
 border: 1px solid #AB46D2;
	margin-top: 5rem;
}
</style>
</head>
<body>

	<header>
		<div class="list-page-header">
			<h1 class="list-page-header-main-heading">Online Examination
				Portal</h1>
		</div>

		<div class="list-page-nav">
			<h3 class="list-page-nav-h3">Users Management Application</h3>
			<a href="<%=request.getContextPath()%>/list" class="list-page-nav-a">Control
				Panel</a>
		</div>
	</header>

	<div class="update-section-div">

		<h3 class="update-section-div-h3">
			To update the subject name<br> Enter the new subject name and
			press the update button.
		</h3>
		<form action="updateSubject" method="post"
			class="update-section-div-form">
			<input value="${subId}" required="required" type="hidden"
				name="subjectId" /><input value="${subName}" required="required" type="hidden"
				name="prevSubName" /> <label class="update-section-div-label">Enter
				the new subject name: </label><input value="${subName}" type="text"
				required="required" name="subjectName"
				class="update-section-div-input" /> <input type="submit"
				value="Update" class="update-section-div-btn" />
		</form>
		<hr />
	</div>
</body>
</html>