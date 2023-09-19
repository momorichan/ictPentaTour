package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.shopping.model.bean.Flight;

public class FlyDao extends SuperDao{

	public int InsertData(Flight bean) throws Exception
	{	
		System.out.println(bean);
		 
		int cnt = -1;
		conn = super.getConncetion();
		String sql = " insert into flight(regid,flid, seat,stopover,passengers,price) ";
		sql += " 	    values(seqregid.nextval,   ?,    ?,       ?,         ?,    ?) ";

		conn.setAutoCommit(false);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bean.getFlid());
		pstmt.setString(2, bean.getSeat());
		pstmt.setString(3, bean.getStopover());
		pstmt.setInt(4, bean.getPassengers());
		pstmt.setInt(5, bean.getPrice());
		
		cnt = pstmt.executeUpdate();
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public Flight getDataByAirLine(int flid)  throws Exception
	{
		System.out.println("flid : " + flid);
		
		String sql = " select * from airline ";
		sql += " where flid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, flid);
		rs = pstmt.executeQuery();		
		
		Flight bean = null;
		if(rs.next())
		{
			bean = this.getBeanData(rs);
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		
		return bean;
	}

	private Flight getBeanData(ResultSet rs) throws Exception
	{
		Flight bean = new Flight();
		
		bean.setFlid(rs.getInt("flid"));
		bean.setPassengers(rs.getInt("passengers"));
		bean.setPrice(rs.getInt("price"));
		bean.setRegid(rs.getInt("regid"));
		bean.setSeat(rs.getString("seat"));
		bean.setStopover(rs.getString("stopover"));

		return bean;
	}
	
	
	
	

}
