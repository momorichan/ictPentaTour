package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;

public class MemberDao extends SuperDao{
	public Member getDataByPk(String id) {
		Member bean = new Member(id, "김호철", "abc123", "female", "2023/08/20", "미혼", 
				100, "역삼", "kim9", "탁구,축구,");
		
		return bean;
	}
	
	public List<Member> getDataList(){
		List<Member> lists = new ArrayList<Member>();
		
		lists.add(new Member("kim", "김호철", "abc123", "female", "2023/08/20", "미혼", 
				100, "역삼", "kim9", "탁구,축구,"));
		lists.add(new Member("hong", "홍길동", "abc123", "female", "2023/08/20", "미혼", 
				100, "마포", "kim9", "탁구,축구,"));
		lists.add(new Member("park", "박영희", "abc123", "female", "2023/08/20", "미혼", 
				100, "역삼", "kim9", "탁구,축구,"));
		lists.add(new Member("kang", "강우식", "abc123", "female", "2023/08/20", "미혼", 
				100, "역삼", "kim9", "탁구,축구,"));
		lists.add(new Member("choi", "최문숙", "abc123", "female", "2023/08/20", "미혼", 
				100, "역삼", "kim9", "탁구,축구,"));
		lists.add(new Member("kim", "김호철", "abc123", "female", "2023/08/20", "미혼", 
				100, "역삼", "kim9", "탁구,축구,"));
		
		return lists;
	}

	public Member getDataByPk(String id, String password) throws Exception{
		Member bean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// ?를 placehoder라고 합니다. 치환되어야 할 영역		
		
		String sql = "select * from members ";
		sql += "where id = ? and password = ?";

		conn = super.getConncetion();//단계2
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		
		rs = pstmt.executeQuery();//단계4-1
		
		
		if(rs.next()) {//1건이 조회됨
			bean = getBeanData(rs);
		}
		
		
		//단계5
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

	private Member getBeanData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		Member bean = new Member();
		
		bean.setId(rs.getString("id"));
		bean.setName(rs.getString("name"));
		bean.setPassword(rs.getString("password"));
		bean.setGender(rs.getString("gender"));
		bean.setBirth(String.valueOf(rs.getDate("birth")));
		bean.setMarriage(rs.getString("marriage"));
		bean.setSalary(rs.getInt("salary"));
		bean.setAddress(rs.getString("address"));
		bean.setManager(rs.getString("manager"));

		return bean;
	}

	public int InsertData(Member bean) throws Exception{
		System.out.println(bean);
		
		int cnt = -1;

		// ?를 placehoder라고 합니다. 치환되어야 할 영역		
		String sql = " insert into members(id, name, password, gender, birth, marriage, salary, address, manager)";
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		
		conn = super.getConncetion();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getPassword());
		pstmt.setString(4, bean.getGender());
		pstmt.setString(5, bean.getBirth());
		pstmt.setString(6, bean.getMarriage());
		pstmt.setInt(7, bean.getSalary());
		pstmt.setString(8, bean.getAddress());
		pstmt.setString(9, bean.getManager());
		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public List<Member> selectAll() throws Exception{
		//모든 게시물 목록을 게시물 글번호 역순 정렬하여 반환합니다.
		List<Member> lists = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from members";

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
}













