package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Room;
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

	public List<accommodation> selectAll(Paging pageInfo) throws Exception  {
		// topN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		List<accommodation> lists = new ArrayList<accommodation>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();

		
		String column = " ACID, ADDRESS, NAME, DESCRIPTION, image01, image02, image03";
		
		String sql = " select " + column;
		sql += " from ( select " + column + ", rank() over(order by ACID asc) as ranking";
		sql += " from accommodation ";

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
	
	private accommodation getBeanData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		accommodation bean = new accommodation();
		
		bean.setAcid(rs.getInt("acid"));
		
		bean.setName(rs.getString("name"));
		bean.setAddress(rs.getString("address"));
		bean.setDescription(rs.getString("description"));
		bean.setImage01(rs.getString("image01"));
		bean.setImage02(rs.getString("image02"));
		bean.setImage03(rs.getString("image03"));
		
		

		return bean;
	}

	public List<Room> getDataByPkList(Integer acid) throws Exception{
		List<Room> lists = new ArrayList<>();
		RoomDao roomdao = new RoomDao();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from rooms where acid = ?" ;

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, acid);

		rs = pstmt.executeQuery();

		while (rs.next()) {
			lists.add(roomdao.getBeanData(rs));
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

	public accommodation getDataByPk(Integer acid) throws Exception{
		accommodation bean = new accommodation();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from accommodation where acid = ?" ;

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, acid);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			bean = getBeanData(rs);
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

		return bean;
	}

	public int InsertData(accommodation bean, int[] amlist) throws Exception{
		int cnt = -1;
		
		String sql = " insert into accommodation(acid, address, name, description, image01, image02, image03)" ;
		sql += "values(acseq.nextval, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getAddress());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getDescription());
		pstmt.setString(4, bean.getImage01());
		pstmt.setString(5, bean.getImage02());
		pstmt.setString(6, bean.getImage03());

		cnt = pstmt.executeUpdate();
		
		if (pstmt != null) {
			pstmt.close();
		}
		
		if(amlist.length != 0) {
			for(int amid : amlist) {
				sql = " insert into amenitiedetails(acid, amid) values(acseq.currval,?)" ;
				
				pstmt = conn.prepareStatement(sql);
	
				pstmt.setInt(1,amid);
				
				cnt = pstmt.executeUpdate();
				
				if (pstmt != null) {
					pstmt.close();
				}		
			}
		}
		conn.commit();
		
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return cnt;
	}

	public int updateData(accommodation bean, int[] amlist) throws Exception{
		int cnt = -1;
		
		String sql = " update accommodation set address = ?, name = ?, description = ?, image01 = ?, image02 = ?, image03 = ? " ;
		sql += " where acid = ?";
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getAddress());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getDescription());
		pstmt.setString(4, bean.getImage01());
		pstmt.setString(5, bean.getImage02());
		pstmt.setString(6, bean.getImage03());
		pstmt.setInt(7, bean.getAcid());

		cnt = pstmt.executeUpdate();
		
		if (pstmt != null) {
			pstmt.close();
		}
		
		sql = " update rooms set acid = ? where acid = 0" ;
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1,bean.getAcid());
		
		cnt = pstmt.executeUpdate();
		
		if (pstmt != null) {
			pstmt.close();
		}			
		
		sql = " delete from amenitiedetails where acid = ?" ;
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1,bean.getAcid());
		
		cnt = pstmt.executeUpdate();
		
		if (pstmt != null) {
			pstmt.close();
		}		
		
		
		if(amlist.length != 0) {
			for(int amid : amlist) {
				sql = " insert into amenitiedetails(acid, amid) values(?,?)" ;
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,bean.getAcid());
				pstmt.setInt(2,amid);
				
				cnt = pstmt.executeUpdate();
				
				if (pstmt != null) {
					pstmt.close();
				}		
			}
		}
		conn.commit();
		
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return cnt;
	}

	public int deleteData(int acid) throws Exception {
		int cnt = -1;
		
		String sql = " delete from accommodation where acid = ? " ;
		
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, acid);

		cnt = pstmt.executeUpdate();
		
		conn.commit();
		
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return cnt;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}