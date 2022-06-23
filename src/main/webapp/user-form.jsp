<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management Application</title>
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
.card{
padding: 5rem;
margin-top: 5rem;
display: grid;
grid-template-column: 1fr;
justify-content: center;
line-height: 2;
}

.card-form{
min-width: 30vw;
border-radius: 2rem;
padding: 2.5rem;
background-image: linear-gradient( to right bottom, #EEEEEE, #DDDDDD);
}

.card-form-caption-h2{
font-size: 3rem;
min-width: max-content;
color: #006778;
transition: all 0.2s;
margin-left: 4rem;
margin-right: 4rem;
}
.card-form-caption-h2:hover{
color: #0093AB;
transform: scale(1.05) translateY(-3px);
}
.form-group{
line-height: 1.5;
margin-left: 4rem;
margin-bottom: 1rem;
margin-top: 1rem;
margin-right: 4rem;
border: none;
font-size: 1.75rem;
display: flex;
justify-content: space-between;
}
.card-form-label{
color: #006778;
transition: all 0.2s;
}
.card-form-label:hover{
transform: scale(1.05);
color: #0093AB;
}

.card-form-input{
padding: 0.4rem 0.8rem;
width: 12.5vw;
font-size: 1.3rem;
border-radius: 5px;
border: none;
border-bottom: 2px #247881 solid;
transition: all 0.2s;
}
.card-form-input:focus{
outline: none;
border-bottom: 3px #43919B solid;
transform: scale(1.1);
}
.card-form-input:hover{
transform: scale(1.1);
}
.card-form-submit-btn{
margin-top: 1rem;
border: none;
padding: 0.6rem 1.2rem;
background-image: linear-gradient( to right bottom, #406882, #6998AB);
border-radius: 5px;
color: #FFF9F9;
transition: all 0.2s;
}
.card-form-submit-btn:hover{
transform: scale(1.2) translateY(-2px);
background-image: linear-gradient( to right bottom, #1A374D, #406882);
color: #F0ECE3;
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
			<a href="<%=request.getContextPath()%>/list" class="list-page-nav-a">Control Panel</a>
		</div>
	</header>


	<div class="card">
		<c:if test="${user != null}">
			<form action="update" method="post" class="card-form">
		</c:if>
		<c:if test="${user == null}">
			<form action="insert" method="post" class="card-form">
		</c:if>
			<h2 class="card-form-caption-h2">
				<c:if test="${user != null}">
            			Edit User Form
            		</c:if>
				<c:if test="${user == null}">
            			Add New User Form
            		</c:if>
			</h2>

		<c:if test="${user != null}">
			<input type="hidden" name="id" value="<c:out value='${user.id}' />" class="card-form-input" required="required"/>
		</c:if>

		<div class="form-group">
			<label class="card-form-label">User Name: </label> <input type="text"
				value="<c:out value='${user.name}'/>"
				name="name" required="required" class="card-form-input">
		</div>

		<div class="form-group">
			<label class="card-form-label">User Email: </label> <input type="text"
				value="<c:out value='${user.email}'/>" class="card-form-input"
				name="email" required="required">
		</div>

		<div class="form-group">
			<label class="card-form-label">User Password: </label> <input type="text"
				value="<c:out value='${user.userPassword}'/>" class="card-form-input"
				name="password" required="required">
		</div>
		<div class="form-group">
		<button type="submit" class="card-form-submit-btn">Save</button>
		</div>
		</form>
	</div>
</body>
</html>