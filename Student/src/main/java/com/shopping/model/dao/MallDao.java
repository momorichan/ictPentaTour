package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;
import com.shopping.model.mall.CartItem;

public class MallDao extends SuperDao{
	public void insertWishList(String id, Map<Integer, Integer> wishList) {
		// 로그인 한 사람의 찜 목록(wishList)을 데이터 베이스에 추가합니다.
		String sql = "";

		// step 01: 과거 나의 찜 정보가 있으면 일단 삭제합니다.
		sql = " delete from WishList where id = ? ";
		// step 02: 현재 세션 정보를 반복하여 테이블에 insert 합니다.
		sql  = " insert into WishList(id, pnum, qty)" ;
		sql += " values(?,?,?)" ;
	}
	public List<CartItem> showDetail(int oid) throws Exception {
		// 송장 번호에 대한 상세 내역을 컬렉션 형태로 반환합니다.
		String sql = " select p.pnum, p.name pname, od.qty, p.price, p.point, p.image01 " ;
		sql += " from (orders o inner join orderdetails od " ;
		sql += " on o.oid = od.oid) inner join products p  " ;
		sql += " on od.pnum = p.pnum and o.oid = ?  " ;
		sql += " order by od.odid desc " ;
		
		conn = super.getConnection() ;
		PreparedStatement pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, oid);
		ResultSet rs = pstmt.executeQuery() ;
		
		List<CartItem> lists = new ArrayList<CartItem>() ;
		
		while(rs.next()) {
			lists.add(this.makeCartItemBean(rs)) ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		
		return lists;
	}
	private CartItem makeCartItemBean(ResultSet rs) throws Exception {
		CartItem item = new CartItem() ;
		
		// item.setId(rs.getString("id"));
		item.setImage01(rs.getString("image01"));
		item.setPname(rs.getString("pname"));
		item.setPnum(rs.getInt("pnum"));
		item.setPoint(rs.getInt("point"));
		item.setPrice(rs.getInt("price"));
		item.setQty(rs.getInt("qty"));
		
		return item;
	}
	public Order getDetailHistory(int oid) throws Exception{
		// 해당 송장 번호에 대한 주문 정보를 반환해 줍니다.
		String sql = " select * from orders where oid = ? " ;
		Order bean = null ;
		
		conn = super.getConnection() ;
		PreparedStatement pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, oid);
		ResultSet rs = pstmt.executeQuery() ;
		
		if(rs.next()) {
			bean = this.makeOrderBean(rs) ;
		}
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		
		return bean ;
	}
	public List<Order> GetHistory(String id) throws Exception {
		// 과거 쇼핑 내역을 최신 날짜 순으로 정렬하여 반환해 줍니다.
		String sql = " select * from orders where id = ? order by orderdate desc ";
		
		conn = super.getConnection() ;
		PreparedStatement pstmt = conn.prepareStatement(sql) ;
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery() ;
		
		List<Order> orderList = new ArrayList<Order>() ;
		
		while(rs.next()) {
			orderList.add(this.makeOrderBean(rs)) ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return orderList;
	}
	private Order makeOrderBean(ResultSet rs) throws Exception{
		Order bean = new Order() ;
		
		bean.setId(rs.getString("id"));
		bean.setOid(rs.getInt("oid"));
		bean.setOrderdate(String.valueOf(rs.getDate("orderdate")));
		bean.setRemark(rs.getString("remark"));
		
		return bean;
	}
	public void Calculate(Member payer, Map<Integer, Integer> cartList) throws Exception {
		// payer : 계산을 하는 사람(포인트 적립 대상자)
		// cartList : 카트에 담겨 있는 '상품 번호'와 '구매 수량'
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		int cnt = -1 ;
		String sql = "" ; 
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);
		
		// step01 : 주문 테이블(Orders)에 매출 1건 입력
		sql = " insert into orders(oid, id, orderdate)" ;
		sql += " values(seqoid.nextval, ?, sysdate)" ; 
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setString(1, payer.getId()); 
		cnt = pstmt.executeUpdate() ;
		if(pstmt!=null) {pstmt.close();}
		
		// step02 : 'step01'에서 방금 들어간 송장 번호 읽기
		sql = " select max(oid) as invoice from orders" ;
		pstmt = conn.prepareStatement(sql) ;
		rs = pstmt.executeQuery() ; 
		
		int invoice = 0 ; // 송장 번호
		if(rs.next()) {
			invoice = rs.getInt("invoice") ;
		}
		if(pstmt!=null) {pstmt.close();}
		
		int totalPoint = 0 ; // 총 적립 포인트
		
		// 반복문을 사용하여
		for(Integer pnum : cartList.keySet()) {
			// step03 : 주문 상세 테이블(OrderDetails)에 각 데이터 추가하기 
			sql = " insert into orderdetails(odid, oid, pnum, qty)" ;
			sql += " values(seqodid.nextval, ?, ?, ?)" ;
			pstmt = conn.prepareStatement(sql) ;			
			pstmt.setInt(1, invoice); // 송장 번호
			pstmt.setInt(2, pnum); // 상품 번호
			pstmt.setInt(3, cartList.get(pnum)); // 구매 수량
			cnt = pstmt.executeUpdate() ;
			if(pstmt!=null) {pstmt.close();}
			
			// step04 : 각 상품들의 재고 수량 뺄셈하기
			sql = " update products set stock = stock - ? " ;
			sql += " where pnum = ? " ;
			pstmt = conn.prepareStatement(sql) ;			
			pstmt.setInt(1, cartList.get(pnum)); // 구매 수량
			pstmt.setInt(2, pnum);	// 상품 번호
			cnt = pstmt.executeUpdate() ;
			if(pstmt!=null) {pstmt.close();}	
			
			// 각 상품들의 적립 포인트를 구해 줍니다.
			int point = cartList.get(pnum) * new ProductDao().GetMileagePoint(pnum) ;
			totalPoint += point ;
		}

		
		// step05 : 해당 회원의 적립 포인트 변경하기
		sql = " update members set mpoint = mpoint + ? " ;
		sql += " where id = ? " ;
		pstmt = conn.prepareStatement(sql) ;			
		pstmt.setInt(1, totalPoint); // 적립할 포인트
		pstmt.setString(2, payer.getId());	// 회원 아이디
		cnt = pstmt.executeUpdate() ;
		if(pstmt!=null) {pstmt.close();}		
		
		conn.commit();
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
	}
	
	


}
