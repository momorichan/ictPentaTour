package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.shopping.model.bean.Flight;
import com.shopping.model.bean.Product;
import com.shopping.utility.MyUtility;

public class FlyDao extends SuperDao{

	public int InsertData(Flight bean) throws Exception
	{	
		System.out.println(bean);
		 
		int cnt = -1;
		conn = super.getConnection();
		String sql = " insert into flight(regid,flid, seat,stopover,passengers,price) ";
		sql += " 	    values(seqregid.nextval,   ?,    ?,       ?,         ?,    ?) ";

		conn.setAutoCommit(false);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, bean.getFlid());
		pstmt.setString(2, bean.getSeat());
		pstmt.setString(3, bean.getStopover());
		pstmt.setInt(4, bean.getPassengers());
		pstmt.setInt(5, bean.getPrice() * bean.getPassengers());
		
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
}
