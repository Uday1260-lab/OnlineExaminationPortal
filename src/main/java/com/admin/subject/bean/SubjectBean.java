package com.admin.subject.bean;

public class SubjectBean {

	private int subjectId;
	private String subjectName;
	
	public SubjectBean() {
		super();
	}



	public SubjectBean(String subjectName) {
		super();
		this.subjectName = subjectName;
	}



	public SubjectBean(int subjectId, String subjectName) {
		super();
		this.subjectId = subjectId;
		this.subjectName = subjectName;
	}



	public int getSubjectId() {
		return subjectId;
	}



	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}



	public String getSubjectName() {
		return subjectName;
	}



	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	
	
	
	
}
