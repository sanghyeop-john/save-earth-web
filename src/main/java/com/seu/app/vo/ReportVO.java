package com.seu.app.vo;

public class ReportVO {

	private int no;
	private String userid;
	private String subject;
	private String content;
	private int hit;
	private String writedate;
	private String filename_t;
	private int category = 1;
	private String delFilename;
	
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

	public String getFilename_t() {
		return filename_t;
	}
	public void setFilename_t(String filename_t) {
		this.filename_t = filename_t;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getDelFilename() {
		return delFilename;
	}
	public void setDelFilename(String delFilename) {
		this.delFilename = delFilename;
	}
	
	
}
