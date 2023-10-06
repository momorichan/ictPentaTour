package com.shopping.model.bean;

public class RentalcarCheck {
	private String rcid;
	private String id;
	public String getRcid() {
		return rcid;
	}
	public void setRcid(String rcid) {
		this.rcid = rcid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "RentalcarCheck [rcid=" + rcid + ", id=" + id + "]";
	}
	public RentalcarCheck(String rcid, String id) {
		super();
		this.rcid = rcid;
		this.id = id;
	}
	public RentalcarCheck() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
