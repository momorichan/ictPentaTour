package com.shopping.model.bean;

public class Rentalcar {
	private String rcid; // 렌터카 번호
	private String carType; // 차 종류...소형, 중형, 대형 
	private String startLocation; // 픽업 장소. 렌트시작
	private String endLocation; // 반납 장소. 렌트 끝
	private String startDate; // 대여 시작일
	private String endDate; // 반납일
	private int price; // 대여료, 가격
	private String passengers;// 차량의 최대 탑승인원
	String getRcid() {
		return rcid;
	}
	void setRcid(String rcid) {
		this.rcid = rcid;
	}
	String getCarType() {
		return carType;
	}
	void setCarType(String carType) {
		this.carType = carType;
	}
	String getStartLocation() {
		return startLocation;
	}
	void setStartLocation(String startLocation) {
		this.startLocation = startLocation;
	}
	String getEndLocation() {
		return endLocation;
	}
	void setEndLocation(String endLocation) {
		this.endLocation = endLocation;
	}
	String getStartDate() {
		return startDate;
	}
	void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	String getEndDate() {
		return endDate;
	}
	void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	int getPrice() {
		return price;
	}
	void setPrice(int price) {
		this.price = price;
	}
	String getPassengers() {
		return passengers;
	}
	void setPassengers(String passengers) {
		this.passengers = passengers;
	}
	public Rentalcar(String rcid, String carType, String startLocation, String endLocation, String startDate,
			String endDate, int price, String passengers) {
		super();
		this.rcid = rcid;
		this.carType = carType;
		this.startLocation = startLocation;
		this.endLocation = endLocation;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.passengers = passengers;
	}
	public Rentalcar() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Rentalcar [rcid=" + rcid + ", carType=" + carType + ", startLocation=" + startLocation
				+ ", endLocation=" + endLocation + ", startDate=" + startDate + ", endDate=" + endDate + ", price="
				+ price + ", passengers=" + passengers + "]";
	}

	

}
