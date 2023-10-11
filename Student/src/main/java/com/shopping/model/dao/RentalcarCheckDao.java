package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.bean.RentalcarCheck;
import com.shopping.model.bean.Roomreser;

public class RentalcarCheckDao extends SuperDao{
	// rcid 를 이용하여 해당 예약 정보에 대한 Bean 객체를 반환해줍니다.
	
	public List<RentalcarCheck> getDataByMeid(String meid) throws Exception{
		List<RentalcarCheck> bean = new ArrayList<RentalcarCheck>();
		String sql = " select * \r\n"
				+ "from rcreserve";
		sql += " where meid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, meid);
		rs = pstmt.executeQuery();		
		
		while(rs.next())
		{
			bean.add(this.getRcReserData(rs));
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}
	
	private RentalcarCheck getRcReserData(ResultSet rs) throws Exception{
		RentalcarCheck bean = new RentalcarCheck();
		
		bean.setMeid(rs.getString("meid"));
		bean.setRecid(rs.getInt("recid"));
		bean.setRcid(rs.getString("rcid"));
		
		return bean;
	}

	// rentalCheck 테이블에 예약 정보 등록
	public int InsertDataToCheck(Rentalcar bean, Member mbean) throws Exception{
		// 예약 정보를 데이터베이스(rentalCheck)에 추가합니다.
		System.out.println("예약 등록 bean: \n" + bean);
		PreparedStatement pstmt = null;
		String sql = " insert into rentalCheck(rcid, id)";
		sql += " values(?,?)";
		int cnt = -1;
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getRcid());
		pstmt.setString(2, mbean.getMeid());
		cnt = pstmt.executeUpdate() ;
		conn.commit();		
		
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}		
		return cnt;
	}
	// rentalCheck 테이블에서 정보 가져오기	

}
