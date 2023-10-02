package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.AcRoomPrice;
import com.shopping.utility.Paging;

public class AcRoomPriceDao extends SuperDao{

	public int getTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.println("검색할 필드명 : " + mode);
		System.out.println("검색할 키워드 : " + keyword);

		// 테이블의 모든 행 개수를 구합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT count(*) as cnt FROM accommodation";

		if (mode == null || mode.equals("all")) {// 전체 모드인 경우

		} else {// 전체 모드가 아닌 경우
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		conn = getConnection();
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
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
		return cnt;
	}

	public List<AcRoomPrice> selectAll(Paging pageInfo) throws Exception  {
		// topN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		List<AcRoomPrice> lists = new ArrayList<AcRoomPrice>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		
		String sql = " with ranked as ( "
				+ " SELECT a.acid, a.name, a.address, a.image01 image, COALESCE(MIN(r.price), 0) minprice, "
				+ " rank() over(order by a.acid asc) as ranking "
				+ " FROM ACCOMMODATION a "
				+ " LEFT JOIN ROOMS r ON a.acid = r.acid ";
		
		if (mode == null || mode.equals("all")) {// 전체 모드인 경우

		} else {// 전체 모드가 아닌 경우
			sql += " where " + mode + " like '%" + keyword + "%' " ;
		}		
		
		sql +=  " GROUP BY a.acid, a.name, a.address, a.image01 "
				+ " order by acid desc "
				+ " ) "
				+ " select ranked.acid, ranked.name, ranked.address, ranked.image, ranked.minprice "
				+ " from ranked where ranking between ? and ? ";
		
		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

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
	
	private AcRoomPrice getBeanData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		AcRoomPrice bean = new AcRoomPrice();
		
		bean.setAcid(rs.getInt("acid"));
		bean.setMinprice(rs.getInt("minprice"));
		bean.setName(rs.getString("name"));
		bean.setAddress(rs.getString("address"));
		bean.setImage(rs.getString("image"));
		
		return bean;
	}
	
}
