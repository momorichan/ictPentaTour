package com.shopping.model.bean;

public class Roomreser {
	private int reid;
	private int roid;
	private int guests;
	private String checkin;
	private String checkout;
	
	public int getReid() {
		return reid;
	}
	public void setReid(int reid) {
		this.reid = reid;
	}
	public int getRoid() {
		return roid;
	}
	public void setRoid(int roid) {
		this.roid = roid;
	}
	public int getGuests() {
		return guests;
	}
	public void setGuests(int guests) {
		this.guests = guests;
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
		return "Roomreser [reid=" + reid + ", roid=" + roid + ", guests=" + guests + ", checkin=" + checkin
				+ ", checkout=" + checkout + "]";
	}
	
	
}
