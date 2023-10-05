package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.util.List;

import com.shopping.model.bean.Rrdetails;

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

}
