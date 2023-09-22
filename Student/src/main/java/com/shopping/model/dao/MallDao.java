package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;
import com.shopping.model.bean.WishList;
import com.shopping.model.mall.CartItem;

public class MallDao extends SuperDao {

	public void calculate(Member payer, Map<Integer, Integer> cartList) throws Exception {
		// payer : 계산 하는 사람(포인트 적립 대상자),
		// cartList : 카트에 담겨있는 상품 번호와 구매 수량

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = -1;

		String sql = "";

		conn = super.getConnection();
		conn.setAutoCommit(false);

		// step01 : 주문 테이블에 매출 1건 입력
		sql = " insert into orders(oid, id, orderdate) ";
		sql += " values(seqoid.nextval, ?, sysdate) ";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, payer.getMeid());

		cnt = pstmt.executeUpdate();
		if (pstmt != null) {pstmt.close();}			


		// step02 : step01에서 방금 들어간 송장 번호 읽기
		sql = " select max(oid) as invoice from orders";

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		int invoice = 0;
		if (rs.next()) {
			invoice = rs.getInt("invoice");
		}

		if (pstmt != null) {pstmt.close();}			

		int totalPoint = 0; // 총 적립 포인트

		// 반복문을 사용하여
		for (Integer pnum : cartList.keySet()) {

			// step03 : 주문 상세 테이블에 각 데이터 추가하기
			sql = " insert into orderdetails(odid, oid, pnum, qty) ";
			sql += " values(seqodid.nextval, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, invoice);
			pstmt.setInt(2, pnum);
			pstmt.setInt(3, cartList.get(pnum));

			cnt = pstmt.executeUpdate();
			if (pstmt != null) {pstmt.close();}			
			// step04 : 각 상품들의 재고 수량 뺄셈하기
			sql = " update products set stock = stock - ? ";
			sql += " where pnum = ? ";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cartList.get(pnum));
			pstmt.setInt(2, pnum);

			cnt = pstmt.executeUpdate();
			if (pstmt != null) {pstmt.close();}			
			
			//각 상품들의 적립 포인트 계산
			int point = cartList.get(pnum) * new ProductDao().getMileagePoint(pnum);
			totalPoint += point;
		}

		
		
		// step05 : 해당 회원의 적립 포인트 변경하기
		sql = " update members set mpoint = mpoint + ? ";
		sql += " where id = ? ";
		
		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, totalPoint);//적립할 포인트
		pstmt.setString(2, payer.getMeid()); //회원 아이디

		cnt = pstmt.executeUpdate();
		if (pstmt != null) {pstmt.close();}	
		
		conn.commit();

		if (rs != null) {rs.close();}
		if (pstmt != null) {pstmt.close();}	
		if (conn != null) {conn.close();}

	}

	public List<Order> getHistory(String id) throws Exception{
		List<Order> lists = new ArrayList<Order>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from orders ";
		sql += " where id = ? order by orderdate desc ";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			lists.add(makeOrderBean(rs));
		}
		
		if (rs != null) {rs.close();}
		if (pstmt != null) {pstmt.close();}	
		if (conn != null) {conn.close();}
		
		return lists;
	}

	private Order makeOrderBean(ResultSet rs) throws Exception{
		Order bean = new Order();
		
		bean.setId(rs.getString("id"));
		bean.setOid(rs.getInt("oid"));
		bean.setOrderdate(rs.getString("orderdate"));
		bean.setRemark(rs.getString("remark"));
		
		return bean;
	}

	public Order getDetailHistory(int oid) throws Exception{
		//해당 송장 번호에 대한 주문 정보 반환
		Order bean = null;
		
		String sql = " select * from orders where oid = ? ";
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, oid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bean = makeOrderBean(rs);
		}
		
		if (rs != null) {rs.close();}
		if (pstmt != null) {pstmt.close();}	
		if (conn != null) {conn.close();}
		
		
		return bean;
	}

	public List<CartItem> showDetail(int oid) throws Exception{
		//송장 번호에 대한 상세 내역을 컬렉션 형태로 반환
		List<CartItem> lists = new ArrayList<CartItem>();
		
		String sql = 
				" select p.pnum, p.name pname, od.qty, p.price, p.point, p.image01 "
				+ " from (orders o inner join orderdetails od "
				+ " on o.oid = od.oid) inner join products p "
				+ " on od.pnum = p.pnum and o.oid = ? "
				+ " order by od.odid desc ";
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, oid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			lists.add(this.makeCartItemBean(rs));
		}
		
		if (rs != null) {rs.close();}
		if (pstmt != null) {pstmt.close();}	
		if (conn != null) {conn.close();}
		
		return lists;
	}

	private CartItem makeCartItemBean(ResultSet rs) throws Exception{
		CartItem item = new CartItem();
		item.setPnum(rs.getInt("pnum"));
		item.setQty(rs.getInt("qty"));
		item.setPrice(rs.getInt("price"));
		item.setPoint(rs.getInt("point"));
		item.setPname(rs.getString("pname"));
		item.setImage01(rs.getString("image01"));
		return item;
	}

	public void insertWishList(String id, Map<Integer, Integer> wishList) throws Exception{
		//로그인 한 사람의 찜 목록을 데이터 베이스에 추가
		int cnt = -1;
		
		String sql = "";
		conn = super.getConnection();
		PreparedStatement pstmt = null;
		conn.setAutoCommit(false);
		
		//step 01 : 과거 나의 찜 정보가 있으면 삭제
		sql = " delete from wishlist where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		cnt = pstmt.executeUpdate();
		if (pstmt != null) {pstmt.close();}	

		
		//step 02 : 현재 세션 정보를 반복하여 테이블에 인서트
		sql = " insert into wishlist(id, pnum, qty) ";
		sql += " values(?, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		
		for(Integer pnum : wishList.keySet()) {

			pstmt.setString(1, id);
			pstmt.setInt(2, pnum);
			pstmt.setInt(3, wishList.get(pnum));
			
			cnt = pstmt.executeUpdate();
		}
		
		conn.commit();
		if (pstmt != null) {pstmt.close();}			
		if (conn != null) {conn.close();}
	}

	public List<WishList> getWishList(String id) throws Exception{
		List<WishList> lists = new ArrayList<WishList>();
		//나의 WishList 항목을 컬렉션으로 반환
		
		String sql = " select * from wishlist where id = ?";
		
		conn = super.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			lists.add(makeWishListBean(rs));
		}
		
		if (rs != null) {rs.close();}
		if (pstmt != null) {pstmt.close();}	
		if (conn != null) {conn.close();}
		
		
		return lists;
	}

	private WishList makeWishListBean(ResultSet rs) throws Exception{
		WishList bean = new WishList();
		bean.setId(rs.getString("id"));
		bean.setPnum(rs.getInt("pnum"));
		bean.setQty(rs.getInt("qty"));
		return bean;
	}
}
