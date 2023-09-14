package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Category;

public class CategoryDao extends SuperDao{
	public List<Category> getCategoryList(String module, String type) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Category> lists = new ArrayList<Category>();
		
		String sql = " select * from categories";
		sql += " where module = ? and type = ?";
		sql += " order by ordering asc";
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, module);
		pstmt.setString(2, type);
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			lists.add(getBeanData(rs));
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return lists;
	}

	private Category getBeanData(ResultSet rs) throws Exception{
		Category bean = new Category();
		
		bean.setModule(rs.getString("module"));
		bean.setType(rs.getString("type"));
		bean.setOrdering(rs.getInt("ordering"));
		bean.setEngname(rs.getString("engname"));
		bean.setKorname(rs.getString("korname"));
		
		return bean;
	}
}
