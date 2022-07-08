<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page
	import="java.util.List,java.util.ArrayList,com.admin.topic.bean.TopicBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exam Page</title>
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

.exam-form {
	margin-top: 2.5rem;
	margin-left: 10rem;
}

.exam-form-h1 {
	font-size: 2.5rem;
	margin-bottom: 1rem;
	margin-right: 2.5rem;
}

.options {
	display: flex;
	height: 5rem;
	align-items: center;
	line-height: 2;
	font-size: 1.75rem;
}

.options-label {
	font-size: 1.75rem;
	margin-right: 0.5rem;
}

.options-input {
	transform: scale(1.5);
	margin-right: 0.75rem;
	margin-left: 0.5rem;
}

.operation-bar {
	height: 7.5rem;
	background-image: linear-gradient(to right bottom, #7302a3, #bd0429);
	display: flex;
	position: absolute;
	align-items: center;
	width: 100vw;
	bottom: 0;
}

.operation-bar-input-Previous {
	color: #1f191a;
	margin-left: 10rem;
	margin-right: 1rem;
	height: 3rem;
	width: 10rem;
	font-size: 1.5rem;
	border: none;
	border-bottom-right-radius: 1rem;
	border-top-left-radius: 1rem;
	text-align: center;
	background-image: linear-gradient(to right bottom, #03c2fc, #03b1fc);
	transition: all 0.5s;
}

.operation-bar-input-Previous:hover {
	color: #F2FFE9;
	transform: scale(1.1) translateY(-5px);
	box-shadow: 0 0.5rem 1rem rgba(255, 255, 255, 0.5);
	background-image: linear-gradient(to right bottom, #03b1fc, #038cfc);
}

.operation-bar-input-Previous:active {
	background-image: linear-gradient(to right bottom, #1F4690, #1363DF);
	transform: scale(1.05) translateY(-3px);
}

.operation-bar-input-Next {
	margin-left: 1rem;
	color: #1f191a;
	margin-right: 1rem;
	height: 3rem;
	width: 10rem;
	font-size: 1.5rem;
	text-align: center;
	border: none;
	border-bottom-right-radius: 1rem;
	border-top-left-radius: 1rem;
	background-image: linear-gradient(to right bottom, #03c2fc, #03b1fc);
	transition: all 0.5s;
}

.operation-bar-input-Next:hover {
	color: #F2FFE9;
	box-shadow: 0 0.5rem 1rem rgba(255, 255, 255, 0.5);
	transform: scale(1.1) translateY(-5px);
	background-image: linear-gradient(to right bottom, #03b1fc, #038cfc);
}

.operation-bar-input-Next:active {
	background-image: linear-gradient(to right bottom, #1F4690, #1363DF);
	transform: scale(1.05) translateY(-3px);
}

.operation-bar-input-Save {
	margin-left: 1rem;
	color: #1f191a;
	margin-right: 1rem;
	height: 3rem;
	width: 10rem;
	font-size: 1.5rem;
	text-align: center;
	border: none;
	border-bottom-right-radius: 1rem;
	border-top-left-radius: 1rem;
	background-image: linear-gradient(to right bottom, #03c2fc, #03b1fc);
	transition: all 0.5s;
}

.operation-bar-input-Save:hover {
	color: #F2FFE9;
	box-shadow: 0 0.5rem 1rem rgba(255, 255, 255, 0.5);
	transform: scale(1.1) translateY(-5px);
	background-image: linear-gradient(to right bottom, #03b1fc, #038cfc);
}

.operation-bar-input-Save:active {
	background-image: linear-gradient(to right bottom, #1F4690, #1363DF);
	transform: scale(1.05) translateY(-3px);
}

.operation-bar-input-Submit {
	margin-left: 50vw;
	margin-right: 1rem;
	height: 3rem;
	width: 10rem;
	color: #1f191a;
	border: none;
	border-bottom-right-radius: 1rem;
	border-top-left-radius: 1rem;
	font-size: 1.5rem;
	text-align: center;
	background-image: linear-gradient(to right bottom, #49FF00, #54E346);
	transition: all 0.5s;
}

.operation-bar-input-Submit:hover {
	color: #F2FFE9;
	box-shadow: 0 0.5rem 1rem rgba(255, 255, 255, 0.5);
	background-image: linear-gradient(to right bottom, #54E346, #9AE66E);
	transform: scale(1.1) translateY(-5px);
}

.operation-bar-input-Submit:active {
	background-image: linear-gradient(to right bottom, #5FD068, #9EB23B);
	transform: scale(1.05) translateY(-3px);
}
.time-left{
background-color: #1363DF;
color: #EAF6F6;
text-align: center;
}
.time-left-h1{
padding: 0.25rem;
}
</style>
</head>
<body>
	<%
	HttpSession sess = request.getSession();
	String sesid = sess.getId();
	%>
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
				<p id="time">Time:</p>
				<p id="date">Date:</p>
			</div>
		</div>
	</header>
	<div class="time-left">
		<h1 id="time-left-h1">Time Remaining:</h1>
	</div>
	<div class="exam-section">
		<form action="saveResult" method="post">
			<div class="exam-form">
				<h1 class="exam-form-h1">
					Question
					<c:if test="${noOfQuestions > (index+1)}">
						<c:out value="${index+1 }" />
					</c:if>
					<c:if test="${noOfQuestions <= (index+1)}">
						<c:out value="${noOfQuestions}" />
					</c:if>
					:
					<c:out value="${oneByOneQuestion.question}" />
				</h1>
				<input type="hidden" name="examDuration" value="${examDuration}">
				<input type="hidden" name="index" value="${index}"> <input
					type="hidden" name="startTime" value="${startTime}"> <input
					type="hidden" name="answer" value="${oneByOneQuestion.answer}">
				<input type="hidden" name="question"
					value="${oneByOneQuestion.question}"> <input type="hidden"
					name="questionId" value="${oneByOneQuestion.questionId}"> <input
					type="hidden" name="questionTopic"
					value="${oneByOneQuestion.topicName}"> <input type="hidden"
					name="userName" value="${userDetails.name}"> <input
					type="hidden" name="userEmail" value="${userDetails.email}">
				<input type="hidden" name="sessionId" value="<%=sesid%>"> <input
					type="hidden" name="noOfQuestions" value="${noOfQuestions}">
				<input type="hidden" name="time" value="<%=new java.util.Date()%>">
				<input type="hidden" name="marks" value="${marks}">
				
				
				
				
				<c:if test="${selectedChoice == oneByOneQuestion.choice1}">
				<div class="options">
					<label class="options-label">Option A : </label><input
						class="options-input" type="radio" name="option"
						value="${oneByOneQuestion.choice1}" checked="checked" />
					<c:out value="${oneByOneQuestion.choice1}" />
				</div>
				</c:if>
				<c:if test="${selectedChoice != oneByOneQuestion.choice1 || selectedChoice == null}">
				<div class="options">
					<label class="options-label">Option A : </label><input
						class="options-input" type="radio" name="option"
						value="${oneByOneQuestion.choice1}"/>
					<c:out value="${oneByOneQuestion.choice1}" />
				</div>
				</c:if>
								
				<c:if test="${selectedChoice == oneByOneQuestion.choice2}">
				<div class="options">
					<label class="options-label">Option B : </label><input
						class="options-input" type="radio" name="option"
						value="${oneByOneQuestion.choice2}" checked="checked" />
					<c:out value="${oneByOneQuestion.choice2}" />
				</div>
				</c:if>
				<c:if test="${selectedChoice != oneByOneQuestion.choice2 || selectedChoice == null}">
				<div class="options">
					<label class="options-label">Option B : </label><input
						class="options-input" type="radio" name="option"
						value="${oneByOneQuestion.choice2}"/>
					<c:out value="${oneByOneQuestion.choice2}" />
				</div>
				</c:if>
								
				<c:if test="${selectedChoice == oneByOneQuestion.choice3}">
				<div class="options">
					<label class="options-label">Option C : </label><input
						class="options-input" type="radio" name="option"
						value="${oneByOneQuestion.choice3}" checked="checked" />
					<c:out value="${oneByOneQuestion.choice3}" />
				</div>
				</c:if>
				<c:if test="${selectedChoice != oneByOneQuestion.choice3 || selectedChoice == null}">
				<div class="options">
					<label class="options-label">Option C : </label><input
						class="options-input" type="radio" name="option"
						value="${oneByOneQuestion.choice3}"/>
					<c:out value="${oneByOneQuestion.choice3}" />
				</div>
				</c:if>
				
				
								
				<c:if test="${selectedChoice == oneByOneQuestion.choice4}">
				<div class="options">
					<label class="options-label">Option D : </label><input
						class="options-input" type="radio" name="option"
						value="${oneByOneQuestion.choice4}" checked="checked" />
					<c:out value="${oneByOneQuestion.choice4}" />
				</div>
				</c:if>
				<c:if test="${selectedChoice != oneByOneQuestion.choice4 || selectedChoice == null}">
				<div class="options">
					<label class="options-label">Option D : </label><input
						class="options-input" type="radio" name="option"
						value="${oneByOneQuestion.choice4}"/>
					<c:out value="${oneByOneQuestion.choice4}" />
				</div>
				</c:if>
			</div>

			<div class="operation-bar">
				<c:if test="${ index == 0 }">
					<input disabled="disabled" class="operation-bar-input-Previous"
						type="submit" name="operation" value="Previous" />
				</c:if>
				<c:if test="${ index != 0 }">
					<input class="operation-bar-input-Previous" type="submit"
						name="operation" value="Previous" />
				</c:if>
				<c:if test="${ noOfQuestions == (index+1) }">
					<input class="operation-bar-input-Next" disabled="disabled"
						type="submit" name="operation" value="Next" />
				</c:if>
				<c:if test="${ noOfQuestions != (index+1) }">
					<input class="operation-bar-input-Next" type="submit"
						name="operation" value="Next" />
				</c:if>
				<input class="operation-bar-input-Save" type="submit"
					name="operation" value="Save" /> <input
					class="operation-bar-input-Submit" type="submit" id="submit-button"
					name="operation" value="Submit" />
			</div>
		</form>
	</div>

	<script type="text/javascript">
		setInterval(displayTimeAndDate, 1);
		function displayTimeAndDate() {
			var time = new Date();
			var hrs = time.getHours();
			var min = time.getMinutes();
			var sec = time.getSeconds();
			var year = time.getFullYear();
			var month = time.getMonth();
			var date = time.getDate();
			var currentTime = time.getTime();
			var startTime = <%=request.getAttribute("startTime")%>;
			var examDuration = <%=request.getAttribute("examDuration")%>;
			var timeElapsed = currentTime - startTime;
			var timeLeft = examDuration - timeElapsed;
			var timeLeftinMins = Math.floor(timeLeft / 60000);
			var timeLeftinSecs = Math
					.floor((timeLeft - (timeLeftinMins * 60000)) / 1000);
			var timeLeftinMiliSecs = timeLeft - (timeLeftinMins * 60000)
					- (timeLeftinSecs * 1000);


			if (timeElapsed == examDuration) {
				document.getElementById('submit-button').click();
			} else if(timeElapsed == examDuration+1){
				document.getElementById('submit-button').click();				
			} else if(timeElapsed == examDuration+2){
				document.getElementById('submit-button').click();				
			} else if(timeElapsed == examDuration+3){
				document.getElementById('submit-button').click();				
			} else if(timeElapsed == examDuration+4){
				document.getElementById('submit-button').click();				
			}
			
			if(timeElapsed < examDuration){
			document.getElementById("time-left-h1").innerHTML = "Time Remaining: " + timeLeftinMins + " min " + timeLeftinSecs + " Sec ";
			} else{
				document.getElementById("time-left-h1").innerHTML = "Time Remaining: " + "00 min " + "00 Sec";				
			}
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
				document.getElementById("time").innerHTML = "Time: " + hrs
						+ ":" + min + ":" + sec;
				document.getElementById("date").innerHTML = "Date: " + day
						+ ", " + date + "/" + month + "/" + year;
		}
	</script>

</body>
</html>