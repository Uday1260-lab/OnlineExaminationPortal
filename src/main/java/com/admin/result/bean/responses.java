package com.admin.result.bean;

public class responses {
	private int resultId;
	private String name;
	private String email;
	private String qid;
	private String qTopic;
	private String ques;
	private String correctOption;
	private String optionSelected;
	private String sessionId;
	private String time;	
	
	public responses(int resultId, String name, String email, String qid, String qTopic, String ques,
			String correctOption, String optionSelected, String sessionId, String time) {
		super();
		this.resultId = resultId;
		this.name = name;
		this.email = email;
		this.qid = qid;
		this.qTopic = qTopic;
		this.ques = ques;
		this.correctOption = correctOption;
		this.optionSelected = optionSelected;
		this.sessionId = sessionId;
		this.time = time;
	}
	public responses(String name, String email, String qid, String qTopic, String ques, String correctOption,
			String optionSelected, String sessionId, String time) {
		super();
		this.name = name;
		this.email = email;
		this.qid = qid;
		this.qTopic = qTopic;
		this.ques = ques;
		this.correctOption = correctOption;
		this.optionSelected = optionSelected;
		this.sessionId = sessionId;
		this.time = time;
	}
	public responses() {
	}
	public int getResultId() {
		return resultId;
	}
	public void setResultId(int resultId) {
		this.resultId = resultId;
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
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getqTopic() {
		return qTopic;
	}
	public void setqTopic(String qTopic) {
		this.qTopic = qTopic;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getCorrectOption() {
		return correctOption;
	}
	public void setCorrectOption(String correctOption) {
		this.correctOption = correctOption;
	}
	public String getOptionSelected() {
		return optionSelected;
	}
	public void setOptionSelected(String optionSelected) {
		this.optionSelected = optionSelected;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	
}
