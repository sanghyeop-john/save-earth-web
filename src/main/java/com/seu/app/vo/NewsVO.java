package com.seu.app.vo;

public class NewsVO {
	private int no;
	private String userid;
	private String subject;
	private String content;
	private int hit;
	private String writedate;
	private String filename1;
	@Override
	public String toString() {
		return "NewsVO [no=" + no + ", userid=" + userid + ", subject=" + subject + ", content=" + content + ", hit="
				+ hit + ", writedate=" + writedate + ", filename1=" + filename1 + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	


	
	
	
	
	
	
}
