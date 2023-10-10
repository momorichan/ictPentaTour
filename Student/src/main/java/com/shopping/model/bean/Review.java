package com.shopping.model.bean;

public class Review {
	private Integer trid; // 리뷰번호
	private Integer toid; // 티켓번호
	private Integer acid; // 숙소번호
	private String meid; // 아이디
	private String regdate; // 작성일자
	private Integer rating; // 별점
	private String content; // 내용작성
	
	private double average_rating; // 별점 평균
	
	public Review() {}
	
	
	
	
	@Override
	public String toString() {
		return "Review [trid=" + trid + ", toid=" + toid + ", acid=" + acid + ", meid=" + meid + ", regdate=" + regdate
				+ ", rating=" + rating + ", content=" + content + "]";
	}
	
	public Integer getTrid() {
		return trid;
	}
	public void setTrid(Integer trid) {
		this.trid = trid;
	}
	public Integer getToid() {
		return toid;
	}
	public void setToid(Integer toid) {
		this.toid = toid;
	}
	public Integer getAcid() {
		return acid;
	}
	public void setAcid(Integer acid) {
		this.acid = acid;
	}
	public String getMeid() {
		return meid;
	}
	public void setMeid(String meid) {
		this.meid = meid;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public double getAverage_rating() {
		return average_rating;
	}

	public void setAverage_rating(double average_rating) {
		this.average_rating = average_rating;
	}
	
}
