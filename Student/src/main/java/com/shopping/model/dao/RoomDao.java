package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Room;

public class RoomDao extends SuperDao{

	public Room getBeanData(ResultSet rs) throws Exception{
		Room bean = new Room();
		
		bean.setAcid(rs.getInt("acid"));
		bean.setGuests(rs.getInt("guests"));
		bean.setPrice(rs.getInt("price"));
		bean.setRoid(rs.getInt("roid"));
		bean.setBreakfast(rs.getString("breakfast"));
		bean.setRoom(rs.getString("room"));
		bean.setRoominfo(rs.getString("roominfo"));
		bean.setRoomtype(rs.getString("roomtype"));
		
		return bean;
	}

	public Room getDataByPk(int roid) throws Exception{
		Room bean = new Room();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from rooms where roid = ?" ;

		conn = super.getConncetion();

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, roid);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			bean = getBeanData(rs);
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return bean;
	}
	
}
