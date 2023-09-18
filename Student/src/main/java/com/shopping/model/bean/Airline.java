package com.shopping.model.bean;

public class Airline {
	
	private int flid;
	private String depart;
	private String arrive;
	private String detime;
	private String artime;
	
	public Airline() {}
	public Airline(int flid, String depart, String arrive, String detime, String artime) {
		super();
		this.flid = flid;
		this.depart = depart;
		this.arrive = arrive;
		this.detime = detime;
		this.artime = artime;
	}
	@Override
	public String toString() {
		return "Airline [name=" + flid + ", depart=" + depart + ", arrive=" + arrive + ", detime=" + detime
				+ ", artime=" + artime + "]";
	}

	
	
	public int getFlid() {
		return flid;
	}
	public void setFlid(int flid) {
		this.flid = flid;
	}
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getArrive() {
		return arrive;
	}
	public void setArrive(String arrive) {
		this.arrive = arrive;
	}
	public String getDetime() {
		return detime;
	}
	public void setDetime(String detime) {
		this.detime = detime;
	}
	public String getArtime() {
		return artime;
	}
	public void setArtime(String artime) {
		this.artime = artime;
	}
	
	
	
	

}
