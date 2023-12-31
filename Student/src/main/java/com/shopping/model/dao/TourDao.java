package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.shopping.model.bean.Flight;
import com.shopping.model.bean.Tour;
import com.shopping.model.bean.TourReser;
import com.shopping.utility.Paging;

public class TourDao extends SuperDao {

	public int GetTotalRecordCount() throws Exception {
		String sql = " select count(*) cnt from tour";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

		return cnt;
	}

	public List<Tour> selectAll(Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		if (pageInfo.getKeyword() == null || pageInfo.getKeyword() == "") {
			sql = " select toid, location, tname, TPRICE, TUSEDATE, TEXDATE, TAGE, TCONTENT, TFREEAGE, TIMAGE01, TIMAGE02, TIMAGE03\r\n"
				+ "from (select toid, location, tname, TPRICE, TUSEDATE, TEXDATE, TAGE, TCONTENT, TFREEAGE, TIMAGE01, TIMAGE02, TIMAGE03, rank() over(order by toid desc) as ranking\r\n"
				+ "from tour)\r\n" + " where ranking between ? and ?";
		}

		else {
			sql = " select toid, location, tname, TPRICE, TUSEDATE, TEXDATE, TAGE, TCONTENT, TFREEAGE, TIMAGE01, TIMAGE02, TIMAGE03\r\n"
				+ "from (select toid, location, tname, TPRICE, TUSEDATE, TEXDATE, TAGE, TCONTENT, TFREEAGE, TIMAGE01, TIMAGE02, TIMAGE03, rank() over(order by toid desc) as ranking\r\n"
				+ "from tour where " + pageInfo.getMode() + " like '%" + pageInfo.getKeyword() + "%')\r\n"
				+ "where ranking between ? and ?";
		}

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		
		rs = pstmt.executeQuery();

		List<Tour> lists = new ArrayList<Tour>();
		while (rs.next()) {
			lists.add(getBeanData(rs));
		}
		
		if(pstmt != null)
			pstmt.close();
		if(rs != null)
			rs.close();
		if(conn != null)
			conn.close();
		
		return lists;
	}

	private Tour getBeanData(ResultSet rs) throws Exception {

		Tour bean = new Tour();

		bean.setToid(rs.getInt("toid"));
		bean.setLocation(rs.getString("location"));
		bean.setTname(rs.getString("tname"));
		bean.setTprice(rs.getInt("tprice"));
		bean.setTusedate(rs.getString("tusedate"));
		bean.setTexdate(rs.getInt("texdate"));
		bean.setTage(rs.getInt("tage"));
		bean.setTcontent(rs.getString("tcontent"));
		bean.setTfreeage(rs.getInt("tfreeage"));
		bean.setTimage01(rs.getString("timage01"));
		bean.setTimage02(rs.getString("timage02"));
		bean.setTimage03(rs.getString("timage03"));

		return bean;
	}

	public Tour getDataByPrimaryKey(int toid) throws Exception {

		Tour bean = null;
		String sql = " select * from tour where toid = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, toid);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			bean = getBeanData(rs);
		}

		if (conn != null)
			conn.close();
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();

		return bean;
	}

	public int InsertData(Tour bean) throws Exception {

		int cnt = -1;
		String sql = "";
		if(bean.getTusedate() == null || bean.getTusedate().equals("")) {
			sql = " insert into tour values(seqtour.nextval, ?, ?, ?, default, ?, ?, ?, ?, ?, ?, ?)";
		} else {
			sql = " insert into tour values(seqtour.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		}
		

		conn = super.getConnection();
		conn.setAutoCommit(false);
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getLocation());
		pstmt.setString(2, bean.getTname());
		pstmt.setInt(3, bean.getTprice());
		if(bean.getTusedate() == null || bean.getTusedate().equals("")) {
			pstmt.setInt(4, bean.getTexdate());
			pstmt.setInt(5, bean.getTage());
			pstmt.setString(6, bean.getTcontent());
			pstmt.setInt(7, bean.getTfreeage());
			pstmt.setString(8, bean.getTimage01());
			pstmt.setString(9, bean.getTimage02());
			pstmt.setString(10, bean.getTimage03());
		} else {
			pstmt.setString(4, bean.getTusedate());
			pstmt.setInt(5, bean.getTexdate());
			pstmt.setInt(6, bean.getTage());
			pstmt.setString(7, bean.getTcontent());
			pstmt.setInt(8, bean.getTfreeage());
			pstmt.setString(9, bean.getTimage01());
			pstmt.setString(10, bean.getTimage02());
			pstmt.setString(11, bean.getTimage03());
		}
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
	
	public int UpdateData(Tour bean) throws Exception{
		int cnt = -1;
		String sql = "update tour set location=?, tname=?, tprice=?, tusedate=?, texdate=?, tage=?, tcontent=?, tfreeage=?, timage01=?, timage02=?, timage03=? where toid=?";
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		conn.setAutoCommit(false);
		
		pstmt.setString(1, bean.getLocation());
		pstmt.setString(2, bean.getTname());
		pstmt.setInt(3, bean.getTprice());
		pstmt.setString(4, bean.getTusedate());
		pstmt.setInt(5, bean.getTexdate());
		pstmt.setInt(6, bean.getTage());
		pstmt.setString(7, bean.getTcontent());
		pstmt.setInt(8, bean.getTfreeage());
		pstmt.setString(9, bean.getTimage01());
		pstmt.setString(10, bean.getTimage02());
		pstmt.setString(11, bean.getTimage03());
		pstmt.setInt(12, bean.getToid());
		
		cnt = pstmt.executeUpdate();
		conn.commit();
		
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
		
		return cnt;
	}

	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		String sql = "";
		if(keyword == null || keyword == "")
			sql = " select count(*) cnt from tour";
		else
			sql = " select count(*) cnt from tour where " + mode + " like '%" + keyword +"%'";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

		return cnt;
	}

	public List<Tour> selectRandom() throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
			sql = " select toid, location, tname, TPRICE, TUSEDATE, TEXDATE, TAGE, TCONTENT, TFREEAGE, TIMAGE01, TIMAGE02, TIMAGE03\r\n"
				+ "from tour";

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();

		List<Tour> lists = new ArrayList<Tour>();
		while (rs.next()) {
			lists.add(getBeanData(rs));
		}
		List<Tour> copy = lists;
		List<Tour> randomlist = new ArrayList<Tour>();
		Collections.shuffle(copy);
		for(int i = 0; i < 3; i++) {
			randomlist.add(copy.get(i));
		}
		
		if(pstmt != null)
			pstmt.close();
		if(rs != null)
			rs.close();
		if(conn != null)
			conn.close();
		
		return randomlist;
	}

	public void DeleteData(int toid) throws Exception{
		int cnt = -1;
		String sql = " delete from tour where toid = ?";
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, toid);
		
		cnt = pstmt.executeUpdate();
		conn.commit();
		
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}

	public int InsertReservation(int toid, int tqty, String meid) throws Exception{
		int cnt = -1;
		String sql = " insert into tourreser(torid, toid, tqty, meid) values(tourreserseq.nextval, ?, ?, ?)";
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, toid);
		pstmt.setInt(2, tqty);
		pstmt.setString(3, meid);
				
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

	public List<TourReser> getTourReserByMeid(String meid) throws Exception{
		List<TourReser> bean = new ArrayList<TourReser>();
		String sql = " select * \r\n"
				+ "from tourreser";
		sql += " where meid = ? ";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, meid);
		rs = pstmt.executeQuery();		
		
		while(rs.next())
		{
			bean.add(this.getTourReserData(rs));
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

	private TourReser getTourReserData(ResultSet rs) throws Exception {
		TourReser bean = new TourReser();
		bean.setMeid(rs.getString("meid"));
		bean.setToid(rs.getInt("toid"));
		bean.setTorid(rs.getInt("torid"));
		bean.setTqty(rs.getInt("tqty"));
		
		return bean;
	}
}