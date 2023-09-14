package com.shopping.model.bean;

public class Board {
	private Integer no;
	private String id ;
	private String password;
	private String subject ;
	private String content ; 
	private Integer readhit;	
	private String regdate;// 날짜 형식


	//댓글 관련 변수
	private Integer depth;//글의 깊이
	private Integer groupno;//그룹 번호
	private Integer orderno;//순서 번호
	
	private Integer likes;
	private Integer hates;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	








	@Override
	public String toString() {
		return "Board [no=" + no + ", id=" + id + ", password=" + password + ", subject=" + subject + ", content="
				+ content + ", readhit=" + readhit + ", regdate=" + regdate + ", likes=" + likes + ", hates=" + hates
				+ ", depth=" + depth + ", groupno=" + groupno + ", orderno=" + orderno + "]";
	}










	public Integer getLikes() {
		return likes;
	}

	public void setLikes(Integer likes) {
		this.likes = likes;
	}

	public Integer getHates() {
		return hates;
	}

	public void setHates(Integer hates) {
		this.hates = hates;
	}

	public Integer getGroupno() {
		return groupno;
	}


	public void setGroupno(Integer groupno) {
		this.groupno = groupno;
	}


	public Integer getOrderno() {
		return orderno;
	}


	public void setOrderno(Integer orderno) {
		this.orderno = orderno;
	}


	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Integer getReadhit() {
		return readhit;
	}
	public void setReadhit(Integer readhit) {
		this.readhit = readhit;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public Integer getDepth() {
		return depth;
	}
	public void setDepth(Integer depth) {
		this.depth = depth;
	}
}