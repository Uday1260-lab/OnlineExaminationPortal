<%@page import="java.util.Date"%>
<%@page import="com.mysql.cj.Session"%>
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
.result{
width: 60vw;
margin-left: 20vw;
margin-right: 20vw; 
}
.result-h1-Disqualified{
margin-top: 1rem;
text-align: center;
text-transform: uppercase;
color: #F94C66;
font-size: 2.5rem;
}

.result-h1-Congratulations{
margin-top: 1rem;
text-align: center;
text-transform: uppercase;
color: #3EC70B;
font-size: 2.5rem;
}
.exam-name{
margin-top: 1rem;
text-align: center;
text-transform: uppercase;
color: #3B44F6;
}
.result-table{
margin-top: 2rem;
font-size: 1.75rem;
width: 70%;
margin-left: 15%;
margin-right: 15%; 
background-color: #DAEAF1;
border: solid;
padding: 1rem;
border-color: #CA82FF;
line-height: 2;
}
.result-table-td{
border: solid;
border-color: #F6FBF4;
padding-left: 0.75rem;
}

.result-btn{
margin-top: 2rem;
display: flex;
justify-content: space-around;
align-items: center;
}
.print-btn{
width: 15rem;
line-height: 2;
border-radius: 0.5rem;
border: none;
font-size: 1.5rem;
background-color: #47B5FF;
transition: all 0.5s;
}
.print-btn:hover{
transform: translateY(-4px);
background-color: #1363DF;
color: #F9F9F9;
}
.print-btn:active{
transform: translateY(-2px);
background-color: #1F4690;
color: #FFE5B4;
}

.close-btn{
width: 15rem;
line-height: 2;
border-radius: 0.5rem;
border: none;
font-size: 1.5rem;
background-color: #F94C66;
transition: all 0.5s;
}
.close-btn:hover{
transform: translateY(-4px);
background-color: #F32424;
color: #F9F9F9;
}
.close-btn:active{
transform: translateY(-2px);
background-color: #990000;
color: #FFE5B4;
}
</style>
</head>
<body>
	<%
	String finalMarks = request.getParameter("marks").toString();
	int marks = Integer.parseInt(finalMarks);
	String totalQuestion = request.getParameter("noOfQuestions").toString();
	int noOfQuestion = Integer.parseInt(totalQuestion);
	int totalMarks = 10 * noOfQuestion;
	int percentage = (marks * 100) / totalMarks;
	String grade = "Not Evaluated";
	String remark = "Not Evaluated";
	String classSelector = "";
	if (percentage >= 90) {
		grade = "A+ Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 85) {
		grade = "A Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 80) {
		grade = "A- Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 75) {
		grade = "B+ Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 70) {
		grade = "B Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 65) {
		grade = "C+ Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 60) {
		grade = "C Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 55) {
		grade = "D+ Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 50) {
		grade = "D Grade";
		remark = "PASS";
		classSelector = "";
	} else if (percentage >= 40) {
		grade = "E Grade";
		remark = "PASS";
		classSelector = "";
	} else {
		grade = "F Grade";
		remark = "FAIL";
		classSelector = "";
	}
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
	<div class="result">
		<%
		if (percentage < 40) {
		%>
		<h1 class="result-h1-Disqualified">Disqualified! You have not
			passed this exam!!</h1>
		<%
		} else {
		%>
		<h1 class="result-h1-Congratulations">Congratulations! You have
			passed this exam!!</h1>
		<%
		}
		%>

		<h1 class="exam-name">Preliminary Examination Score Report</h1>
		<table class="result-table">
			<tr>
				<td class="result-table-td">Exam Date:</td>
				<td class="result-table-td"><%=new java.util.Date()%></td>
			</tr>
			<tr>
				<td class="result-table-td">Student Name:</td>
				<td class="result-table-td"><c:out value="${userDetails.name}" /></td>
			</tr>
			<tr>
				<td class="result-table-td">Student Email:</td>
				<td class="result-table-td"><c:out value="${userDetails.email}" /></td>
			</tr>
			<tr>
				<td class="result-table-td">Course Title:</td>
				<td class="result-table-td"><c:out value="${qTopic}" /></td>
			</tr>
			<tr>
				<td class="result-table-td">Passing Score:</td>
				<td class="result-table-td">40</td>
			</tr>
			<tr>
				<td class="result-table-td">Student Score:</td>
				<td class="result-table-td"><%=percentage%></td>
			</tr>
			<tr>
				<td class="result-table-td">Grade:</td>
				<td class="result-table-td"><%=grade%></td>
			</tr>
			<tr>
				<td class="result-table-td">Remark:</td>
				<td class="result-table-td"><%=remark%></td>
			</tr>
		</table>
		<div class="result-btn">
		<button class="print-btn" onClick="window.print()">Print Result</button>		
		<button class="close-btn" onClick="window.open('', '_self', ''); window.close();">Close</button>
		</div>
	</div>

	<%
	HttpSession sess = request.getSession();
	sess.setAttribute("isUser", false);
	sess.setAttribute("userDetails", null);
	sess.setAttribute("index", null);
	sess.setAttribute("noOfQuestions", null);
	sess.setAttribute("oneByOneQuestion", null);
	sess.setAttribute("selectedQuestions", null);
	%>

	<script type="text/javascript">
		setInterval(displayTimeAndDate, 100);
		function displayTimeAndDate() {
			var time = new Date();
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

			document.getElementById("time").innerHTML = "Time: " + hrs + ":"
					+ min + ":" + sec;
			document.getElementById("date").innerHTML = "Date: " + day + ", "
					+ date + "/" + month + "/" + year;
		}
	</script>
</body>
</html>