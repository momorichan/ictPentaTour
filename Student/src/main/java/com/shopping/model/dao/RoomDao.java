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
		bean.setImage01(rs.getString("image01"));
		bean.setImage02(rs.getString("image02"));
		bean.setImage03(rs.getString("image03"));
		return bean;
	}

	public Room getDataByPk(int roid) throws Exception{
		Room bean = new Room();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from rooms where roid = ?" ;

		conn = super.getConnection();

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

	public List<Room> getDataByFk(Integer acid) throws Exception{
		//외래키 acid로 모든 방 정보를 반환
		List<Room> lists = new ArrayList<Room>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from rooms where acid = ?" ;

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, acid);

		rs = pstmt.executeQuery();

		while (rs.next()) {
			lists.add(getBeanData(rs));
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

		return lists;
	}

	public List<String> randomImage(Integer acid) throws Exception{
List<String> lists = new ArrayList<String>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select image01, image02, image03 from (select * from rooms where acid = ? order by DBMS_RANDOM.RANDOM) where rownum <= 5" ;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, acid);
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			lists.add(rs.getString("image01"));
			lists.add(rs.getString("image02"));
			lists.add(rs.getString("image03"));
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
		
		return lists;
	}

	public int InsertData(Room bean) throws Exception{
		int cnt = -1;
		
		String sql = " insert into rooms(roid, acid, room, roominfo, price, breakfast, guests, image01, image02, image03)" ;
		sql += "values(roomseq.nextval, 0, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getRoom());
		pstmt.setString(2, bean.getRoominfo());
		pstmt.setInt(3, bean.getPrice());
		pstmt.setString(4, bean.getBreakfast());
		pstmt.setInt(5, bean.getGuests());
		pstmt.setString(6, bean.getImage01());
		pstmt.setString(7, bean.getImage02());
		pstmt.setString(8, bean.getImage03());

		cnt = pstmt.executeUpdate();
		conn.commit();

		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}

	public List<Room> getTempRoom() throws Exception{
		List<Room> lists = new ArrayList<Room>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from rooms where acid = 0" ;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			lists.add(getBeanData(rs));
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
		return lists;
	}
	
}
