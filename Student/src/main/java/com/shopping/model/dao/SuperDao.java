package com.shopping.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class SuperDao {	
	protected Connection conn = null ;
	
	public Connection getConnection() { // step02. 접속 객체 구하기
		String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
		String id = "travels" ; // 사용자의 계정 정보
		String password = "oracle" ; // 사용자의 비밀 번호
		
		try {
			this.conn = DriverManager.getConnection(url, id, password) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn ;
	}
	
	public SuperDao() { // step01. 드라이버 로딩
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		try {
			Class.forName(driver) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
