package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.shopping.model.bean.Product;
import com.shopping.model.check.BookingItem;

public class ReserveDao extends SuperDao{

	public BookingItem getBookingItem(String meid)  throws Exception {
		
		BookingItem bean = this.GetDataById(meid);
		
		
		
		
		
		
		
		// TODO Auto-generated method stub
		return null;
	}

	public BookingItem GetDataById(String meid)  throws Exception {
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null ;		
		String sql = " select * from reservation ";
		sql += " where meid = ? " ;
		
		conn = super.getConnection();		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setString(1, meid); 
		
		rs = pstmt.executeQuery() ;
		
		BookingItem bean = null ;
		
		if(rs.next()) {
			bean = this.getBeanData(rs);
			
		}		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

	public BookingItem getBeanData(ResultSet rs) throws Exception {
		
		BookingItem bean = new BookingItem()  ;
		
		bean.setMeid(rs.getString("meid"));
		bean.setMid(rs.getInt("mid"));
		bean.setRcid(rs.getInt("rcid"));
		bean.setRegid(rs.getInt("regid"));
		bean.setReid(rs.getInt("reid"));
		bean.setToid(rs.getInt("toid"));
		bean.setStartdate(String.valueOf(rs.getDate("startdate")));
		bean.setEnddate(String.valueOf(rs.getDate("enddate")));
		
		return bean;
	}
	
	
	
	
	

}
