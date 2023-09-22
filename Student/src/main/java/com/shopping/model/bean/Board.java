package com.shopping.model.bean;

public class Board {
	private int no;
	private String id ;
	private String password;
	private String subject ;
	private String content ; 
	private int readhit;	
	private String regdate;// 날짜 형식
	
	// 차후 reply(답글)와 관련된 변수  
	private int depth ; // 글의 깊이	
	private int groupno ; // 그룹 번호
	private int orderno ; // 순서 번호
	
	private int likes ; // 좋아요
	private int hates ; // 싫어요	
		
	@Override
	public String toString() {
		return "Board [no=" + no + ", id=" + id + ", password=" + password + ", subject=" + subject + ", content="
				+ content + ", readhit=" + readhit + ", regdate=" + regdate + ", depth=" + depth + ", groupno="
				+ groupno + ", orderno=" + orderno + ", likes=" + likes + ", hates=" + hates + "]";
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getHates() {
		return hates;
	}

	public void setHates(int hates) {
		this.hates = hates;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int no, String id, String password, String subject, String content, int readhit,
			String regdate, int depth) {
		super();
		this.no = no;
		this.id = id;
		this.password = password;
		this.subject = subject;
		this.content = content;
		this.readhit = readhit;
		this.regdate = regdate;
		this.depth = depth;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
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
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}