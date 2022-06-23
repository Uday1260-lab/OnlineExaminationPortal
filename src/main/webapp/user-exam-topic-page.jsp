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

.user-main-div {
	width: 80vw;
	margin-left: 10vw;
	margin-right: 10vw;
}

.user-main-heading {
	font-size: 2.5rem;
	margin-top: 5rem;
	text-align: center;
	margin-bottom: 2.5rem;
}

.subject-group {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(20rem, 25rem));
	grid-gap: 5rem;
	align-items: center;
	justify-content: center;
}

.subject-card {
	height: 15rem;
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-image: linear-gradient(to bottom, #EEEEEE, #DDDDDD);
	border-radius: 0.5rem;
	overflow: hidden;
	transition: all 0.4s;
}

.subject-card:hover {
	transform: scale(1.075);
}

.subject-card-heading {
	height: 10rem;
	line-height: 3;
	font-size: 2rem;
	line-height: 2;
	width: 100%;
	text-align: center;
	background-image: linear-gradient(to right bottom, #062C30, #05595B);
	color: #FDF6EC;
	transition: all 0.4s;
}

.subject-card:hover .subject-card-heading {
	background-image: linear-gradient(to right bottom, #570A57, #A91079);
}

.subject-card-form {
	width: 100%;
	height: 5rem;
	text-align: center;
}

.subject-card-btn {
	font-size: 1.5rem;
	line-height: 1.5;
	border: none;
	height: 50%;
	width: 75%;
	border-bottom-left-radius: 0.5rem;
	border-bottom-right-radius: 0.5rem;
	background-image: linear-gradient(to right bottom, #A760FF, #CA82FF);
	border-bottom: 3px #990000 solid;
	transition: all 0.4s;
}

.subject-card-btn:hover {
	background-image: linear-gradient(to right bottom, #0AA1DD, #79DAE8);
	border-bottom: 3px #3EC70B solid;
	transform: scaleX(1.05);
}

.guidelines-p {
	font-size: 1.5rem;
	line-height: 1.75;
}

.user-credentials {
	padding: 1rem;
	font-size: 1.5rem;
	color: #1B2430;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-image: linear-gradient(to right, #1363DF, #47B5FF);
}

.guidelines {
	margin-bottom: 10rem;
}
</style>
</head>
<body>
	<header>
		<div class="list-page-header">
			<h1 class="list-page-header-main-heading">Online Examination
				Portal</h1>
		</div>
	</header>
	<div class="user-credentials">
		<div>
		<p class="user-credentials-p">
			User Name:
			<c:out value="${userDetails.name}" />
		</p>
		<p class="user-credentials-p">
			User Email:
			<c:out value="${userDetails.email}" />
		</p>
		</div>
		<div>
				<p id="time">Time: </p>
				<p id="date">Date: </p>
		</div>
	</div>
	<c:if test="${subjects == null }">
		<h1 class="user-main-heading">There is no exam of any topic.</h1>
	</c:if>
	<c:if test="${subjects != null }">
		<div class="user-main-div">
			<h1 class="user-main-heading">Choose the topic for your Exam:</h1>
			<div class="subject-group">
				<c:forEach var="subject" items="${subjects}">
					<div class="subject-card">
						<h1 class="subject-card-heading">
							<c:out value="${subject.subjectName}" />
						</h1>
						<form method="post" action="examServer1" class="subject-card-form">
							<input type="hidden" required="required" name="subjectName"
								value="${subject.subjectName}">
							<button type="submit" class="subject-card-btn">Start</button>
						</form>
					</div>
				</c:forEach>
			</div>
			<div class="guidelines">
				<h1 class="user-main-heading">Basic Instructions/Guidelines to
					be followed for Online Examinations:</h1>
				<h2>Note:- Press "Submit" Button on each question to save your response.</h2>
				<p class="guidelines-p">1. The examination will comprise of
					Objective type Multiple Choice Questions (MCQs)</p>
				<p class="guidelines-p">2. All questions are compulsory and each
					carries One mark.</p>
				<p class="guidelines-p">3. The total number of questions,
					duration of examination, will be different based on the course, the
					detail is available on your screen.</p>
				<p class="guidelines-p">4. The Subjects or topics covered in the
					exam will be as per the Syllabus.</p>
				<p class="guidelines-p">5. There will be NO NEGATIVE MARKING for
					the wrong answers.</p>
				<p class="guidelines-p">6. The examination does not require
					using any paper, pen, pencil and calculator.</p>
				<p class="guidelines-p">7. Every student will take the
					examination on a Laptop/Desktop/Smart Phone</p>
				<p class="guidelines-p">8. On computer screen every student will
					be given objective type type Multiple Choice Questions (MCQs).</p>
				<p class="guidelines-p">9. Each student will get questions and
					answers in different order selected randomly from a fixed Question
					Databank.</p>
				<p class="guidelines-p">10. The students just need to click on
					the Right Choice / Correct option from the multiple choices
					/options given with each question.</p>
			</div>
		</div>
	</c:if>
<script type="text/javascript">
setInterval(displayTimeAndDate, 100);
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