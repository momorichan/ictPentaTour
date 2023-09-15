package com.shopping.model.dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Product;
import com.shopping.model.mall.CartItem;
import com.shopping.utility.Paging;

public class ProductDao extends SuperDao{
	private Product getBeanData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		Product bean = new Product();
		
		bean.setName(rs.getString("pname"));
		bean.setCompany(rs.getString("company"));
		bean.setImage01(rs.getString("image01"));
		bean.setImage02(rs.getString("image02"));
		bean.setImage03(rs.getString("image03"));
		bean.setCategory(rs.getString("category"));
		bean.setContents(rs.getString("contents"));
		bean.setInputdate(rs.getString("inputdate"));

		bean.setPnum(rs.getInt("pnum"));
		bean.setPrice(rs.getInt("price"));
		bean.setStock(rs.getInt("stock"));
		bean.setPoint(rs.getInt("point"));

		return bean;
	}
	public int InsertData(Product bean) throws Exception{
		// 기입한 상품 정보를 이용하여 데이터 베이스에 추가합니다.
		System.out.println("상품 등록 빈 :\n" + bean);
		
		int cnt = -1;
		PreparedStatement pstmt = null;
		
		String sql = " insert into products(pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate)";
		sql += " 		  values(seqprod.nextval,    ?,       ?,	   ?,		?,		 ?,		?,	   ?,	 	 ?,		   ?,	  ?,		 ?)";
		
		conn = super.getConncetion();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getCompany());
		pstmt.setString(3, bean.getImage01());
		pstmt.setString(4, bean.getImage02());
		pstmt.setString(5, bean.getImage03());
		pstmt.setInt(6, bean.getStock());
		pstmt.setInt(7, bean.getPrice());
		pstmt.setString(8, bean.getCategory());
		pstmt.setString(9, bean.getContents());
		pstmt.setInt(10, bean.getPoint());
		pstmt.setString(11, bean.getInputdate());
		
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}

	public List<Product> selectAll(Paging pageInfo) throws Exception{
		//topN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		List<Product> lists = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String mode = pageInfo.getMode();
		String keyword = pageInfo.getKeyword();
		
		String sql = " select PNUM, pNAME, COMPANY, IMAGE01, IMAGE02, IMAGE03, STOCK, PRICE, CATEGORY, CONTENTS, POINT, INPUTDATE";
		sql += " from (select PNUM, pNAME, COMPANY, IMAGE01, IMAGE02, IMAGE03, STOCK, PRICE, CATEGORY, CONTENTS, POINT, INPUTDATE, rank() over(order by PNUM asc) as ranking";
		sql += 		 " from products";
		
		if(mode==null||mode.equals("all")) {//전체 모드인 경우
			
		}else {//전체 모드가 아닌 경우
		    sql += " where " + mode + " like '%" + keyword + "%'";
		}
		
		sql += 		 ")";
		sql += 		 " where ranking between ? and ?";
		conn = super.getConncetion();
		
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
	public Product getDataByPk(Integer pnum) throws Exception{
		Product bean = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from products";
		sql += " where pnum = ? ";
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pnum);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			bean = getBeanData(rs);
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	
		return bean;
	}
	
	public int UpdateData(Product bean) throws Exception{
		// 기입한 상품 정보를 이용하여 데이터 베이스에 추가합니다.
		System.out.println("상품 등록 빈 :\n" + bean);
		
		int cnt = -1;
		PreparedStatement pstmt = null;
		
		String sql = " update products set name = ?, company = ?, image01 = ?, image02 = ?, image03 = ?, stock = ?, price = ?, category = ?, contents = ?, point = ?, inputdate = ?";
		sql += " where pnum = ?";
		
		conn = super.getConncetion();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getCompany());
		pstmt.setString(3, bean.getImage01());
		pstmt.setString(4, bean.getImage02());
		pstmt.setString(5, bean.getImage03());
		pstmt.setInt(6, bean.getStock());
		pstmt.setInt(7, bean.getPrice());
		pstmt.setString(8, bean.getCategory());
		pstmt.setString(9, bean.getContents());
		pstmt.setInt(10, bean.getPoint());
		pstmt.setString(11, bean.getInputdate());
		pstmt.setInt(12, bean.getPnum());
		
		cnt = pstmt.executeUpdate();
		
		conn.commit();
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}
	public CartItem getCartItem(Integer pnum, Integer qty) throws Exception{
		Product bean = this.getDataByPk(pnum);//상품 정보
		CartItem item = new CartItem();//상품 정보 + 구매 수량 + 로그인 아이디
		
		item.setId(null); //wishList용 테이블과 관련 있음(지금은 의미 없음)
		item.setPname(bean.getName());
		item.setImage01(bean.getImage01());
		item.setPnum(pnum);
		item.setQty(qty);
		item.setPrice(bean.getPrice());
		item.setPoint(bean.getPoint());
		
		return item;
	}
	public int getMileagePoint(Integer pnum) throws Exception{
		int point = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		String sql = " select point from products ";
		sql += " where pnum = ?";
	
		
		conn = super.getConncetion();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pnum);
		rs = pstmt.executeQuery();
		

		
		if(rs.next()) {
			point = rs.getInt("point");
		}
		
		if (rs != null) {rs.close();}
		if (pstmt != null) {pstmt.close();}	
		if (conn != null) {conn.close();}
		
		return point;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
