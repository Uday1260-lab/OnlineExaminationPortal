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
min-width: 60vw;
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
width: 40vw;
font-size: 1.3rem;
border-radius: 5px;
border: none;
border-bottom: 2px #247881 solid;
transition: all 0.2s;
}
.card-form-input:focus{
outline: none;
border-bottom: 3px #3EC70B solid;
}
.card-form-textarea{
width: 41vw;
border: none;
border-bottom: 2px #247881 solid;
}
.card-form-textarea:focus{
outline: none;
border-bottom: 3px #3EC70B solid;
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
			<h3 class="list-page-nav-h3">Questions Management Application</h3>
			<a href="<%=request.getContextPath()%>/list" class="list-page-nav-a">Controls Panel</a>
		</div>
	</header>


	<div class="card">
		<c:if test="${questions != null}">
			<form action="updateQuestion" method="post" class="card-form">
		</c:if>
		<c:if test="${questions == null}">
			<form action="insertQuestion" method="post" class="card-form">
		</c:if>
			<h2 class="card-form-caption-h2">
				<c:if test="${questions != null}">
            			Edit Question Form
            		</c:if>
				<c:if test="${questions == null}">
            			Add New Question Form
            		</c:if>
			</h2>

		<c:if test="${questions != null}">
			<input type="hidden" name="questionId" value="<c:out value='${questions.questionId}' />" class="card-form-input" />
		</c:if>
		<c:if test="${questions == null}">
        	<div class="form-group">
				<label class="card-form-label">Topic Name: <c:out value="${subject}" /></label><input type="hidden" value="<c:out value="${subject}" />" name="topicName" required="required" />				
			</div>
        </c:if>
        <c:if test="${questions != null}">
        	<div class="form-group">
				<label class="card-form-label">Topic Name: </label><input type="text" value="<c:out value="${questions.topicName}" />" name="topicName" required="required" class="card-form-input" />
			</div>
        </c:if>
		<div class="form-group">
			<label class="card-form-label">Question: </label><textarea class="card-form-textarea" name="question" rows="5" cols="50" required="required"><c:out value="${questions.question}" /></textarea>
		</div>
		<div class="form-group">
			<label class="card-form-label">Option 1: </label> <input type="text" value="<c:out value="${questions.choice1}" />" class="card-form-input" name="choiceA" required="required" />
		</div>
		<div class="form-group">
			<label class="card-form-label">Option 2: </label> <input type="text" value="<c:out value="${questions.choice2}" />" class="card-form-input" name="choiceB" required="required" />
		</div>
		<div class="form-group">
			<label class="card-form-label">Option 3: </label> <input type="text" value="<c:out value="${questions.choice3}" />" class="card-form-input" name="choiceC" required="required" />
		</div>
		<div class="form-group">
			<label class="card-form-label">Option 4: </label> <input type="text" value="<c:out value="${questions.choice4}" />" class="card-form-input" name="choiceD" required="required" />
		</div>

		<div class="form-group">
			<label class="card-form-label">Answer: </label> <input type="text" value="<c:out value="${questions.answer}"/>" class="card-form-input" name="answer" required="required" />
		</div>
		<div class="form-group">
		<button type="submit" class="card-form-submit-btn">Save</button>
		</div>
		</form>
	</div>
</body>
</html>