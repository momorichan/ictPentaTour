package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Board;
import com.shopping.utility.Paging;

public class BoardDao extends SuperDao{
	public int InsertData(Board bean) throws Exception{
		System.out.println(bean);
		
		int cnt = -1;
		
		String sql = " insert into boards(no, id, password, subject, content, regdate, groupno, orderno, depth)";
		sql += " values(seqboard.nextval, ?, ?, ?, ?, ?, seqboard.currval, default, default)";
		PreparedStatement pstmt = null;
		
		conn = super.getConncetion();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getSubject());
		pstmt.setString(4, bean.getContent());
		pstmt.setString(5, bean.getRegdate());

		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}



	public List<Board> selectAll(Paging pageInfo, String attribute) throws Exception{
		//topN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		List<Board> lists = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select " + attribute;
		sql += " from (select " + attribute;
		sql += ",  rank() over(order by groupno desc, orderno asc) as ranking";
		sql += 		 " from boards";
		
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		
		if(mode==null||mode.equals("all")) {//전체 모드인 경우
			
		}else {//전체 모드가 아닌 경우
		    sql += " where " + mode + " like '%" + keyword + "%'";
		}		
		
		sql += ")";
		sql += 		 " where ranking between ? and ?";
		

		
		conn = super.getConncetion();
		
		pstmt = conn.prepareStatement(sql); 
		
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			lists.add(getBeanData(rs));
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}	
	
	private Board getBeanData(ResultSet rs) throws Exception{
		Board bean = new Board();
		
		bean.setNo(rs.getInt("no"));
		bean.setReadhit(rs.getInt("readhit"));
		bean.setDepth(rs.getInt("depth"));
		bean.setGroupno(rs.getInt("groupno"));
		bean.setOrderno(rs.getInt("orderno"));
		bean.setLikes(rs.getInt("likes"));
		bean.setHates(rs.getInt("hates"));
		
		bean.setId(rs.getString("id"));
		bean.setPassword(rs.getString("password"));
		bean.setSubject(rs.getString("subject"));
		bean.setContent(rs.getString("content"));
		bean.setRegdate(String.valueOf(rs.getDate("regdate")));

		return bean;
	}

	public Board getDataByPrimaryKey(String no) throws Exception {
		PreparedStatement pstmtUpdate = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rs = null;
		Board bean = null;
		
		String updateSql = "UPDATE boards SET readhit = readhit + 1 WHERE no = ?";
	    String selectSql = "SELECT * FROM boards WHERE no = ?";
		
		conn = super.getConncetion();
		
	    pstmtUpdate = conn.prepareStatement(updateSql);
	    pstmtUpdate.setString(1, no);
	    pstmtUpdate.executeUpdate();
		
	    pstmtSelect = conn.prepareStatement(selectSql);
	    pstmtSelect.setString(1, no);
	    rs = pstmtSelect.executeQuery();
	    
		while (rs.next()) {
			bean = getBeanData(rs);
		}
		
		if(rs!= null) {rs.close();}
		if(pstmtUpdate != null) {pstmtUpdate.close();}
		if(pstmtSelect != null) {pstmtSelect.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}



	public Board getDataByPk(Integer no) throws Exception{
		Board bean = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from boards";
		sql += " where no = ? ";
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			bean = getBeanData(rs);
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	
		return bean;
	}
	
	public int UpdateData(Board bean) throws Exception{
		System.out.println(bean);
		
		int cnt = -1;
		
		String sql = " update boards set password = ?, subject = ?, content = ?, regdate = ?, groupno = ?, orderno = ?, depth = ?";
		sql += " where no = ?";
		PreparedStatement pstmt = null;
		
		conn = super.getConncetion();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, bean.getPassword());
		pstmt.setString(2, bean.getSubject());
		pstmt.setString(3, bean.getContent());
		pstmt.setString(4, bean.getRegdate());
		pstmt.setInt(5, bean.getGroupno());
		pstmt.setInt(6, bean.getOrderno());
		pstmt.setInt(7, bean.getDepth());		
		pstmt.setInt(8, bean.getNo());
		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}



	public Integer getReplyCount(int groupno) throws Exception{
		System.out.println("검색할 그룹 번호 : " + groupno);
		//해당 그룹 번호의 데이터 행 개수를 반환해줍니다.
		Integer cnt = -1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select count(*) as cnt from boards";
		sql += " where groupno = ?";
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql); 
		
		pstmt.setInt(1, groupno);

		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		//단계5
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
			
		return cnt;
	}	
	
	public int ReplyData(Board bean, Integer orderno) throws Exception{
		System.out.println(bean);

		PreparedStatement updatepstmt = null;
		PreparedStatement insertpstmt = null;
		
		int cnt = -1;
		
		conn = super.getConncetion();//단계2
		conn.setAutoCommit(false);
		
		//step1 : 동일한 그룹 번호에 대하여 orderno 컬럼의 숫자를 1씩 증가 시켜야 합니다.
		String updatesql = " update boards set orderno = orderno + 1";
		updatesql += " where groupno = ? and orderno > ? "; 
		
		updatepstmt = conn.prepareStatement(updatesql);
		
		updatepstmt.setInt(1, bean.getGroupno());
		updatepstmt.setInt(2, orderno);
		
		cnt = updatepstmt.executeUpdate();
		
		// step2 : bean 객체 정보를 이용하여 답글을 작성합니다.
		String insertsql = " insert into boards(no, id, password, subject, content, regdate, groupno, orderno, depth)";
		insertsql += " values(seqboard.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		insertpstmt = conn.prepareStatement(insertsql); 
		
		insertpstmt.setString(1, bean.getId());
		insertpstmt.setString(2, bean.getPassword());
		insertpstmt.setString(3, bean.getSubject());
		insertpstmt.setString(4, bean.getContent());
		insertpstmt.setString(5, bean.getRegdate());
		insertpstmt.setInt(6, bean.getGroupno());
		insertpstmt.setInt(7, bean.getOrderno());
		insertpstmt.setInt(8, bean.getDepth());

		cnt = insertpstmt.executeUpdate();
		
		
		conn.commit();
		
		if(updatepstmt != null) {updatepstmt.close();}
		if(insertpstmt != null) {insertpstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}



	public int UpdateEmoticon(int no, String columnName) throws Exception{
		Integer cnt = -1;
		PreparedStatement pstmt = null;
		
		String sql = " UPDATE boards SET " + columnName + " = " + columnName + " + 1 WHERE no = ?";
		
		conn = super.getConncetion();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql); 
		
		pstmt.setInt(1, no);
		
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
			
		return cnt;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}