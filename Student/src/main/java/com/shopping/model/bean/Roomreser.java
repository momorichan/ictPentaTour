package com.shopping.model.bean;

public class Roomreser {
	private int rrid;
	private int meid;
	private String checkin;
	private String checkout;
	public int getRrid() {
		return rrid;
	}
	public void setRrid(int rrid) {
		this.rrid = rrid;
	}
	public int getMeid() {
		return meid;
	}
	public void setMeid(int meid) {
		this.meid = meid;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	@Override
	public String toString() {
		return "Roomreser [rrid=" + rrid + ", meid=" + meid + ", checkin=" + checkin + ", checkout=" + checkout + "]";
	}
	
	
	
	
}
