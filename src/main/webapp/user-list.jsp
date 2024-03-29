<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.admin.topic.bean.TopicBean"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users Management Application</title>
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

.list {
	width: 80vw;
	margin-left: 10vw;
	margin-right: 10vw;
}

.list-heading {
	margin-top: 1.5rem;
	font-size: 3rem;
	margin-left: 5rem;
	margin-bottom: 1rem;
}

.list-hr {
	margin-bottom: 2rem;
	border-color: #A760FF;
}

.list-table {
	text-align: left;
	width: 80%;
	margin-top: 3rem;
	margin-left: 10%;
	margin-right: 10%;
	text-align: center;
	margin-bottom: 7.5rem;
}

.list-table-thead {
	background-color: #79DAE8;
	font-size: 1.75rem;
}

.list-table-thead-th {
	line-height: 2;
	border: solid;
	color: #FF6363;
	border-color: #FFBBBB;
}

.list-table-tbody {
	line-height: 2;
	font-size: 1.5rem;
	background-color: #DDDDDD;
}

.operations {
	display: flex;
	justify-content: space-around;
}

.operations-btn-update:visited, .operations-btn-update:link {
	text-decoration: none;
	width: 5rem;
	color: #EFFFFD;
	background-color: #4D77FF;
	margin-top: 0.2rem;
	margin-bottom: 0.2rem;
	padding: 0.2rem 0.4rem;
	border-radius: 1rem;
	transition: all 0.2s;
}

.operations-btn-update:hover {
	color: #E5E3C9;
	background-color: #5463FF;
	transform: scaleX(1.1);
}

.operations-btn-delete:visited, .operations-btn-delete:link {
	text-decoration: none;
	width: 5rem;
	color: #EFFFFD;
	background-color: #FF6363;
	margin-top: 0.2rem;
	margin-bottom: 0.2rem;
	padding: 0.2rem 0.4rem;
	border-radius: 1rem;
	transition: all 0.2s;
}

.operations-btn-delete:hover {
	color: #E5E3C9;
	background-color: #FF5D5D;
	transform: scaleX(1.1);
}

.list-welcome {
	margin-top: 10rem;
	height: 10rem;
}

.list-welcome-h3 {
	margin-top: 5rem;
	margin-left: 10rem;
	font-size: 3.5rem;
}

.list-welcome-p {
	margin-left: 10rem;
	font-size: 2rem;
}

.list-welcome-p2 {
margin-top:1rem;
	margin-left: 10rem;
	font-size: 1.5rem;
	width: 75rem;
}

.list-subjects {
	height: 10vh;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.list-subjects-top-header {
	font-size: 3rem;
	margin-left: 5rem;
	margin-bottom: 1rem;
}

.list-subjects-form {
	display: flex;
	align-item: center;
	font-size: 1.5rem;
}

.list-subjects-form-label {
	transform: translateY(2px);
	transition: all 0.2s;
	margin-right: 0.5rem;
}

.list-subjects-form-label:hover {
	color: #4D77FF;
	transform: scale(1.05) translateY(0);
}

.list-subjects-form-input {
	height: 2.5rem;
	width: 20rem;
	border: none;
	border-bottom: 2px green solid;
}

.list-subjects-form-submit {
	background-color: #47B5FF;
	color: #000000;
	transition: all 0.2s;
	padding: 0.2rem 0.5rem;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border: none;
}

.list-subjects-form-submit:hover {
	background-color: #1363DF;
	color: #DFF6FF;
}

.sub-btn-subject {
	font-size: 2.25rem;
	margin-left: 2.5rem;
	margin-bottom: 1rem;
	transition: all 0.2s;
}

.sub-btn-subject:hover {
	transform: translateY(-2px) scale(1.1);
	color: #4D96FF;
}

.sub-btn-add-btn:link, .sub-btn-add-btn:visited {
	font-size: 1.5rem;
	background-color: #4D77FF;
	color: #EEEEEE;
	text-decoration: none;
	transition: all 0.2s;
	padding: 0.3rem 0.6rem;
	border-radius: 0.5rem;
}

.sub-btn-add-btn:hover {
	transform: scale(1.1);
	background-color: #0E3EDA;
	color: #EFEFEF;
}

.sub-btn {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-right: 10rem;
}

.list-subjects-question {
	font-size: 1.5rem;
	margin-left: 2.5rem;
}

.question {
	font-size: 1.75rem;
	margin-right: 0.25rem;
}

.list-subjects-p {
	font-size: 1.25rem;
	margin-left: 2.5rem;
}

.action {
	display: flex;
	margin-left: 2.5rem;
	margin-bottom: 1rem;
}

.action-update:link, .action-update:visited {
	font-size: 1.2rem;
	color: #FBF8F1;
	width: 4rem;
	text-align: center;
	text-decoration: none;
	background-color: #0AA1DD;
	padding-bottom: 0.1rem;
	padding-top: 0.1rem;
	border-radius: 0.5rem;
	transition: all 0.2s;
}

.action-update:hover {
	background-color: #2155CD;
	transform: scaleX(1.05) translateY(-1px);
}

.action-delete:link, .action-delete:visited {
	font-size: 1.2rem;
	color: #FBF8F1;
	transition: all 0.2s;
	width: 4rem;
	text-align: center;
	padding-bottom: 0.1rem;
	padding-top: 0.1rem;
	background-color: #FF2442;
	text-decoration: none;
	border-radius: 0.5rem;
	margin-left: 1rem;
}

.action-delete:hover {
	background-color: #CE1212;
	transform: scaleX(1.05) translateY(-1px);
}

.list-add-new-user-btn:link, .list-add-new-user-btn:visited {
	text-decoration: none;
	font-size: 1.5rem;
	color: E8F9FD;
	background-color: #79DAE8;
	margin: 5rem;
	border-radius: 0.5rem;
	padding: 0.25rem 0.5rem;
	transition: all 0.25s;
}

.list-add-new-user-btn:hover {
	color: #E8F9FD;
	background-color: #242F9B;
}

.not-found-h3 {
	margin-left: 2.5rem;
	font-size: 1.5rem;
}

.not-found-p {
	margin-left: 2.5rem;
	margin-bottom: 2rem;
	font-size: 1.25rem;
}

.user-credentials{
padding-left: 2.5rem;
padding-top: 0.5rem;
padding-bottom: 0.5rem;
font-size: 1.25rem;
color: #C6DCE4;
background-image: linear-gradient( to right, #1363DF, #47B5FF);
}

.card-group{
margin-top: 7.5rem;
display: grid;
grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
min-height: 20rem;
justify-content: space-around;
grid-gap: 5rem;
}
.subject-management-bar{
display: grid;
margin-left: 0.5rem;
margin-right: 0.5rem;
border-radius: 1rem;
overflow: hidden;
grid-template-columns: 1fr;
grid-template-rows: 6fr 4fr;
text-align: center;
align-items: center;
background-image: linear-gradient( to right bottom, #F2D7D9, #D3CEDF);
transition: all 0.5s;
}
.subject-management-bar:hover{
transform: scale(1.25) translateY(-5px);
}
.subject-management-bar:hover .subject-management-bar-h1{
background-image: linear-gradient( to right bottom, #371B58, #7858A6);
}
.subject-management-bar-h1{
background-image: linear-gradient( to right bottom, #87805E, #D8CCA3);
font-size: 2.5rem;
justify-self: center;
align-self: center;
padding-top: 10rem;
width: 100%;
height: 100%;
transition: all 0.5s;
color: #FFFFDE;
}
.subject-management-bar-a:link, .subject-management-bar-a:visited{
justify-self: center;
align-self: center;
text-align: center;
text-decoration: none;
font-size: 1.75rem;
width: 20rem;
padding-bottom: 1rem;
padding-top: 1rem;
color: #F9F9F9;
background-color: #1363DF;
transition: all 0.2s;
border-bottom-right-radius: 2rem;
border-top-left-radius: 2rem;
}
.subject-management-bar-a:hover{
transform: scale(1.1) translateY(-3px);
background-color: #A760FF;
border-bottom-left-radius: 2rem;
border-top-right-radius: 2rem;
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
			<h3 class="list-page-nav-h3">Management Application</h3>
			<a href="<%=request.getContextPath()%>/list" class="list-page-nav-a">Control
				Panel</a>
		</div>
		<div class="user-credentials">
				<p>
					Admin Name:
					<c:out value="${adminDetails.adminName}" />
				</p>
				<p>
					Admin Email:
					<c:out value="${adminDetails.adminEmail}" />
				</p>
				<p id="time">Time: </p>
				<p id="date">Date: </p>
			</div>
	</header>
	<c:if test="${reloaded == null || reloaded == false }">
		<c:if test="${adminDetails != null }">
			<h3 class="list-welcome-h3">
				Hi,
				<c:out value="${adminDetails.adminName}" />
				Welcome to Online Examination Portal
			</h3>
			<p class="list-welcome-p">To proceed click on the Control panel
				button</p>
			<p class="list-welcome-p2">Online Examination Portal is an online assessment
				and knowledge management solution used by many corporate,
				Professional Training Institutes, Universities. The platform is used
				to conduct assessments, aptitude tests, psychometric tests and
				personality tests, entrance exams, hiring assessment tests. The
				platform provides flexibility to define online assessment with
				various attributes like negative marking, random questions, variable
				marking, etc. You can conduct an assessment using a computer,
				mobile, tablet devices. There is a facility to conduct offline
				assessments which can be synced with the main system after the
				assessment is completed.</p>
		</c:if>
		<c:if test="${adminDetails == null }">
			<h3 class="list-welcome-h3">
				Sorry, You are not logged-in :( <br /> Please Login!!!
			</h3>
			<p class="list-welcome-p">
				To Login <a href="login.jsp">Click Here!</a>
			</p>
		</c:if>
	</c:if>
	<c:if test="${reloaded == true }">
		<div class="list">
			<div class="card-group">
				<div class="subject-management-bar">
					<h1 class="subject-management-bar-h1">Manage Users List</h1>
					<a href="showUserTablePage" class="subject-management-bar-a">Manage Users</a>
				</div>
				<div class="subject-management-bar">
					<h1 class="subject-management-bar-h1">Manage Subjects List</h1>
					<a href="showSubjectPage" class="subject-management-bar-a">Manage Subjects</a>
				</div>
				<div class="subject-management-bar">
					<h1 class="subject-management-bar-h1">Inspect Responses</h1>
					<a href="showResponses" class="subject-management-bar-a">Examine</a>
				</div>
				<div class="subject-management-bar">
					<h1 class="subject-management-bar-h1">View All Reports</h1>
					<a href="showReports" class="subject-management-bar-a">View</a>
				</div>
			</div>
		</div>
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