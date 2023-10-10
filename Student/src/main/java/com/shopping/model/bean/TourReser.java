package com.shopping.model.bean;

public class TourReser {
	private int torid;
	private int toid;
	private int tqty;
	private String meid;
	
	public int getTorid() {
		return torid;
	}
	public void setTorid(int torid) {
		this.torid = torid;
	}
	public int getToid() {
		return toid;
	}
	public void setToid(int toid) {
		this.toid = toid;
	}
	public int getTqty() {
		return tqty;
	}
	public void setTqty(int tqty) {
		this.tqty = tqty;
	}
	public String getMeid() {
		return meid;
	}
	public void setMeid(String meid) {
		this.meid = meid;
	}
	public TourReser(int torid, int toid, int tqty, String meid) {
		super();
		this.torid = torid;
		this.toid = toid;
		this.tqty = tqty;
		this.meid = meid;
	}
	@Override
	public String toString() {
		return "TourReser [torid=" + torid + ", toid=" + toid + ", tqty=" + tqty + ", meid=" + meid + "]";
	}
	
	public TourReser() {
		// TODO Auto-generated constructor stub
	}
}
