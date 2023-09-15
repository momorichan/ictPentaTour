package com.shopping.model.bean;

public class Rentalcar {
	private int rcid; // 렌터카 번호
	private String cartype; // 차 종류...소형, 중형, 대형 
	private String startLocation; // 픽업 장소. 렌트시작
	private String endLocation; // 반납 장소. 렌트 끝
	private String startDate; // 대여 시작일
	private String endDate; // 
	private int price;
	private String paaengers;

	public Rentalcar(int rcid, String cartype, String startLocation, String endLocation, String startDate,
			String endDate, int price, String paaengers) {
		super();
		this.rcid = rcid;
		this.cartype = cartype;
		this.startLocation = startLocation;
		this.endLocation = endLocation;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.paaengers = paaengers;
	}
	public Rentalcar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getRcid() {
		return rcid;
	}
	public void setRcid(int rcid) {
		this.rcid = rcid;
	}
	public String getCartype() {
		return cartype;
	}
	public void setCartype(String cartype) {
		this.cartype = cartype;
	}
	public String getStartLocation() {
		return startLocation;
	}
	public void setStartLocation(String startLocation) {
		this.startLocation = startLocation;
	}
	public String getEndLocation() {
		return endLocation;
	}
	public void setEndLocation(String endLocation) {
		this.endLocation = endLocation;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPaaengers() {
		return paaengers;
	}
	public void setPaaengers(String paaengers) {
		this.paaengers = paaengers;
	}
	@Override
	public String toString() {
		return "Rentalcar [rcid=" + rcid + ", cartype=" + cartype + ", startLocation=" + startLocation
				+ ", endLocation=" + endLocation + ", startDate=" + startDate + ", endDate=" + endDate + ", price="
				+ price + ", paaengers=" + paaengers + "]";
	}

}
