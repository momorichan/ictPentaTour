package com.shopping.model.bean;

public class Flight {
	
	
	private int regid;
	private int flid;
	private String seat;
	private String stopover;
	private int passengers;
	private int price;
	
	
	
	
	public Flight() {
	
	}
	public Flight(int regid, int flid, String fname, String seat, String stopover, int passengers, int price) {
		super();
		this.regid = regid;
		this.flid = flid;
		this.seat = seat;
		this.stopover = stopover;
		this.passengers = passengers;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Flight [regid=" + regid + ", flid=" + flid + ", seat=" + seat + ", stopover="
				+ stopover + ", passengers=" + passengers + ", price=" + price + "]";
	}
	public int getRegid() {
		return regid;
	}
	public void setRegid(int regid) {
		this.regid = regid;
	}
	public int getFlid() {
		return flid;
	}
	public void setFlid(int flid) {
		this.flid = flid;
	}

	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getStopover() {
		return stopover;
	}
	public void setStopover(String stopover) {
		this.stopover = stopover;
	}
	public int getPassengers() {
		return passengers;
	}
	public void setPassengers(int passengers) {
		this.passengers = passengers;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	

}
