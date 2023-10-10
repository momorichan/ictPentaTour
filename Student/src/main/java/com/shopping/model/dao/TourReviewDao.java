package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Review;
import com.shopping.utility.Paging;

public class TourReviewDao extends SuperDao {

	public int getTotalRecordCount(int toid) throws Exception {

		// 테이블의 모든 행 개수를 구합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT count(*) as cnt FROM review where toid = ?";

		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, toid);
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
		sql += " from review order by regdate desc";

		if (mode == null || mode.equals("all")) {// 전체 모드인 경우

		} else {// 전체 모드가 아닌 경우
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		sql += " ) ";
		sql += " where ranking between ? and ?";
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
		
		conn = super.getConnection();
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
		
		conn = super.getConnection();
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
		String sql = " insert into review(trid, meid, toid, acid, rating, regdate, content)";
		sql += " values(reviewseq.nextval, ?, ?, null, ?, sysdate, ?)";
		PreparedStatement pstmt = null;
		
		conn = super.getConnection();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, bean.getMeid());
		if(bean.getToid() != null) {
			pstmt.setInt(2, bean.getToid());
		} else {
			pstmt.setInt(2, 0);
		}
		pstmt.setInt(3, bean.getRating());
		pstmt.setString(4, bean.getContent());

		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public int DeleteData(int trid) throws Exception{
		
		int cnt = -1;
		
		String sql = " delete from review where trid = ?";
		PreparedStatement pstmt = null;
		
		conn = super.getConnection();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setInt(1, trid);
		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}
	public double calculateAverageRating(int toid) throws Exception{
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    double averageRating = 0;
	    
	    String sql = " SELECT AVG(rating) AS average_rating FROM review where toid = ?";

	    conn = getConnection();
	    pstmt = conn.prepareStatement(sql);
	    
	    pstmt.setInt(1, toid);
	    rs = pstmt.executeQuery();

	    if (rs.next()) {
	        averageRating = rs.getDouble("average_rating"); // "average_rating"으로 열을 가져옴
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
	    
	    averageRating = Math.round(averageRating * 100) / 100.0;
	    return averageRating;
	}
	
	public int commentAdd() throws Exception{
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int commentAdd = 0;
	    
	    String sql = " SELECT COUNT(*) AS comment_add FROM review";

	    conn = getConnection();
	    pstmt = conn.prepareStatement(sql);
	    rs = pstmt.executeQuery();

	    if (rs.next()) {
	    	commentAdd = rs.getInt("comment_add"); // "comment_add"으로 열을 가져옴
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

	    return commentAdd;
	}

	public List<Review> getDataByToid(Paging pageInfo, int toid) throws Exception{
		List<Review> lists = new ArrayList<Review>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();

		String column = " TRID, MEID, TOID, ACID, REGDATE, RATING, CONTENT";
		
		String sql = " select " + column;
		sql += " from ( select " + column + ", rank() over(order by trid desc) as ranking";
		sql += " from review where toid = ?";
		sql += " ) ";
		sql += " where ranking between ? and ? order by regdate desc";
		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, toid);
		pstmt.setInt(2, pageInfo.getBeginRow());
		pstmt.setInt(3, pageInfo.getEndRow());

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
