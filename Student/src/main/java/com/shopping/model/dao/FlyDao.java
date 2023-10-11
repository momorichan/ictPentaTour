package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Flight;
import com.shopping.utility.MyUtility;

public class FlyDao extends SuperDao{

	public int InsertData(Flight bean) throws Exception
	{	
		int regid = -1;
	    
	    try {
	        conn = super.getConnection();
	        String sql = "INSERT INTO flight(regid, flid,meid, seat, stopover, passengers, price) ";
	        sql += "VALUES(seqregid.nextval,  ?, ?, ?, ?, ?, ?)";

	        conn.setAutoCommit(false);
	        PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "regid" });

	        pstmt.setInt(1, bean.getFlid());
	        pstmt.setString(2, bean.getMeid());
	        pstmt.setString(3, bean.getSeat());
	        pstmt.setString(4, bean.getStopover());
	        pstmt.setInt(5, bean.getPassengers());
	        pstmt.setInt(6, bean.getPrice() * bean.getPassengers());

	        int cnt = pstmt.executeUpdate();
	        if (cnt > 0) {
	            ResultSet generatedKeys = pstmt.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                regid = generatedKeys.getInt(1); // seqregid.nextval의 값 가져오기
	            }
	        }

	        conn.commit();

	        if (pstmt != null) {
	            pstmt.close();
	        }
	        if (conn != null) {
	            conn.close();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return regid;
	}

	public Flight getDataByAirLine(int flid)  throws Exception
	{
		System.out.println("flid : " + flid);
		
		String sql = " select * from airline ";
		sql += " where flid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
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
		
		bean.setRegid(rs.getInt("regid"));
		bean.setFlid(rs.getInt("flid"));
		bean.setMeid(rs.getString("meid"));
		bean.setPassengers(rs.getInt("passengers"));
		bean.setPrice(rs.getInt("price"));
		bean.setRegid(rs.getInt("regid"));
		bean.setSeat(rs.getString("seat"));
		bean.setStopover(rs.getString("stopover"));

		return bean;
	}

	public Flight getDataByFly(int flid)   throws Exception 
	{

		String sql = " select * from flight ";
		sql += " where flid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
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
	
	
	
	
	public Flight getDataByFly2(int regid)   throws Exception 
	{

		String sql = " select * from flight ";
		sql += " where regid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, regid);
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

	public Flight getDataByRegid(int regid) throws Exception 
	{
		
		
		String sql = " select * from flight ";
		sql += " where regid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, regid);
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

	public int deleteFly(int regid) throws Exception 
	{
		// 상품 번호를 이용하여 해당 상품을 삭제합니다.
		int cnt = -1;
		String sql = "";
		
		PreparedStatement pstmt = null;
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		// step 02 : 상품 테이블에서 해당 상품 번호와 관련된 행 삭제하기
		sql = " delete from flight where regid = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, regid);
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public List<Flight> getDataByFly3(String meid) throws Exception{
		List<Flight> bean = new ArrayList<Flight>();
		String sql = " select * \r\n"
				+ "from flight f left join airline a\r\n"
				+ "on f.flid = a.flid ";
		sql += " where meid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, meid);
		rs = pstmt.executeQuery();		
		
		while(rs.next())
		{
			bean.add(this.getBeanData(rs));
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

}
