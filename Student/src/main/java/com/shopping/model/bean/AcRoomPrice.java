package com.shopping.model.bean;

public class AcRoomPrice {
	private int acid;
	private int minprice;
	private String name;
	private String address;
	private String image;
	
	public int getAcid() {
		return acid;
	}
	public void setAcid(int acid) {
		this.acid = acid;
	}
	public int getMinprice() {
		return minprice;
	}
	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "AcRoomPrice [acid=" + acid + ", minprice=" + minprice + ", name=" + name + ", address=" + address
				+ ", image=" + image + "]";
	}

	
}
