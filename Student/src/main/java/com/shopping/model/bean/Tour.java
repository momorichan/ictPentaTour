package com.shopping.model.bean;

public class Tour {
	private int toid;
	private String location;
	private String tname;
	private int tprice;
	private String tusedate;
	private int texdate;
	private int tage;
	private String tcontent;
	private int tfreeage;
	private String timage01;
	private String timage02;
	private String timage03;
	/**
	 * @return the toid
	 */
	public int getToid() {
		return toid;
	}
	/**
	 * @param toid the toid to set
	 */
	public void setToid(int toid) {
		this.toid = toid;
	}
	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}
	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}
	/**
	 * @return the tname
	 */
	public String getTname() {
		return tname;
	}
	/**
	 * @param tname the tname to set
	 */
	public void setTname(String tname) {
		this.tname = tname;
	}
	/**
	 * @return the tprice
	 */
	public int getTprice() {
		return tprice;
	}
	/**
	 * @param tprice the tprice to set
	 */
	public void setTprice(int tprice) {
		this.tprice = tprice;
	}
	/**
	 * @return the tusedate
	 */
	public String getTusedate() {
		return tusedate;
	}
	/**
	 * @param tusedate the tusedate to set
	 */
	public void setTusedate(String tusedate) {
		this.tusedate = tusedate;
	}
	/**
	 * @return the tage
	 */
	public int getTage() {
		return tage;
	}
	/**
	 * @param tage the tage to set
	 */
	public void setTage(int tage) {
		this.tage = tage;
	}
	/**
	 * @return the tcontent
	 */
	public String getTcontent() {
		return tcontent;
	}
	/**
	 * @param tcontent the tcontent to set
	 */
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	/**
	 * @return the tfreeage
	 */
	public int getTfreeage() {
		return tfreeage;
	}
	/**
	 * @param tfreeage the tfreeage to set
	 */
	public void setTfreeage(int tfreeage) {
		this.tfreeage = tfreeage;
	}
	/**
	 * @return the timage01
	 */
	public String getTimage01() {
		return timage01;
	}
	/**
	 * @param timage01 the timage01 to set
	 */
	public void setTimage01(String timage01) {
		this.timage01 = timage01;
	}
	/**
	 * @return the timage02
	 */
	public String getTimage02() {
		return timage02;
	}
	/**
	 * @param timage02 the timage02 to set
	 */
	public void setTimage02(String timage02) {
		this.timage02 = timage02;
	}
	/**
	 * @return the timage03
	 */
	public String getTimage03() {
		return timage03;
	}
	/**
	 * @param timage03 the timage03 to set
	 */
	public void setTimage03(String timage03) {
		this.timage03 = timage03;
	}
	
	public Tour() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the texdate
	 */
	public int getTexdate() {
		return texdate;
	}
	/**
	 * @param texdate the texdate to set
	 */
	public void setTexdate(int texdate) {
		this.texdate = texdate;
	}
	public Tour(int toid, String location, String tname, int tprice, String tusedate, int texdate, int tage,
			String tcontent, int tfreeage, String timage01, String timage02, String timage03) {
		super();
		this.toid = toid;
		this.location = location;
		this.tname = tname;
		this.tprice = tprice;
		this.tusedate = tusedate;
		this.texdate = texdate;
		this.tage = tage;
		this.tcontent = tcontent;
		this.tfreeage = tfreeage;
		this.timage01 = timage01;
		this.timage02 = timage02;
		this.timage03 = timage03;
	}
	@Override
	public String toString() {
		return "Tour [toid=" + toid + ", location=" + location + ", tname=" + tname + ", tprice=" + tprice
				+ ", tusedate=" + tusedate + ", texdate=" + texdate + ", tage=" + tage + ", tcontent=" + tcontent
				+ ", tfreeage=" + tfreeage + ", timage01=" + timage01 + ", timage02=" + timage02 + ", timage03="
				+ timage03 + "]";
	}
	
	
}
