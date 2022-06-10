package com.admin.topic.bean;

public class TopicBean {
	
	private String topicName;
	private int questionId;
	private String question;
	private String choice1;
	private String choice2;
	private String choice3;
	private String choice4;
	private String answer;	
	
	public TopicBean() {
		
	}

	public TopicBean(String topicName, String question, String choice1, String choice2, String choice3, String choice4,
			String answer) {
		super();
		this.topicName = topicName;
		this.question = question;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.answer = answer;
	}	

	public TopicBean(String topicName, int questionId, String question, String choice1, String choice2,
			String choice3, String choice4, String answer) {
		super();
		this.topicName = topicName;
		this.questionId = questionId;
		this.question = question;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.answer = answer;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getChoice1() {
		return choice1;
	}

	public void setChoice1(String choice1) {
		this.choice1 = choice1;
	}

	public String getChoice2() {
		return choice2;
	}

	public void setChoice2(String choice2) {
		this.choice2 = choice2;
	}

	public String getChoice3() {
		return choice3;
	}

	public void setChoice3(String choice3) {
		this.choice3 = choice3;
	}

	public String getChoice4() {
		return choice4;
	}

	public void setChoice4(String choice4) {
		this.choice4 = choice4;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
		

}
