package com.admin.report.reportItems;

public class reportCard {
	private int reportId;
	private String date;
	private String name;
	private String email;
	private String topic;
	private String passScore;
	private String score;
	private String grade;
	private String remark;
	private String sessionId;
	public reportCard(String date, String name, String email, String topic, String passScore, String score,
			String grade, String remark, String sessionId) {
		super();
		this.date = date;
		this.name = name;
		this.email = email;
		this.topic = topic;
		this.passScore = passScore;
		this.score = score;
		this.grade = grade;
		this.remark = remark;
		this.sessionId = sessionId;
	}
	public reportCard(int reportId, String date, String name, String email, String topic, String passScore,
			String score, String grade, String remark, String sessionId) {
		super();
		this.reportId = reportId;
		this.date = date;
		this.name = name;
		this.email = email;
		this.topic = topic;
		this.passScore = passScore;
		this.score = score;
		this.grade = grade;
		this.remark = remark;
		this.sessionId = sessionId;
	}
	public reportCard() {
	}
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getPassScore() {
		return passScore;
	}
	public void setPassScore(String passScore) {
		this.passScore = passScore;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
		
	
}
