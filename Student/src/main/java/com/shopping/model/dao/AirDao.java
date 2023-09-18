package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Airline;
import com.shopping.utility.Paging;

public class AirDao extends SuperDao{

	public int GetTotalRecordCount(String mode, String keyword, String mode2,String keyword2) throws Exception 
	{
		System.out.print("검색할 필드명 : " + mode);
		System.out.println(", 검색할 키워드명 : " + keyword);
		System.out.print(" 검색할 필드명 : " + mode2);
		System.out.println(", 검색할 키워드명 : " + keyword2);
		
		
		//기본 키 정보를 이용하여 bean객체를 구합니다.
		String sql = " select count(*) as cnt from airline";
		
		if(keyword == null || keyword.equals("all"))
		{
			if(keyword2 == null || keyword2.equals("all"))
			{
				
			}
			else
			{
				sql += " where " + mode2 + " like '%" + keyword2 + "%'";
			}
		}
		else
		{
			sql += " where " + mode + " like '%" + keyword + "%'";
			if(keyword2 == null || keyword2.equals("all"))
			{
				
			}
			else
			{
				sql += " and " + mode2 + " like '%" + keyword2 + "%'";
			}
		}
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		int cnt = -1;
		
		if(rs.next())
		{
			cnt = rs.getInt("cnt");
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}
	
	public int GetTotalRecordCount(String mode, String keyword) throws Exception 
	{
		System.out.print("검색할 필드명 : " + mode);
		System.out.println(", 검색할 키워드명 : " + keyword);
		
		//기본 키 정보를 이용하여 bean객체를 구합니다.
		String sql = " select count(*) as cnt from airline";
		
		if(mode == null || mode.equals("all"))
		{
	
		}
		else
		{
			sql += " where " + mode + " like '%" + keyword + "%'";
		}
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		int cnt = -1;
		
		if(rs.next())
		{
			cnt = rs.getInt("cnt");
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public List<Airline> selectAll(Paging pageInfo) throws Exception {
		
		// Top N 구문을 사용하여 페이징 처리된 게시물 목록을 리턴합니다.
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;

		String sql =" select flid,depart,arrive,detime,artime";
		sql += " from (select flid,depart,arrive,detime,artime, rank() over(order by flid asc) as ranking ";
		sql += " from airline ";
		
		if(pageInfo.getKeyword() == null || pageInfo.getKeyword().equals("all") ) 
		{	
			if(pageInfo.getKeyword2() == null || pageInfo.getKeyword2().equals("all"))
			{
				
				
			}
			else
			{
				
				sql += " where " + pageInfo.getMode2() + " like '%" + pageInfo.getKeyword2() + "%'" ;
			}
			
		}
		else 
		{ 
			sql += " where " + pageInfo.getMode() + " like '%" + pageInfo.getKeyword() + "%'" ;
			
			
			
			System.out.println("keyword2 : " + pageInfo.getKeyword2());
			
			if(pageInfo.getKeyword2() == null || pageInfo.getKeyword2().equals("all"))
			{
				
				
			}
			else
			{
				sql += " and " + pageInfo.getMode2() + " like '%" + pageInfo.getKeyword2() + "%'" ;
			}
		}
		sql	+= ")";
		sql	+= " where ranking between ? and ?";	
		
		conn = super.getConncetion();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		
		rs = pstmt.executeQuery();
		
		List<Airline> lists = new ArrayList<Airline>();
		
		while(rs.next())
		{
			lists.add(getBeanData(rs));
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}

	private Airline getBeanData(ResultSet rs) throws Exception
	{
		
		Airline bean = new Airline();
		

		bean.setFlid(rs.getInt("flid"));
		bean.setDepart(rs.getString("depart"));
		bean.setArrive(rs.getString("arrive"));
		bean.setDetime(rs.getString("detime"));
		bean.setArtime(rs.getString("artime"));

		
		return bean;
	}

	public Airline GetDataByPk(String fname) throws Exception
	{
		String sql = " select * from airline where flid = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, fname);
	
		rs = pstmt.executeQuery();
		
		Airline bean = null;
		
		if(rs.next())
		{
			
			bean = getBeanData(rs);
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

	public Airline getDataByFlid(Integer flid) throws Exception
	{	
		System.out.println("flid : " + flid);
		
		
		
		String sql = " select * from airline ";
		sql += " where flid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, flid);
		rs = pstmt.executeQuery();		
		
		Airline bean = null;
		if(rs.next())
		{
			bean = this.getBeanData(rs);
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		
		return bean;
	}

	public List<Airline> selectA(Paging pageInfo) throws Exception
	{
		// Top N 구문을 사용하여 페이징 처리된 게시물 목록을 리턴합니다.
				PreparedStatement pstmt = null;
				
				ResultSet rs = null;

				String sql =" select flid,depart,arrive,detime,artime";
				sql += " from (select flid,depart,arrive,detime,artime, rank() over(order by flid asc) as ranking ";
				sql += " from airline ";
				
				String mode = pageInfo.getMode() ;
				String keyword = pageInfo.getKeyword() ; 
				
				if(mode == null || mode.equals("all") ) 
				{	
					
				}
				else {
					
					sql += " where " + mode + " like '%" + keyword + "%'" ;
				}
				
				sql += " ) " ;
				sql += " where ranking between ? and ? " ;
				
				conn = super.getConncetion();
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, pageInfo.getBeginRow());
				pstmt.setInt(2, pageInfo.getEndRow());
				
				rs = pstmt.executeQuery();
				
				List<Airline> lists = new ArrayList<Airline>();
				
				while(rs.next())
				{
					lists.add(getBeanData(rs));
				}
				
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
				return lists;
	}

}
