package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;

public class MallDao extends SuperDao {

	public void calculate(Member payer, Map<Integer, Integer> cartList) throws Exception {
		// payer : 계산 하는 사람(포인트 적립 대상자),
		// cartList : 카트에 담겨있는 상품 번호와 구매 수량

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = -1;

		String sql = "";

		conn = super.getConncetion();
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
		
		conn = super.getConncetion();
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


}
