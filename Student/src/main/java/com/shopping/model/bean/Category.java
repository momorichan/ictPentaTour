package com.shopping.model.bean;

public class Category {
	private String module ;
	private String type ;
	private Integer ordering;
	private String engname;
	private String korname;
	//	렌터카 카테고리 추가 ++ 10.9 
	private String startLocation; // 픽업 장소. 렌트시작
	private String endLocation; // 반납 장소. 렌트 끝
	
	public Category() {}
	
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
	public String getModule() {
		return module;
	}


	public void setModule(String module) {
		this.module = module;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public Integer getOrdering() {
		return ordering;
	}


	public void setOrdering(Integer ordering) {
		this.ordering = ordering;
	}


	public String getEngname() {
		return engname;
	}


	public void setEngname(String engname) {
		this.engname = engname;
	}


	public String getKorname() {
		return korname;
	}


	public void setKorname(String korname) {
		this.korname = korname;
	}


	@Override
	public String toString() {
		return "Category [module=" + module + ", type=" + type + ", ordering=" + ordering + ", engname=" + engname
				+ ", korname=" + korname + "]";
	}
	
	
}

