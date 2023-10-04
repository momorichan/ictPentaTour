package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Amenities;

public class AmenitiesDao extends SuperDao{

	public List<Amenities> getDataListByFk(int acid) throws Exception{
		List<Amenities> lists = new ArrayList<Amenities>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select amid from amenitiedetails where acid = ?" ;

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, acid);

		rs = pstmt.executeQuery();

		while (rs.next()) {
			int amid = rs.getInt("amid");
			lists.add(getAmenitiesData(amid));
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

	private Amenities getAmenitiesData(int amid) throws Exception{
		Amenities bean = new Amenities();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from amenities where amid = ?" ;

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, amid);

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

	private Amenities getBeanData(ResultSet rs) throws Exception{
		Amenities bean = new Amenities();
		
		bean.setAmid(rs.getInt("amid"));
		bean.setName(rs.getString("name"));
		bean.setDescription(rs.getString("description"));
		bean.setImage(rs.getString("image"));
		
		return bean;
	}

	public List<Amenities> selectAll() throws Exception{
		List<Amenities> lists = new ArrayList<Amenities>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from amenities" ;

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

	public int insertData(Amenities bean) throws Exception{
		int cnt = -1;
		
		String sql = " insert into amenities(amid, name, description, image)" ;
		sql += "values(amseq.nextval, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql);


		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getDescription());
		pstmt.setString(3, bean.getImage());

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


}
