
package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Rentalcar;
import com.shopping.utility.Paging;

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
	


	public List<Rentalcar> selectSLSDED(Paging pageInfo, String startLocation, String startDate, String endDate)throws Exception {
		return null;
	}


	public List<Rentalcar> selectSL(Paging pageInfo, String startLocation)throws Exception {
		return null;
	}


	public List<Rentalcar> selectSLELSDED(Paging pageInfo, String startLocation, String endLocation, String startDate, String endDate)throws Exception {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";	

		if(pageInfo.getStartLocation() != null || pageInfo.getStartLocation().equals("all")) {
			sql += " where startLocation ='" + pageInfo.getStartLocation() + "'";
			sql += " where endLocation= '" + pageInfo.getEndLocation() + "'";			
		}
		
		sql += ") ";
		sql += " where ranking between ? and ?";
		
		conn = super.getConnection();
			
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
	
//		오류 체크		
		System.out.println("SLELSDED: "+sql);
		System.out.println("getBeginRow: "+pageInfo.getBeginRow());
		System.out.println("getEndRow: "+pageInfo.getEndRow());
		
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
	public List<Rentalcar> selectSL(Paging pageInfo, String startLocation) throws Exception{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";	

		if(pageInfo.getStartLocation() != null || pageInfo.getStartLocation().equals("all")) {
			sql += " where startLocation ='" + pageInfo.getStartLocation() + "'";
		}
		sql += ") ";
		sql += " where ranking between ? and ?";
		
		conn = super.getConnection();
			
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
	
//		오류 체크		
		System.out.println("SL: "+sql);
		System.out.println("getBeginRow: "+pageInfo.getBeginRow());
		System.out.println("getEndRow: "+pageInfo.getEndRow());
		
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
	

	public List<Rentalcar> selectSDED(Paging pageInfo, String startDate, String endDate)throws Exception {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";	
		sql += " where startLocation= '" + startDate + "'";
		sql += " and endLocation='" + endDate + "'";
		sql += ") ";
		sql += " where ranking between ? and ?";
		
		conn = super.getConnection();
			
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
	
//		오류 체크		
		System.out.println("SDED SQL: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());
		
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
	public List<Rentalcar> selectSLEL(Paging pageInfo, String startLocation, String endLocation) throws Exception{
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";	
		sql += " where startLocation= '" + startLocation + "'";
		sql += " and endLocation='" + endLocation + "'";
		sql += ") ";
		sql += " where ranking between ? and ?";
		
		conn = super.getConnection();
			
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
	
//		오류 체크		
		System.out.println("SLEL SQL: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());
		
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
//		오류 체크		
		System.out.println("selectAll SQL: " + sql);
		
		
		
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
	
	/* 렌터카 검색 카운터 SL, EL, SD, ED */
	public int GetTotalRecordCountSLELSDED(String startLocation, String endLocation, String startDate, String endDate) throws Exception {
		System.out.println("대여 장소, 반납 장소, 날짜까지 선택");
		System.out.println("대여: " + startLocation);
		System.out.println("반납: " + endLocation);
		System.out.println("시작일: " + startDate);
		System.out.println("종료일: " + endDate);
		
		
		
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar " ;
		if(startLocation == null || startLocation.equals("all")) {			
		}else { // 전체 모드가 아니면
			if(endLocation == null) {
				sql += " where startLocation = '" + startLocation + "'";
			}else {	
				sql += " where startLocation = '" + startLocation + "'";
				sql += " and endLocation = '" + endLocation +"'";
			}			
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

	
	
	/* 렌터카 검색 장소 카운터 SD, ED*/
	public int GetTotalRecordCountSDED(String startDate, String endDate) throws Exception {
		System.out.println("시작일, 종료일 둘다 선택");
		System.out.println("시작일 : "+ startDate);
		System.out.println("종료일 : "+ endDate);
		
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar " ;
		if(startDate== null || startDate.equals("all") ) {	
		}else { // 전체 모드가 아니면			
			if(endDate== null || endDate.equals("all")) {
				sql += " where startDate= '" + startDate+ "'";
			}else {
				sql += " where startDate= '" + startDate+ "'";
				sql += " and endDate'" + endDate+ "'";
			}		
		}		
		
		System.out.println("SDED: " + sql);
		
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
	/* SL, EL*/
	public int GetTotalRecordCountSLEL(String startLocation, String endLocation) throws Exception {
		System.out.println("대여, 반납 둘다 선택");
		System.out.println("대여 장소: "+ startLocation);
		System.out.println("반납 장소: "+ endLocation);
		
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar " ;
		if(startLocation == null || startLocation.equals("all") ) {			
		}else { // 전체 모드가 아니면			
			if(endLocation == null || endLocation.equals("all")) {
				sql += " where startLocation = '" + startLocation + "'";
				sql += " and endLocation = '" + endLocation + "'";
			}else {
				sql += " where startLocation = '" + startLocation + "'";
				sql += " and endLocation ='" + endLocation + "'";
			}
			
		}
		System.out.println("SLEL: " + sql); 
		
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



	public int GetTotalRecordCount() {
		// TODO Auto-generated method stub
		return 0;
	}


	public int GetTotalRecordCountOnlyEndLocation(String endLocation) {
		// TODO Auto-generated method stub
		return 0;
	}


	public int GetTotalRecordCountOnlyStartLocation(String startLocation) {
		// TODO Auto-generated method stub
		return 0;
	}


	public List<Rentalcar> selectAN(Paging pageInfo) {
		// TODO Auto-generated method stub
		return null;
	}



}
