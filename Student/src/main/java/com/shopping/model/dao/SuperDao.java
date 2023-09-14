package com.shopping.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SuperDao {
	protected Connection conn = null;
	
	public SuperDao() { //step01. 드라이버 로딩
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConncetion() {//step02. 접속 객체 구하기
		String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
		String id = "shopping" ; // 사용자의 계정 정보
		String password = "oracle" ; // 사용자의 비밀 번호
		
		try {
			this.conn = DriverManager.getConnection(url, id, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int getTotalRecordCount(String table, String mode, String keyword) throws Exception{
		System.out.println("검색할 필드명 : " + mode);
		System.out.println("검색할 키워드 : " + keyword);
		
		// 테이블의 모든 행 개수를 구합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		
	    String sql = " SELECT count(*) as cnt FROM " + table;
	    
		if(mode==null||mode.equals("all")) {//전체 모드인 경우
			
		}else {//전체 모드가 아닌 경우
		    sql += " where " + mode + " like '%" + keyword + "%'";
		}
	    
		conn = getConncetion();
		pstmt = conn.prepareStatement(sql);
		
	    rs = pstmt.executeQuery();
	    
	    int cnt = -1;
	    
		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}
	

	
	










}
