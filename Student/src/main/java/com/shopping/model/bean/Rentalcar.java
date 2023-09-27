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
	
	// 9.27 추가 ++
	private String carName; //차량이름...아반떼, 그랜저
	private int cpnum; // 차량 상품 번호.
	private String carImage01; // 이미지
	private String carImage02;
	private String carImage03;
	
	
	public String getCarImage01() {
		return carImage01;
	}
	public void setCarImage01(String carImage01) {
		this.carImage01 = carImage01;
	}
	public String getCarImage02() {
		return carImage02;
	}
	public void setCarImage02(String carImage02) {
		this.carImage02 = carImage02;
	}
	public String getCarImage03() {
		return carImage03;
	}
	public void setCarImage03(String carImage03) {
		this.carImage03 = carImage03;
	}
	
	public Rentalcar(String rcid, String carType, String startLocation, String endLocation, String startDate, String endDate, int price, String passengers, String carName, int cpnum,
			String carImage01, String carImage02, String carImage03) {
		super();
		this.rcid = rcid;
		this.carType = carType;
		this.startLocation = startLocation;
		this.endLocation = endLocation;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.passengers = passengers;
		this.carName = carName;
		this.cpnum = cpnum;
		this.carImage01 = carImage01;
		this.carImage02 = carImage02;
		this.carImage03 = carImage03;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public int getCpnum() {
		return cpnum;
	}
	public void setCpnum(int cpnum) {
		this.cpnum = cpnum;
	}
	public String getRcid() {
		return rcid;
	}
	public void setRcid(String rcid) {
		this.rcid = rcid;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
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
	public String getPassengers() {
		return passengers;
	}
	public void setPassengers(String passengers) {
		this.passengers = passengers;
	}

	@Override
	public String toString() {
		return "Rentalcar [rcid=" + rcid + ", carType=" + carType + ", startLocation=" + startLocation + ", endLocation=" + endLocation + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", price=" + price + ", passengers=" + passengers + ", carName=" + carName + ", cpnum=" + cpnum + ", carImage01=" + carImage01 + ", carImage02=" + carImage02 + ", carImage03="
				+ carImage03 + "]";
	}
	public Rentalcar() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
