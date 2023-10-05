package com.shopping.model.bean;

public class Rrdetails {
	private int roid;
	private int rrid;
	private String name;
	private String birth;
	private String gender;
	private int guests;
	public int getRoid() {
		return roid;
	}
	public void setRoid(int roid) {
		this.roid = roid;
	}
	public int getRrid() {
		return rrid;
	}
	public void setRrid(int rrid) {
		this.rrid = rrid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getGuests() {
		return guests;
	}
	public void setGuests(int guests) {
		this.guests = guests;
	}
	@Override
	public String toString() {
		return "rrdetails [roid=" + roid + ", rrid=" + rrid + ", name=" + name + ", birth=" + birth + ", gender="
				+ gender + ", guests=" + guests + "]";
	}
	
	
}
