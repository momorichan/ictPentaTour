package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.shopping.model.bean.Review;
import com.shopping.utility.Paging;

public class ReviewDao extends SuperDao {

	public int getTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.println("검색할 필드명 : " + mode);
		System.out.println("검색할 키워드 : " + keyword);

		// 테이블의 모든 행 개수를 구합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT count(*) as cnt FROM tourreview";

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
	

	public List<Review> getDataByAcid(Paging pageInfo, int acid) throws Exception{
		List<Review> lists = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		String column = " TRID, MEID, TOID, ACID, REGDATE, RATING, CONTENT";
		
		String sql = " select " + column;
		sql += " from ( select " + column + ", rank() over(order by acid asc) as ranking";
		sql += " from tourreview where acid = ?";
		sql += " ) ";
		sql += " where ranking between ? and ? order by regdate desc";
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		
		pstmt.setInt(1, acid);
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
	
	public List<Review> getDataByToid(Paging pageInfo, int toid) throws Exception{
		List<Review> lists = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		String column = " TRID, MEID, TOID, ACID, REGDATE, RATING, CONTENT";
		
		String sql = " select " + column;
		sql += " from ( select " + column + ", rank() over(order by regdate asc) as ranking";
		sql += " from tourreview where toid = ?";
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
	
	public List<Review> selectAll(Paging pageInfo, String attribute) throws Exception {
	    List<Review> lists = new ArrayList<Review>();

	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    String mode = pageInfo.getMode();
	    String keyword = pageInfo.getKeyword();

	    String column = "TRID, MEID, TOID, ACID, REGDATE, RATING, CONTENT";

	    // SQL 쿼리 문자열을 StringBuilder를 사용하여 더 효율적으로 작성합니다.
	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT ").append(column).append(",");
	    sql.append(" RANK() OVER (ORDER BY regdate DESC) AS ranking ");
	    sql.append("FROM tourreview ORDER BY regdate DESC ");


	    // 서브쿼리 내부의 괄호와 최종 결과의 괄호를 정확하게 닫아줍니다.
	    sql.insert(0, "SELECT * FROM (");
	    sql.append(") WHERE ranking BETWEEN ? AND ?");

	    conn = super.getConnection();

	    pstmt = conn.prepareStatement(sql.toString());

	    int parameterIndex = 1;

	    if (mode != null && !mode.equals("all")) {
	        // 모드가 "all"이 아닌 경우에만 파라미터를 설정합니다.
	        pstmt.setString(1, "%" + keyword + "%");
	    }

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
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from tourreview";
		sql += " where trid = ? ";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, trid);
		rs = pstmt.executeQuery();
		
		Review bean = null ;
		
		if (rs.next()) {
			bean = this.getBeanData(rs);
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	
		return bean;
	}

	public Review getDataByPrimaryKey(int trid) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Review bean = null;
		
		String sql = " select * from tourreview";
		sql += " where trid = ?";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql); 
		
		pstmt.setInt(1, trid);
		
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
		String sql = " insert into tourreview(trid, meid, rating, regdate, content)";
		sql += " values(tourreviewseq.nextval, 'admin', ?, sysdate, ?)";
		PreparedStatement pstmt = null;
		
		conn = super.getConnection();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setInt(1, bean.getRating());
		pstmt.setString(2, bean.getContent());

		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public int DeleteData(int trid) throws Exception {
	    String sql = "";
	    PreparedStatement pstmt = null;
	    int cnt = -1;

	    Review bean = this.getDataByPrimaryKey(trid);

	    conn = super.getConnection();
	    conn.setAutoCommit(false);

	    // SQL 쿼리 설정
	    sql = "DELETE FROM tourreview WHERE trid = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, trid);

	    // 쿼리 실행
	    cnt = pstmt.executeUpdate();

	    conn.commit();

	    // 리소스 정리
	    if (pstmt != null) {
	        pstmt.close();
	    }
	    if (conn != null) {
	        conn.close();
	    }

	    return cnt;
	}
	
	public double calculateAverageRating() throws Exception{
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    double averageRating = 0;
	    
	    String sql = " SELECT AVG(rating) AS average_rating FROM tourreview";

	    conn = getConnection();
	    pstmt = conn.prepareStatement(sql);
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

	    return averageRating;
	}
	public double calculateAverageRating(int acid) throws Exception{
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    double averageRating = 0;
	    
	    String sql = " SELECT AVG(rating) AS average_rating FROM tourreview where acid = ?";

	    conn = getConnection();
	    pstmt = conn.prepareStatement(sql);
	    
	    pstmt.setInt(1, acid);
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
	
	public int getTotalRecordCount(int acid) throws Exception {

		// 테이블의 모든 행 개수를 구합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " SELECT count(*) as cnt FROM tourreview where acid = ?";

		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, acid);
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
	
	public int commentAdd() throws Exception{
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int commentAdd = 0;
	    
	    String sql = " SELECT COUNT(*) AS comment_add FROM tourreview";

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
}
