package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Flight;
import com.shopping.model.bean.Roomreser;
import com.shopping.model.bean.Rrdetails;
import com.shopping.model.bean.accommodation;

public class RoomreserDao extends SuperDao{

	public int insertData(String meid, List<Rrdetails> memberNames, String startDate, String endDate) throws Exception{
		int cnt = -1;
		
		String sql = "";
		
		sql = " insert into roomreser(rrid, meid, checkin, checkout) values(rrseq.nextval, ?, ?, ?) ";
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, meid);
		pstmt.setString(2, startDate);
		pstmt.setString(3, endDate);
		
		cnt = pstmt.executeUpdate();
		
		if (pstmt != null) {
			pstmt.close();
		}
		
		sql = " insert into rrdetails(roid, rrid, name, birth, gender, guests) values(?, rrseq.currval, ?, ?, ?, ?) ";
		
		for(Rrdetails bean : memberNames) {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,bean.getRoid());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getBirth());
			pstmt.setString(4, bean.getGender());
			pstmt.setInt(5,bean.getGuests());

			cnt = pstmt.executeUpdate();
			
			if (pstmt != null) {
				pstmt.close();
			}		
		}
		
		conn.commit();
		
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		
		return cnt;
	}
	
	private Roomreser getRoomReserData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		Roomreser bean = new Roomreser();
		
		bean.setMeid(rs.getString("meid"));
		bean.setRrid(rs.getInt("rrid"));
		bean.setCheckin(rs.getString("checkin"));
		bean.setCheckout(rs.getString("checkout"));
		
		return bean;
	}
	
	private Rrdetails getRrdetailsData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		Rrdetails bean = new Rrdetails();
		
		bean.setBirth(rs.getString("birth"));
		bean.setGender(rs.getString("gender"));
		bean.setGuests(rs.getInt("guests"));
		bean.setName(rs.getString("name"));
		bean.setRoid(rs.getInt("roid"));
		bean.setRrid(rs.getInt("rrid"));

		return bean;
	}
	
	public List<Roomreser> getDataByMeid(String meid) throws Exception{
		List<Roomreser> bean = new ArrayList<Roomreser>();
		String sql = " select * \r\n"
				+ "from roomreser";
		sql += " where meid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, meid);
		rs = pstmt.executeQuery();		
		
		while(rs.next())
		{
			bean.add(this.getRoomReserData(rs));
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

	public Rrdetails getDataByRrid(int rrid) throws Exception{
		Rrdetails bean = new Rrdetails();
		String sql = " select * \r\n"
				+ "from RRDETAILS";
		sql += " where rrid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rrid);
		rs = pstmt.executeQuery();		
		
		if(rs.next())
		{
			bean = this.getRrdetailsData(rs);
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}
	

}
