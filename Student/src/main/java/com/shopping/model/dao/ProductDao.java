package com.shopping.model.dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Product;

public class ProductDao extends SuperDao{
	public Product getDataByPk(int pnum) {
		Product bean = new Product(1, "콜라", "갑을 상회", 
				"images/americano03.png", "images/americano03.png", "images/americano03.png", 
				10, 1000, "bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10");
		
		return bean;
	}
	public List<Product> getDataList(){
		List<Product> lists = new ArrayList<Product>();
		
		lists.add(new Product(1, "콜라", "갑을 상회", 
				"images/americano01.png", "images/americano02.png", "images/americano03.png", 
				10, 1000, "bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10"));
		lists.add(new Product(2, "사이다", "갑을 상회", 
				"images/brioche_01.png", "images/brioche_02.png", "images/brioche_03.png", 
				10, 1000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10"));
		lists.add(new Product(3, "환타", "갑을 상회", 
				"images/cappuccino01.png", "images/cappuccino02.png", "images/cappuccino03.png", 
				10, 1000,"bread", "톡 쏩니다.", 5, "2023/10/10"));
		lists.add(new Product(4, "맥콜", "갑을 상회", 
				"images/ciabatta_01.png", "images/ciabatta_02.png", "images/ciabatta_03.png", 
				10, 1000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10"));
		lists.add(new Product(5, "닥터페퍼", "갑을 상회", 
				"images/coffee01.png", "images/coffee02.jpg", "images/chocolate_cake_01.png", 
				10, 1000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10"));
		lists.add(new Product(6, "세븐업", "갑을 상회", 
				"images/juice01.png", "images/juice02.png", "images/redwine01.png", 
				10, 1000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10"));
		lists.add(new Product(7, "칠성사이다", "갑을 상회", 
				"images/milk01.jpg", "images/milk02.jpg", null, 
				10, 1000000000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10"));
		
		return lists;
	}
	
	public Product getDataByPk02(int pnum) {
		if(pnum == 1) {
			return new Product(1, "콜라", "갑을 상회", 
					"images/americano01.png", "images/americano02.png", "images/americano03.png", 
					10, 1000, "bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10");
		}else if(pnum == 2) {
			return new Product(2, "사이다", "갑을 상회", 
					"images/brioche_01.png", "images/brioche_02.png", "images/brioche_03.png", 
					10, 1000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10");
		}else if(pnum == 3) {
			return new Product(3, "환타", "갑을 상회", 
					"images/cappuccino01.png", "images/cappuccino02.png", "images/cappuccino03.png", 
					10, 1000,"bread", "톡 쏩니다.", 5, "2023/10/10");
		}else if(pnum == 4) {
			return new Product(4, "맥콜", "갑을 상회", 
					"images/ciabatta_01.png", "images/ciabatta_02.png", "images/ciabatta_03.png", 
					10, 1000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10");
		}else if(pnum == 5) {
			return new Product(5, "닥터페퍼", "갑을 상회", 
					"images/coffee01.png", "images/coffee02.jpg", "images/chocolate_cake_01.png", 
					10, 1000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10");
		}else if(pnum == 6) {
			return new Product(6, "세븐업", "갑을 상회", 
					"images/juice01.png", "images/juice02.png", "images/redwine01.png", 
					10, 1000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10");
		}else if(pnum == 7) {
			return new Product(7, "칠성사이다", "갑을 상회", 
					"images/milk01.jpg", "images/milk02.jpg", null, 
					10, 1000000000,"bread", "이 상품은 매우 시원하고 맛있습니다.", 5, "2023/10/10");
		}
		return null;
	}
	public List<Product> selectAll() throws Exception{
		List<Product> lists = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from products";

		conn = super.getConncetion();
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql); 
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			lists.add(getBeanData(rs));
		}
		
		if(rs!= null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}
	
	private Product getBeanData(ResultSet rs) throws Exception{
		//ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		Product bean = new Product();
		
		bean.setName(rs.getString("name"));
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
