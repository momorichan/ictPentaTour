package com.shopping.model.bean;

public class RentalcarCheck {
	private int recid;
	public int getRecid() {
		return recid;
	}
	public void setRecid(int recid) {
		this.recid = recid;
	}
	private String rcid;
	private String meid;
	public String getRcid() {
		return rcid;
	}
	public void setRcid(String rcid) {
		this.rcid = rcid;
	}
	public String getMeid() {
		return meid;
	}
	public void setMeid(String meid) {
		this.meid = meid;
	}
	@Override
	public String toString() {
		return "RentalcarCheck [rcid=" + rcid + ", meid=" + meid + "]";
	}
	public RentalcarCheck(String rcid, String meid) {
		super();
		this.rcid = rcid;
		this.meid = meid;
	}
	public RentalcarCheck() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
