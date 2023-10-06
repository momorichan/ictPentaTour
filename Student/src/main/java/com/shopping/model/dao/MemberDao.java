package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;
import com.shopping.utility.MyUtility;
import com.shopping.utility.Paging;

public class MemberDao extends SuperDao{
	
	public Member getDataByPk(String meid, String password) throws Exception{
		Member bean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// ?를 placehoder라고 합니다. 치환되어야 할 영역		
		
		String sql = "select * from members ";
		sql += "where meid = ? and password = ?";

		conn = super.getConnection();//단계2
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, meid);
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
		
		bean.setMeid(rs.getString("meid"));
		bean.setPassword(rs.getString("password"));
		bean.setName(rs.getString("name"));
		bean.setGender(rs.getString("gender"));
		bean.setBirth(String.valueOf(rs.getDate("birth")));
		bean.setPhone(rs.getString("phone"));
		bean.setAddress(rs.getString("address"));
		bean.setRole(rs.getString("role"));

		return bean;
	}

	public int InsertData(Member bean) throws Exception{
		System.out.println(bean);
		
		int cnt = -1;

		// ?를 placehoder라고 합니다. 치환되어야 할 영역		
		String sql = " insert into members(meid, password, name, gender, birth, phone, address, role)";
		sql += " values(?, ?, ?, ?, ?, ?, ?, '1')";
		PreparedStatement pstmt = null;
		
		conn = super.getConnection();//단계2
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); //단계3
		
		pstmt.setString(1, bean.getMeid());
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getName());
		pstmt.setString(4, bean.getGender());
		pstmt.setString(5, bean.getBirth());
		pstmt.setString(6, bean.getPhone());
		pstmt.setString(7, bean.getAddress());
		
		cnt = pstmt.executeUpdate();//단계4-1
		conn.commit();
		
		//단계5
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public Member getDataByPrimaryKey(String meid) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;
		
		String sql = " select * from members";
		sql += " where meid = ?";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql); 
		
		pstmt.setString(1, meid);
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			bean = getBeanData(rs);
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

	public List<Member> selectAll(Paging pageInfo) throws Exception{
		//topN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		List<Member> lists = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		
		String sql = " select meid, password, name, gender, birth, phone, address, role";
		sql += " from (select meid, password, name, gender, birth, phone, address, role, rank() over(order by meid asc) as ranking";
		sql += 		 " from members";
		
		if(mode==null||mode.equals("all")) {//전체 모드인 경우
			
		}else {//전체 모드가 아닌 경우
		    sql += " where " + mode + " like '%" + keyword + "%'";
		}
		
		sql += 		 ")";
		sql += 		 " where ranking between ? and ?";
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
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
	
	public int deleteData(String meid) throws Exception{
		
		String sql = " delete from members where meid = ?";
		int cnt = -1;
		PreparedStatement pstmt = null;
		
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, meid);
		
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
		
		return cnt;
	}

	public int GetTotalRecordCount() throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from members " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ; 
		
		int cnt = -1 ;
		
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}

	public int UpdateMemberData(Member bean) throws Exception{
		int cnt = -1;
		
		String sql = " update members set password=?, name=?, gender=?, birth=?, phone=?, address=? where meid=?";
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getPassword());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getGender());
		pstmt.setString(4, bean.getBirth());
		pstmt.setString(5, bean.getPhone());
		pstmt.setString(6, bean.getAddress());
		pstmt.setString(7, bean.getMeid());
		
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		if(pstmt!=null) {
			pstmt.close();
		}
		if(conn!=null) {
			conn.close();
		}
		
		return cnt;
	}	
}












