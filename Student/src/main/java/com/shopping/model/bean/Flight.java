package com.shopping.model.bean;

public class Flight {
	
	
	private int regid;
	private int flid;
	private String meid;
	private String seat;
	private String stopover;
	private int passengers;
	private int price;
	
	
	
	
	public Flight() {
	
	}


	
	
	


	public Flight(int regid, int flid, String meid, String seat, String stopover, int passengers, int price) {
		super();
		this.regid = regid;
		this.flid = flid;
		this.meid = meid;
		this.seat = seat;
		this.stopover = stopover;
		this.passengers = passengers;
		this.price = price;
	}







	@Override
	public String toString() {
		return "Flight [regid=" + regid + ", flid=" + flid + ", meid=" + meid + ", seat=" + seat + ", stopover="
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




	public String getMeid() {
		return meid;
	}




	public void setMeid(String meid) {
		this.meid = meid;
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
