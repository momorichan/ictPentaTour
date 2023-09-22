package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Board;
import com.shopping.model.bean.Review;
import com.shopping.utility.Paging;

public class ReviewDao extends SuperDao {

	public int getTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.println("검색할 필드명 : " + mode);
		System.out.println("검색할 키워드 : " + keyword);

		// 테이블의 모든 행 개수를 구합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT count(*) as cnt FROM review";

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
	
	public List<Review> selectAll(Paging pageInfo, String attribute) throws Exception  {
		// topN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		List<Review> lists = new ArrayList<Review>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();

		String column = " TRID, MEID, TOID, ACID, REGDATE, RATING, CONTENT";
		
		String sql = " select " + column;
		sql += " from ( select " + column + ", rank() over(order by ACID asc) as ranking";
		sql += " from review ";

		if (mode == null || mode.equals("all")) {// 전체 모드인 경우

		} else {// 전체 모드가 아닌 경우
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		sql += " ) ";
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
	
	private Review getBeanData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		Review bean = new Review();
		
		bean.setTrid(rs.getInt("trid"));
		bean.setMeid(rs.getString("meid"));
		bean.setToid(rs.getInt("toid"));
		bean.setAcid(rs.getInt("acid"));
		bean.setRegdate(rs.getString("regdate"));
		bean.setRating(rs.getInt("rating"));
		bean.setContent(rs.getString("content"));
		return bean;
	}
	
	public Review getDataByPk(Integer trid) throws Exception{
		Review bean = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from review";
		sql += " where trid = ? ";
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, trid);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			bean = getBeanData(rs);
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	
		return bean;
	}

	public Review getDataByPrimaryKey(String trid) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Review bean = null;
		
		String sql = " select * from review";
		sql += " where trid = ?";
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql); 
		
		pstmt.setString(1, trid);
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			bean = getBeanData(rs);
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

	public int InsertData(Review bean) throws Exception{
System.out.println(bean);
		
		int cnt = -1;
		
		String sql = " insert into review(meid, rating, regdate, content)";
		sql += " values(?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		
		conn = super.getConncetion();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, bean.getMeid());
		pstmt.setString(2, bean.getRegdate());
		pstmt.setInt(3, bean.getRating());
		pstmt.setString(4, bean.getContent());

		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public int UpdateData(Review bean) throws Exception{
		System.out.println(bean);
		
		int cnt = -1;
		
		String sql = " update review set meid = ?, rating = ?, content = ?, regdate = ?";
		PreparedStatement pstmt = null;
		
		conn = super.getConncetion();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, bean.getMeid());
		pstmt.setInt(2, bean.getRating());
		pstmt.setString(3, bean.getContent());
		pstmt.setString(4, bean.getRegdate());
		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}
}
