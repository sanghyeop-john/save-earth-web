package com.seu.app.vo;

public class DonateVO {
	private int donate_no;
	private String userid;
	private String amount;
	private String donate_date;
	private int frequency;
	private int category;
	
	@Override
	public String toString() {
		return "DonateVO [donate_no=" + donate_no + ", userid=" + userid + ", amount=" + amount + ", donate_date="
				+ donate_date + "]";
	}
	public int getDonate_no() {
		return donate_no;
	}
	public void setDonate_no(int donate_no) {
		this.donate_no = donate_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getDonate_date() {
		return donate_date;
	}
	public void setDonate_date(String donate_date) {
		this.donate_date = donate_date;
	}
	public int getFrequency() {
		return frequency;
	}
	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	
	
}
