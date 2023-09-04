package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Board;

public class BoardDao extends SuperDao{
	public Board getDataByPk(int no) {
		Board bean = new Board(no, "hong", "abc123", "jsp 프로그래밍", "잼있어요", 
				10,"2023/08/20",0);
		
		return bean;
	}
	
	public List<Board> getDataList(){
		List<Board> lists = new ArrayList<Board>();
		
		lists.add(new Board(1, "hong", "abc123", "jsp 프로그래밍", "잼있어요", 
				10,"2023/08/20",0));
		lists.add(new Board(2, "park", "abc123", "자바", "잼있어요", 
				20,"2023/08/20",0));
		lists.add(new Board(3, "kim", "abc123", "파이썬", "잼있어요", 
				30,"2023/08/20",0));
		lists.add(new Board(4, "lee", "abc123", "c", "잼있어요", 
				40,"2023/08/20",0));
		lists.add(new Board(5, "hwang", "abc123", "c++", "잼있어요", 
				50,"2023/08/20",1));
		lists.add(new Board(6, "kang", "abc123", "루비", "잼있어요", 
				60,"2023/08/20",1));
		lists.add(new Board(7, "choi", "abc123", "c#", "잼있어요", 
				70,"2023/08/20",2));
		
		return lists;
	}

	public int InsertData(Board bean) throws Exception{
		System.out.println(bean);
		
		int cnt = -1;
		
		String sql = " insert into boards(no, id, password, subject, content, regdate)";
		sql += " values(seqboard.nextval, ?, ?, ?, ?, ?)";
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

	public List<Board> selectAll() throws Exception{
		//모든 게시물 목록을 게시물 글번호 역순 정렬하여 반환합니다.
		List<Board> lists = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from boards order by no desc";

		conn = super.getConncetion();
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); 
		
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

		bean.setId(rs.getString("id"));
		bean.setPassword(rs.getString("password"));
		bean.setSubject(rs.getString("subject"));
		bean.setContent(rs.getString("content"));
		bean.setRegdate(String.valueOf(rs.getDate("regdate")));

		return bean;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}