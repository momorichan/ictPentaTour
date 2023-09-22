package com.shopping.model.bean;

public class accommodation {
	private int acid;
	private int guests;
	
	private String name;
	private String address;
	private String description;
	private String checkin;
	private String checkout;
	private String image01;
	private String image02;
	private String image03;
	
	



	@Override
	public String toString() {
		return "accommodation [acid=" + acid + ", guests=" + guests + ", name=" + name + ", address=" + address
				+ ", description=" + description + ", checkin=" + checkin + ", checkout=" + checkout + ", image01="
				+ image01 + ", image02=" + image02 + ", image03=" + image03 + "]";
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getAcid() {
		return acid;
	}


	public void setAcid(int acid) {
		this.acid = acid;
	}


	public int getGuests() {
		return guests;
	}


	public void setGuests(int guests) {
		this.guests = guests;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
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


	public String getImage01() {
		return image01;
	}


	public void setImage01(String image01) {
		this.image01 = image01;
	}


	public String getImage02() {
		return image02;
	}


	public void setImage02(String image02) {
		this.image02 = image02;
	}


	public String getImage03() {
		return image03;
	}


	public void setImage03(String image03) {
		this.image03 = image03;
	}


	public accommodation() {}
	
	
	
}
