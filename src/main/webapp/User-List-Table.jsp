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

.subject-bar {
	display: flex;
	align-items: center;
}
.user-credentials{
padding-left: 2.5rem;
padding-top: 0.5rem;
padding-bottom: 0.5rem;
font-size: 1.25rem;
color: #C6DCE4;
background-image: linear-gradient( to right, #1363DF, #47B5FF);
}
.subject-management-bar{
display: flex;
height: 20rem;
flex-direction: column;
justify-content: center;
}

.subject-management-bar-a:link, .subject-management-bar-a:visited{
	transition: all 0.25s;
text-decoration: none;
font-size: 1.5rem;
margin-left: 5rem;
margin-top: 2rem;
padding: 1rem 0.5rem;
color: #FFFDDE;
background-color: #548CFF;
text-align: center;
width: 20rem;
border-bottom-right-radius: 1rem;
border-top-left-radius: 1rem;
}
.subject-management-bar-a:hover{
background-color: #7900FF;	
}
.subject-management-bar-h1{
margin-left: 5rem;
	font-size: 3rem;
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
		<div class="list">
			<h3 class="list-heading">List Of Users</h3>
			<hr class="list-hr">
			<a href="<%=request.getContextPath()%>/new"
				class="list-add-new-user-btn">+ Add New User</a> <br />
			<c:if test="${listUser == null}">
				<div class="list-welcome">
					<p class="list-welcome-p">No users yet. Try adding new user,
						press the Add New User button.</p>
				</div>
			</c:if>
			<c:if test="${listUser != null}">
				<table class="list-table">
					<thead class="list-table-thead">
						<tr>
							<th class="list-table-thead-th">ID</th>
							<th class="list-table-thead-th">Name</th>
							<th class="list-table-thead-th">Email</th>
							<th class="list-table-thead-th">Password</th>
							<th class="list-table-thead-th">Operations</th>
						</tr>
					</thead>
					<tbody class="list-table-tbody">
						<c:forEach var="user" items="${listUser}">
							<tr>
								<td><c:out value="${user.id}" /></td>
								<td><c:out value="${user.name}" /></td>
								<td><c:out value="${user.email}" /></td>
								<td><c:out value="${user.userPassword}" /></td>
								<td>
									<div class="operations">
										<a href='edit?id=<c:out value="${user.id}" />'
											class="operations-btn-update">Edit</a> <a
											href='delete?id=<c:out value="${user.id}" />'
											class="operations-btn-delete">Delete</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>

			<hr class="list-hr">
		</div>
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