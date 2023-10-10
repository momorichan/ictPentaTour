package com.shopping.model.bean;

public class accommodation {
	private int acid;
	private String global;
	private String city;
	private String address;
	private String name;
	private String description;
	private String image01;
	private String image02;
	private String image03;
	
	
	
	public String getGlobal() {
		return global;
	}
	public void setGlobal(String global) {
		this.global = global;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getAcid() {
		return acid;
	}
	public void setAcid(int acid) {
		this.acid = acid;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	@Override
	public String toString() {
		return "accommodation [acid=" + acid + ", global=" + global + ", city=" + city + ", address=" + address
				+ ", name=" + name + ", description=" + description + ", image01=" + image01 + ", image02=" + image02
				+ ", image03=" + image03 + "]";
	}
}