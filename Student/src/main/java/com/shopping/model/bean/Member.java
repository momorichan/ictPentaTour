package com.shopping.model.bean;

public class Member {
	private String meid ;
	private String name ;
	private String password;
	private String gender ;
	private String birth ; // 날짜 형식
	private String marriage ;
	private Integer salary ;
	private String address ;
	private String manager ;
	private Integer mpoint ;

	// 취미는 차후 데이터 베이스에서 반영 하지 않을 것임
	private String hobby ;	
	
	
	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public Member(String meid, String name, String password, String gender, String birth, String marriage, Integer salary,
			String address, String manager, String hobby) {
		super();
		this.meid = meid;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.birth = birth;
		this.marriage = marriage;
		this.salary = salary;
		this.address = address;
		this.manager = manager;
		this.hobby = hobby;
	}

	public Member() {
	
	}
	

	@Override
	public String toString() {
		return "Member [meid=" + meid + ", name=" + name + ", password=" + password + ", gender=" + gender + ", birth="
				+ birth + ", marriage=" + marriage + ", salary=" + salary + ", address=" + address + ", manager="
				+ manager + ", mpoint=" + mpoint + ", hobby=" + hobby + "]";
	}

	public Integer getMpoint() {
		return mpoint;
	}

	public void setMpoint(Integer mpoint) {
		this.mpoint = mpoint;
	}

	public String getMeid() {
		return meid;
	}
	public void setMeid(String meid) {
		this.meid = meid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	
	
}