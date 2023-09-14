package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.accommodation;
import com.shopping.utility.Paging;

public class AccommodationDao extends SuperDao {

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

		conn = getConncetion();
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

	public List<accommodation> selectAll(Paging pageInfo) throws Exception  {
		// topN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		List<accommodation> lists = new ArrayList<accommodation>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();

		String sql = " select ACID, ROOM, ROOMINFO, NAME, DESCRIPTION, CHECKIN, CHECKOUT, PRICE, BREAKFAST, REVIEW, RATING, ROOMTYPE, GUESTS, image";
		sql += " from (select ACID, ROOM, ROOMINFO, NAME, DESCRIPTION, CHECKIN, CHECKOUT, PRICE, BREAKFAST, REVIEW, RATING, ROOMTYPE, GUESTS, image , rank() over(order by ACID asc) as ranking";
		sql += " from accommodation";

		if (mode == null || mode.equals("all")) {// 전체 모드인 경우

		} else {// 전체 모드가 아닌 경우
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		sql += ")";
		sql += " where ranking between ? and ?";
		conn = super.getConncetion();

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
	
	private accommodation getBeanData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		accommodation bean = new accommodation();
		
		bean.setAcid(rs.getInt("acid"));
		bean.setPrice(rs.getInt("price"));
		bean.setRating(rs.getInt("rating"));
		bean.setGuests(rs.getInt("guests"));
		
		bean.setRoom(rs.getString("room"));
		bean.setRoominfo(rs.getString("roominfo"));
		bean.setName(rs.getString("name"));
		bean.setDescription(rs.getString("description"));
		bean.setCheckin(rs.getString("checkin"));
		bean.setCheckout(rs.getString("checkout"));
		bean.setBreakfast(rs.getString("breakfast"));
		bean.setReview(rs.getString("review"));
		bean.setRoomtype(rs.getString("roomtype"));
		bean.setImage(rs.getString("image"));
		return bean;
	}
}
