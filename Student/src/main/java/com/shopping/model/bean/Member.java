package com.shopping.model.bean;

public class Member {
	private String meid ;
	private String password;
	private String name ;
	private String gender ;
	private String birth ; // 날짜 형식
	private String phone;
	private String address ;
	private String role ;
	private Integer status ;
	public String getMeid() {
		return meid;
	}
	public void setMeid(String meid) {
		this.meid = meid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Member [meid=" + meid + ", password=" + password + ", name=" + name + ", gender=" + gender + ", birth="
				+ birth + ", phone=" + phone + ", address=" + address + ", role=" + role + ", status=" + status + "]";
	}

	
	
}