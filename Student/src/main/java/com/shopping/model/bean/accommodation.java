package com.shopping.model.bean;

public class accommodation {
	private int acid;
	private int price;
	private int rating;
	private int guests;
	
	private String room;
	private String roominfo;
	private String name;
	private String description;
	private String checkin;
	private String checkout;
	private String breakfast;
	private String review;
	private String roomtype;
	private String image;
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
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
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}

	@Override
	public String toString() {
		return "accommodation [acid=" + acid + ", price=" + price + ", rating=" + rating + ", guests=" + guests
				+ ", room=" + room + ", roominfo=" + roominfo + ", name=" + name + ", description=" + description
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", breakfast=" + breakfast + ", review=" + review
				+ ", roomtype=" + roomtype + ", image=" + image + "]";
	}
	public accommodation() {}
	
	
	
}
