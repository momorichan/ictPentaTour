package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Comment;

public class CommentDao extends SuperDao{

	public List<Comment> GetDataByPk(int no) throws Exception{
		//해당 게시물 번호에 달려 있는 댓글 목록을 정렬시켜 반환해줍니다.
		List<Comment> lists = new ArrayList<Comment>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from comments";
		sql += " where no = ? order by cnum asc";
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			lists.add(getBeanData(rs));
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	
		return lists;	
	}

	private Comment getBeanData(ResultSet rs) throws Exception{
		Comment bean = new Comment();
		
		bean.setCnum(rs.getInt("cnum"));
		bean.setNo(rs.getInt("no"));
		bean.setId(rs.getString("id"));
		bean.setContent(rs.getString("content"));
		bean.setRegdate(rs.getString("regdate"));
		
		return bean;
	}

	public int InsertData(Comment bean) throws Exception{
		//넘겨진 댓글 정보를 데이터 베이스에 추가
		System.out.println(bean);
		
		int cnt = -1;
		
		PreparedStatement pstmt = null;

		
		String sql = " insert into comments(cnum, no, id, content, regdate)";
		sql += " values(seqcomm.nextval, ?, ?, ?, default)";
		
		conn = super.getConncetion();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bean.getNo());
		pstmt.setString(2, bean.getId());
		pstmt.setString(3, bean.getContent());

		cnt = pstmt.executeUpdate();	
		
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	
		return cnt;
	}

	public int DeleteData(int cnum) throws Exception{
		//댓글 번호 cnum을 삭제
		int cnt = -1;
		
		PreparedStatement pstmt = null;

		
		String sql = " delete from comments";
		sql += " where cnum = ?";
		
		conn = super.getConncetion();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cnum);


		cnt = pstmt.executeUpdate();	
		
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	
		return cnt;
	}
}
