package com.shopping.model.bean;

import java.util.HashMap;
import java.util.Map;

public class FlyManager {

	Map<Integer, Integer> booking = new HashMap<Integer, Integer>();
	
	public int getReserveList(){return booking.size();}	
	
	public void addFly(int flid, int regid)
	{
		if(this.booking.containsKey(flid))
		{
			
		}
		else
		{
			this.booking.put(flid, regid);
		}
	}
	
	public void removeAll(int flid, int regid)
	{
		this.booking.clear();
	}
	
	public Map<Integer,Integer> getAll()
	{
		return this.booking;
	}
	

}
