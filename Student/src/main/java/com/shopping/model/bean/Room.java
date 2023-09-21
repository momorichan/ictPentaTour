package com.shopping.model.bean;

public class Room {
	private int roid;
	private int acid;
	private int price;
	private int guests;
	
	private String room;
	private String roominfo;
	private String roomtype;
	private String breakfast;
	private String image01;
	private String image02;
	private String image03;
	
	public int getRoid() {
		return roid;
	}
	public void setRoid(int roid) {
		this.roid = roid;
	}
	public int getAcid() {
		return acid;
	}
	public void setAcid(int acid) {
		this.acid = acid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getGuests() {
		return guests;
	}
	public void setGuests(int guests) {
		this.guests = guests;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getRoominfo() {
		return roominfo;
	}
	public void setRoominfo(String roominfo) {
		this.roominfo = roominfo;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
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
		return "Room [roid=" + roid + ", acid=" + acid + ", price=" + price + ", guests=" + guests + ", room=" + room
				+ ", roominfo=" + roominfo + ", roomtype=" + roomtype + ", breakfast=" + breakfast + ", image01="
				+ image01 + ", image02=" + image02 + ", image03=" + image03 + "]";
	}

	
	
	
}
