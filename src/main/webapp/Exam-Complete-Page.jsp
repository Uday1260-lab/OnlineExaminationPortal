<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exam-Complete-Page</title>
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
	display: flex;
	justify-content: space-between;
	align-items: center;
	min-height: 15rem;
	background-image: linear-gradient(to right bottom, #29BB89, #CDC733);
}

.list-page-header-main-heading {
	font-size: 4rem;
	transition: all 0.25s;
	color: #05595B;
	padding-left: 2.5rem;
}

.list-page-header-main-heading:hover {
	transform: translateY(-5px);
	color: #FEFFDE;
}

.user-credentials {
	height: 50%;
	border-bottom-left-radius: 1rem;
	border-top-left-radius: 1rem;
	padding: 1rem 3rem;
	font-size: 1.5rem;
	color: #F9F9F9;
	background-image: linear-gradient(to right, #1363DF, #47B5FF);
	padding: 1rem 2.5rem;
	width: 25rem;
	transition: all 0.5s;
}

.user-credentials:hover {
	color: #000000;
}

</style>
</head>
<body>

	<header>
		<div class="list-page-header">
			<h1 class="list-page-header-main-heading">Online Examination
				Portal</h1>
			<div class="user-credentials">
				<p>
					User Name:
					<c:out value="${userDetails.name}" />
				</p>
				<p>
					User Email:
					<c:out value="${userDetails.email}" />
				</p>
				<p>
					Time:
					<%= new java.util.Date()%>
				</p>
			</div>
		</div>
	</header>
	<h1>Exam-Complete-Page</h1>

	<%
	HttpSession sess = request.getSession();
	sess.setAttribute("isUser", false);
	sess.setAttribute("userDetails", null);
	sess.setAttribute("index", null);
	sess.setAttribute("noOfQuestions", null);
	sess.setAttribute("oneByOneQuestion", null);
	sess.setAttribute("selectedQuestions", null);
	%>
</body>
</html>