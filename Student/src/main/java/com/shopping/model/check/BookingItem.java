package com.shopping.model.check;

public class BookingItem {
	
	private int reid;
	private String meid;
	private int rcid;
	private int toid;
	private int mid;
	private int regid;
	private String startdate;
	private String enddate;
	
	
	public BookingItem()
	{
		
	}

	public BookingItem(int reid, String meid, int rcid, int toid, int mid, int regid, String startdate,
			String enddate) {
		super();
		this.reid = reid;
		this.meid = meid;
		this.rcid = rcid;
		this.toid = toid;
		this.mid = mid;
		this.regid = regid;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "BookingItem [reid=" + reid + ", meid=" + meid + ", rcid=" + rcid + ", toid=" + toid + ", mid=" + mid
				+ ", regid=" + regid + ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}
	public int getReid() {
		return reid;
	}
	public void setReid(int reid) {
		this.reid = reid;
	}
	public String getMeid() {
		return meid;
	}
	public void setMeid(String meid) {
		this.meid = meid;
	}
	public int getRcid() {
		return rcid;
	}
	public void setRcid(int rcid) {
		this.rcid = rcid;
	}
	public int getToid() {
		return toid;
	}
	public void setToid(int toid) {
		this.toid = toid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getRegid() {
		return regid;
	}
	public void setRegid(int regid) {
		this.regid = regid;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	
	
	
	
	
	
}
