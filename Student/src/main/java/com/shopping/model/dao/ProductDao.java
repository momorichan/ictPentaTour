package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Product;
import com.shopping.model.mall.CartItem;
import com.shopping.utility.MyUtility;
import com.shopping.utility.Paging_bak;

public class ProductDao extends SuperDao{
	public int DeleteData(int pnum)throws Exception {
		// 상품 번호를 이용하여 해당 상품을 삭제합니다.
		String sql = "";
		PreparedStatement pstmt = null;
		int cnt = -1;
		
		Product bean =  this.GetDataByPk(pnum);
		
		conn = super.getConnection();
		conn.setAutoCommit(false); 
		
		
		String remark = MyUtility.getCurrentTime() + "(상품이름: " + bean.getName() + " )" + "(상품 번호 : " + pnum + "번) 상품이 삭제 되었습니다." ;
		
		// step01: 주문 상세 테이블의 비고(remark) 컬럼에 삭제 히스토리 남기기
		sql = " update orderdetails set remark = ? where pnum = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, remark);
		pstmt.setInt(2, pnum); //13번째 줄 매개변수 pnum.
		
		cnt = pstmt.executeUpdate();
		if(pstmt != null) {pstmt.close();}

		
		// step02: 상품 테이블에서 해당 상품 번호와 관련된 행 삭제하기
		System.out.println("삭제구문");
		sql = " delete from products where pnum = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pnum);		
		
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt;
	}	
	public int GetMileagePoint(Integer pnum) throws Exception {
		// 해당 상품 번호에 대한 적립 포인트를 구해 줍니다.
		int point = 0 ;
		
		String sql = " select point from products " ;
		sql += " where pnum = ? " ; 
		
		conn = super.getConnection() ;
		PreparedStatement pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pnum); 
		ResultSet rs = pstmt.executeQuery() ; 
		
		if(rs.next()) {
			point = rs.getInt("point") ; 
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return point;
	}
	public CartItem GetCartItem(Integer pnum, Integer qty) throws Exception {
		Product bean = this.GetDataByPk(pnum) ; // 상품 정보
		
		CartItem item = new CartItem() ; // 상품 정보 + 구매 수량 + 로그인 아이디 
		
		item.setId(null); // wishList용 테이블과 관련 있음(지금은 의미 없음)
		item.setImage01(bean.getImage01());
		item.setPname(bean.getName());
		item.setPnum(pnum);
		item.setPoint(bean.getPoint());
		item.setPrice(bean.getPrice());
		item.setQty(qty); 
		
		return item;
	}	
	
	public int UpdateData(Product bean) throws Exception{
		System.out.println("상품 등록 빈 :\n" + bean);		
		PreparedStatement pstmt = null ;
		String sql = " update products set name = ?, company = ?, image01 = ?, image02 = ?, image03 = ?, stock = ?, price = ?, category = ?, contents = ?, point = ?, inputdate = ?" ;
		sql += " where pnum = ? " ;		
		int cnt = -1 ;
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		
		pstmt = conn.prepareStatement(sql) ;		
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
		
		cnt = pstmt.executeUpdate() ;
		conn.commit();		
		
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}		
		return cnt;
	}	
	
	public Product GetDataByPk(Integer pnum) throws Exception {
		// 상품 번호를 이용하여 해당 상품에 대한 Bean 객체를 반환해 줍니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from products ";
		sql += " where pnum = ? " ;
		
		conn = super.getConnection();		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pnum); 
		
		rs = pstmt.executeQuery() ;
		
		Product bean = null ;
		
		if(rs.next()) {
			bean = this.getBeanData(rs);
			
		}		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}	
	
	public List<Product> selectAll(Paging_bak pageInfo) throws Exception{
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate";
		sql += " from (select pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate, rank() over(order by pnum desc) as ranking";
		sql += " from products ";
		
		String mode = pageInfo.getMode() ;
		String keyword = pageInfo.getKeyword() ; 
		
		if(mode == null || mode.equals("all") ) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ;
		}
		
		sql += ") ";
		sql += " where ranking between ? and ?";
		
		conn = super.getConnection();
		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		System.out.println("!!!!!!!!:= "+sql);
		System.out.println("비긴로우: "+pageInfo.getBeginRow());
		System.out.println("엔드로우: "+pageInfo.getEndRow());
		
		rs = pstmt.executeQuery() ;
		
		List<Product> lists = new ArrayList<Product>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs)) ;
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}		
	
	//패스
	public int InsertData(Product bean) throws Exception {
		// 기입한 상품 정보를 이용하여 데이터 베이스에 추가합니다.
		System.out.println("상품 등록 빈 :\n" + bean);		
		PreparedStatement pstmt = null ;
		String sql = " insert into products(pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate)" ;
		sql += "          values(seqprod.nextval, ?,    ?,       ?,       ?,       ?,       ?,     ?,     ?,        ?,        ?,     ?        )" ;		
		int cnt = -1 ;
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		
		pstmt = conn.prepareStatement(sql) ;		
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
		
		cnt = pstmt.executeUpdate() ;
		conn.commit();		
		
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}		
		return cnt;
	}	
	
	//필요없음
	public Product getDataByPk02(int pnum) {
		// 해당 상품 번호에 맞는 상품 Bean을 반환합니다.
		if(pnum == 1) {
			return new Product(1, "콜라", "갑을 상회", "brioche_01.png", "americano01.png", "coffee01.png", 10, 1000, 
					"bread", "이 상품은 매우 시원하고, 맛있습니다.", 5, "2023/10/10");	
		}else if(pnum == 2) {
			return new Product(2, "사이다", "갑을 상회", "ciabatta_01.png", "americano01.png", null, 10, 2000, 
					"bread", "탁 쏩니다", 5, "2023/10/10") ;	
		}else {
			return new Product(3, "환타", "갑을 상회", "coffee01.png", null, null, 10, 3000, 
					"bread", "탁 쏩니다", 5, "2023/10/10") ;
		}		
	}

	//필요없음
	public Product getDataByPk(int pnum) {
		Product bean = new Product(pnum, "콜라", "갑을 상회", "coffee01.png", null, null, 10, 1000, 
				"bread", "탁 쏩니다", 5, "2023/10/10");
		
		return bean;
	}
	

	//  필요없음
	public List<Product> getDataList(){
		List<Product> lists = new ArrayList<Product>();
		
		lists.add(new Product(1, "콜라", "갑을 상회", "brioche_01.png", "americano01.png", "coffee01.png", 10, 1000, 
				"bread", "이 상품은 매우 시원하고, 맛있습니다.", 5, "2023/10/10"));
		
		lists.add(new Product(2, "사이다", "갑을 상회", "ciabatta_01.png", "americano01.png", null, 10, 2000, 
				"bread", "탁 쏩니다", 5, "2023/10/10"));
		
		lists.add(new Product(3, "환타", "갑을 상회", "coffee01.png", null, null, 10, 3000, 
				"bread", "탁 쏩니다", 5, "2023/10/10"));
		
		lists.add(new Product(4, "이프로", "갑을 상회", "coffee01.png", null, null, 10, 1000, 
				"bread", "탁 쏩니다", 5, "2023/10/10"));
		
		lists.add(new Product(5, "콜라", "갑을 상회", "coffee01.png", null, null, 10, 1000, 
				"bread", "탁 쏩니다", 5, "2023/10/10"));
		
		lists.add(new Product(6, "콜라", "갑을 상회", "coffee01.png", null, null, 10, 1000, 
				"bread", "탁 쏩니다", 5, "2023/10/10"));

		lists.add(new Product(7, "콜라", "갑을 상회", "coffee01.png", null, null, 10, 1000, 
				"bread", "탁 쏩니다", 5, "2023/10/10"));
		
		return lists ;
	}

	private Product getBeanData(ResultSet rs) throws Exception{
		// ResultSet의 데이터를 읽어서 Bean에 기록한 다음, 반환해 줍니다.
		Product bean = new Product()  ;
		
		bean.setPnum(rs.getInt("pnum"));
		bean.setName(rs.getString("name"));
		bean.setCompany(rs.getString("company"));		
		bean.setImage01(rs.getString("image01"));
		bean.setImage02(rs.getString("image02"));
		bean.setImage03(rs.getString("image03"));
		bean.setStock(rs.getInt("stock"));
		bean.setPrice(rs.getInt("price"));
		bean.setCategory(rs.getString("category"));
		bean.setContents(rs.getString("contents"));
		bean.setPoint(rs.getInt("point"));
		bean.setInputdate(String.valueOf(rs.getDate("inputdate")));
		return bean;
	}
	
	public List<Product> selectAll() throws Exception{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from products where rownum <= 6 order by pnum desc";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ;
		
		List<Product> lists = new ArrayList<Product>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs)) ;
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}

	public int GetTotalRecordCount() throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from products " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ; 
		
		int cnt = -1 ;
		
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}
	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.print("검색할 필드명 : " + mode);
		System.out.println(", 검색할 키워드 : " + keyword);
		
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from products " ;
		if(mode == null || mode.equals("all") ) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ;
		}		
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ; 
		
		int cnt = -1 ;
		
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}


}