
package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Rentalcar;
import com.shopping.utility.Paging_bak;

public class RentalcarDao extends SuperDao{
	
	public Rentalcar GetDataByPk(String rcid) throws Exception {
		// 렌트카 번호(String)를 이용하여 해당 상품에 대한 Bean 객체를 반환해 줍니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from rentalcar ";
		sql += " where rcid = ? " ;
		
		conn = super.getConnection();		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setString(1, rcid); 
		
		rs = pstmt.executeQuery() ;
		
		Rentalcar bean = null ;
		
		if(rs.next()) {
			bean = this.getBeanData(rs);
			
		}		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}	
	
	// 렌트카 리스트,페이징 둘다 수정해야함
	public List<Rentalcar> selectAll(Paging_bak pageInfo) throws Exception{
//		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
//		PreparedStatement pstmt = null ;
//		ResultSet rs = null ;
//		
//		// 가격이 저렴한 순으로 ranking
//		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers";
//		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, rank() over(order by price asc) as ranking";
//		sql += " from rentalcar ";
//
//		/*
//		 * String mode = pageInfo.getMode() ; String keyword = pageInfo.getKeyword() ;
//		 * if(mode == null || mode.equals("all") ) { }else { // 전체 모드가 아니면 sql +=
//		 * " where " + mode + " like '%" + keyword + "%'" ; }
//		 */
//
//		String startLocation = pageInfo.getStartLocation();
//		String endLocation = pageInfo.getEndLocation();
//		String startDate = pageInfo.getStartDate();
//		String endDate = pageInfo.getEndDate();
//		
//		if(startLocation != null || startLocation.equals("all")) {
//			if(startLocation.equalsIgnoreCase("all")) {				
//				System.out.println("대여 지점을 선택해주세요.");				
//			}else {
//				sql += " where startLocation = (" + startLocation + ")";
//			}			
//		}else if(end){
//			
//		}
//		sql += ") ";
//		sql += " where ranking between ? and ?";
//		
//		conn = super.getConnection();
//		
//		pstmt = conn.prepareStatement(sql) ;
//		pstmt.setInt(1, pageInfo.getBeginRow());
//		pstmt.setInt(2, pageInfo.getEndRow());
//		
//		rs = pstmt.executeQuery() ;
//		
		List<Rentalcar> lists = new ArrayList<Rentalcar>();
//		
//		while(rs.next()) {
//			lists.add(getBeanData(rs)) ;
//		}
//		
//		if(rs != null) {rs.close();}
//		if(pstmt != null) {pstmt.close();}
//		if(conn != null) {conn.close();}
		
		return lists;
	}
	// 가격 저렴한 순서
	public List<Rentalcar> selectAll() throws Exception{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from rentalcar where rownum <= 6 order by price "; // 
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ;
		
		List<Rentalcar> lists = new ArrayList<Rentalcar>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs)) ;
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}

	
	private Rentalcar getBeanData(ResultSet rs) throws Exception{
		// R
		Rentalcar bean = new Rentalcar();
		
		bean.setRcid(rs.getString("rcid"));
		bean.setCarType(rs.getString("carType"));
		bean.setStartLocation(rs.getString("startLocation"));
		bean.setEndLocation(rs.getString("endLocation"));
		bean.setStartDate(String.valueOf(rs.getString("startDate")));
		bean.setEndDate(String.valueOf(rs.getString("endDate")));
		bean.setPrice(rs.getInt("price"));
		bean.setPassengers(rs.getString("passengers"));
		
		return bean;
	}
	
	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.print("픽업날짜 : " + mode);
		System.out.println(", 검색할 키워드 : " + keyword);
		
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar " ;
		if(mode == null || mode.equals("all") ) {			
		}else { // 전체 모드가 아니면
			/* sql += " where " + mode + " like '%" + keyword + "%'" ; */
			sql += " where startLocation " + mode + " like '%" + keyword + "%'" ;
		}		
		
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
	public int GetTotalRecordCount() throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar " ;
		
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

	public int GetTotalRecordCount(String startLocation, String endLocation, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
