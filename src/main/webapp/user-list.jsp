<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	background-color: #FDF6EC;
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

.list-add-new-btn:link, .list-add-new-btn:visited {
	text-decoration: none;
	border-radius: 0.75rem;
	font-size: 2rem;
	margin-left: 5rem;
	padding: 0.5rem 1rem;
	background-color: #95CD41;
	color: #CDF0EA;
	transition: all 0.2s;
}

.list-add-new-btn {
	transform: scale(1.1) translateY(-3px);
}

.list-table {
	text-align: left;
	width: 80%;
	margin-top: 3rem;
	margin-left: 10%;
	margin-right: 10%;
	text-align: center;
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
.list-welcome{
margin-top: 10rem;
height: 10rem;
}

.list-welcome-h3{
font-size: 3rem;
}

.list-welcome-p{
font-size: 2rem;
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
			<a href="<%=request.getContextPath()%>/list" class="list-page-nav-a">Users
				Lists</a>
		</div>
	</header>

	<div class="list">
		<c:if test="${listUser == null}">
			<div class="list-welcome">
				<h3 class="list-welcome-h3">Welcome to User Management Application</h3>
				<p class="list-welcome-p">To view the users list, Press the User Lists button</p>
			</div>
		</c:if>
		<c:if test="${listUser != null}">
			<h3 class="list-heading">List Of Users</h3>
			<hr class="list-hr">
			<a href="<%=request.getContextPath()%>/new" class="list-add-new-btn">Add
				New Users</a>
			<br />
			<table class="list-table">
				<thead class="list-table-thead">
					<tr>
						<th class="list-table-thead-th">ID</th>
						<th class="list-table-thead-th">Name</th>
						<th class="list-table-thead-th">Email</th>
						<th class="list-table-thead-th">Country</th>
						<th class="list-table-thead-th">Operations</th>
					</tr>
				</thead>
				<tbody class="list-table-tbody">
					<c:forEach var="user" items="${listUser}">
						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.country}" /></td>
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
	</div>
</body>
</html>