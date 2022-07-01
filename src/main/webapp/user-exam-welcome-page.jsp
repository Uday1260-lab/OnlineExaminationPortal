<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users Examination Application</title>
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

.list-welcome {
	margin-top: 10rem;
	height: 10rem;
}

.list-welcome-h3 {
	margin-top: 10rem;
	margin-left: 10rem;
	font-size: 3.5rem;
}

.list-welcome-p {
	margin-left: 10rem;
	font-size: 2rem;
}
.user-credentials{
padding-left: 2.5rem;
padding-top: 0.5rem;
padding-bottom: 0.5rem;
font-size: 1.25rem;
color: #C6DCE4;
background-image: linear-gradient( to right, #1363DF, #47B5FF);
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
			<h3 class="list-page-nav-h3">Users Examination Application</h3>
			<a href="<%=request.getContextPath()%>/subjectList"
				class="list-page-nav-a">Choose Exam Topic</a>
		</div>
		<div class="user-credentials">
			<p class="user-credentials-p">
				User Name:
				<c:out value="${userDetails.name}" />
			</p>
			<p class="user-credentials-p">
				User Email:
				<c:out value="${userDetails.email}" />
			</p>
				<p id="time">Time: </p>
				<p id="date">Date: </p>
		</div>
	</header>
	<c:if test="${userDetails != null }">
		<h3 class="list-welcome-h3">
			Hi
			<c:out value="${userDetails.name}" />
			, <br />Welcome to Online Examination Portal
		</h3>
		<p class="list-welcome-p">To Choose your Exam Topic, click on the
			Exam panel button.</p>
	</c:if>
	<c:if test="${userDetails == null }">
		<h3 class="list-welcome-h3">
			Sorry, You are not logged-in :( <br /> Please Login!!!
		</h3>
		<p class="list-welcome-p">
			To Login <a href="login.jsp">Click Here!</a>
		</p>
	</c:if>

	
<script type="text/javascript">
setInterval(displayTimeAndDate, 1);
function displayTimeAndDate() {
	var time= new Date();
	var hrs = time.getHours();
	var min = time.getMinutes();
	var sec = time.getSeconds();
	var year = time.getFullYear();
	var month = time.getMonth();
	var date = time.getDate();
	var day = "GoodDay";
	switch (time.getDay()) {
	case 0:
		day = "Sunday";
		break;
	case 1:
		day = "Monday";
		break;
	case 2:
		day = "Tuesday";
		break;
	case 3:
		day = "Wednesday";
		break;
	case 4:
		day = "Thursday";
		break;
	case 5:
		day = "Friday";
		break;
	case 6:
		day = "Saturday";
		break;

	default:
		day = "GoodDay";
		break;
	}
	
	document.getElementById("time").innerHTML = "Time: " + hrs + ":" + min + ":" + sec;
	document.getElementById("date").innerHTML = "Date: " + day + ", " + date + "/" + month + "/" + year;
}
</script>	
	
</body>
</html>