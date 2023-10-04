
package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Rentalcar;
import com.shopping.utility.Paging;

public class RentalcarDao extends SuperDao {
	// rentalCheck 테이블에 예약 정보 등록
	public int InsertDataToCheck(Rentalcar bean, Member mbean) throws Exception{
		// 예약 정보를 데이터베이스(rentalCheck)에 추가합니다.
		System.out.println("예약 등록 bean:");
		System.out.println("rcid: " + bean.getRcid());
		System.out.println("id: "+mbean.getId());
		PreparedStatement pstmt = null;
		String sql = " insert into rentalCheck(rcid, id)";
		sql += " values(?,?)";
		int cnt = -1;
		
		conn = super.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bean.getRcid());
		pstmt.setString(2, mbean.getId());
		cnt = pstmt.executeUpdate() ;
		conn.commit();		
		
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}		
		return cnt;
	}
	public Rentalcar GetDataByPk(String rcid) throws Exception {
		// 렌트카 번호(String)를 이용하여 해당 상품에 대한 Bean 객체를 반환해 줍니다.
		
		String sql = " select * from rentalcar ";
		sql += " where rcid = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, rcid);

		rs = pstmt.executeQuery();

		Rentalcar bean = null;

		if (rs.next()) {
			bean = this.getBeanData(rs);

		}
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return bean;
	}
	
	/* SL, EL, SD, ED */
	public List<Rentalcar> selectSLELSDED(Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String startLocation = pageInfo.getStartLocation();
		String endLocation = pageInfo.getEndLocation();
		String startDate = pageInfo.getStartDate();
		String endDate = pageInfo.getEndDate();
		String startDateReplace = startDate.replace("/", ""); /* 날짜 문자열 */		
		String endDateReplace = endDate.replace("/", ""); /* 날짜 문자열 */		

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";
		/* x _ _ _ */
		if (startLocation == null || startLocation.equals("all")) {
			/* x x _ _ */
			if (endLocation == null || endLocation.equals("all")) {
				/* x x x _ */
				if (startDate == null || startDate.equals("")) {
					/* x x x x */
					if (endDate == null || endDate.equals("")) {
						System.out.println("select: 싹 다 널 값이면 여기로 옴");
						/* x x x o */
					} else {
						sql += " where endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
					/* x x o _ */
				} else {
					/* x x o x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						/* x x o o */
					} else {
						sql += " where startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
				}
				/* x o _ _ */
			} else {
				/* x o x _ */
				if (startDate == null || startDate.equals("")) {
					/* x o x x */
					if (endDate == null || endDate.equals("")) {
						sql += " where endLocation ='" + endLocation + "'";
						/* x o x o */
					} else {
						sql += " where endLocation ='" + endLocation + "'";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
					/* x o o _ */
				} else {
					/* x o o x */
					if (endDate == null || endDate.equals("")) {
						sql += " where endLocation ='" + endLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						/* x o o o */
					} else {
						sql += " where endLocation ='" + endLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
				}
			}
			/* o _ _ _ */
		} else {
			/* o x _ _ */
			if (endLocation == null || endLocation.equals("all")) {
				/* o x x _ */
				if (startDate == null || startDate.equals("")) {
					/* o x x x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startLocation= '" + startLocation + "'";
						/* o x x o */
					} else {
						sql += " where startLocation= '" + startLocation + "'";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
					/* o x o _ */
				} else {
					/* o x o x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						/* o x o o */
					} else {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
				}
				/* o o _ _ */
			} else {
				/* o o x _ */
				if (startDate == null || startDate.equals("")) {
					/* o o x x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and endLocation ='" + endLocation + "'";
						/* o o x o */
					} else {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and endLocation ='" + endLocation + "'";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
					/* o o o _ */
				} else {
					/* o o o x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and endLocation ='" + endLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						/* o o o o */
					} else {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and endLocation ='" + endLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
				}
			}
		}

		sql += ") ";
		sql += " where ranking between ? and ?";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

//		오류 체크		
		System.out.println("select-SLELSDED: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());

		rs = pstmt.executeQuery();

		List<Rentalcar> lists = new ArrayList<Rentalcar>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		return lists;
	}
	/* SD, ED */
	public List<Rentalcar> selectSDED(Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String startDate = pageInfo.getStartDate();
		String endDate = pageInfo.getEndDate();
		String startDateReplace = startDate.replace("/", "");		
		String endDateReplace = endDate.replace("/", "");
		

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";

		if (startDate == null || startDate.equals("")) {
			if (endDate == null || endDate.equals("")) {
			} else {
				sql += " where endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
			}
		} else {
			if (endDate == null || endDate.equals("")) {
				sql += " where startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
			} else {
				sql += " where startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
				sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
			}
		}

		sql += ") ";
		sql += " where ranking between ? and ?";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

//		오류 체크		
		System.out.println("SDED: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());
		rs = pstmt.executeQuery();

		List<Rentalcar> lists = new ArrayList<Rentalcar>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
		}
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return lists;
	}
	/* SL, EL */
	public List<Rentalcar> selectSLEL(Paging pageInfo) throws Exception {
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String startLocation = pageInfo.getStartLocation();
		String endLocation = pageInfo.getEndLocation();

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";
		if (startLocation == null || startLocation.equals("all")) {
			if (endLocation == null || endLocation.equals("all")) {
			} else {
				sql += " where endLocation='" + endLocation + "'";
			}
		} else {
			if (endLocation == null || endLocation.equals("all")) {
				sql += " where startLocation='" + startLocation + "'";
			} else {
				sql += " where startLocation='" + startLocation + "'";
				sql += " and endLocation='" + endLocation + "'";
			}
		}

		sql += ") ";
		sql += " where ranking between ? and ?";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

//		오류 체크		
		System.out.println("select-SLEL: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());
		rs = pstmt.executeQuery();

		List<Rentalcar> lists = new ArrayList<Rentalcar>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
		}
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return lists;
	}
	/* ED */
	public List<Rentalcar> selectED(Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String endDate = pageInfo.getEndDate();
		String endDateReplace = endDate.replace("/", ""); /* 날짜 문자열 */
		
		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";

		if (endDate == null || endDate.equals("")) {
		} else {
			sql += " where endDate >='" + endDateReplace + "'";
		}
		sql += ") ";
		sql += " where ranking between ? and ?";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

//		오류 체크		
		System.out.println("select-ED: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());
		rs = pstmt.executeQuery();
		List<Rentalcar> lists = new ArrayList<Rentalcar>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return lists;
	}
	/* SD */
	public List<Rentalcar> selectSD(Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String startDate = pageInfo.getStartDate();
		String startDateReplace = startDate.replace("/", ""); /* 날짜 문자열 */
		
		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";

		if (startDate == null || startDate.equals("")) {
		} else {
			sql += " where startDate <='" + startDateReplace + "'";
		}
		sql += ") ";
		sql += " where ranking between ? and ?";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

//		오류 체크		
		System.out.println("select-SD: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());
		rs = pstmt.executeQuery();
		List<Rentalcar> lists = new ArrayList<Rentalcar>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return lists;
	}
	/* EL */
	public List<Rentalcar> selectEL(Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String endLocation = pageInfo.getEndLocation();

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";

		if (endLocation == null || endLocation.equals("all")) {
		} else {
			sql += " where endLocation ='" + endLocation + "'";
		}
		sql += ") ";
		sql += " where ranking between ? and ?";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

//		오류 체크		
		System.out.println("select-EL: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());
		rs = pstmt.executeQuery();
		List<Rentalcar> lists = new ArrayList<Rentalcar>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return lists;
	}
	/* SL */
	public List<Rentalcar> selectSL(Paging pageInfo) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String startLocation = pageInfo.getStartLocation();

		String sql = " select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03";
		sql += " from (select rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03, rank() over(order by price asc) as ranking";
		sql += " from rentalcar ";

		if (startLocation == null || startLocation.equals("all")) {
		} else {
			sql += " where startLocation ='" + startLocation + "'";
		}
		sql += ") ";
		sql += " where ranking between ? and ?";

		conn = super.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());

//		오류 체크		
		System.out.println("select-SL: " + sql);
		System.out.println("getBeginRow: " + pageInfo.getBeginRow());
		System.out.println("getEndRow: " + pageInfo.getEndRow());
		rs = pstmt.executeQuery();
		List<Rentalcar> lists = new ArrayList<Rentalcar>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return lists;
	}
	
	public List<Rentalcar> selectAll() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select * from rentalcar where rownum <= 6 order by price "; 

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		List<Rentalcar> lists = new ArrayList<Rentalcar>();

		while (rs.next()) {
			lists.add(getBeanData(rs));
		}

//		오류 체크		
		System.out.println("selectAll: " + sql);

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return lists;
	}

	private Rentalcar getBeanData(ResultSet rs) throws Exception {
		Rentalcar bean = new Rentalcar();

		bean.setRcid(rs.getString("rcid"));
		bean.setCarType(rs.getString("carType"));
		bean.setStartLocation(rs.getString("startLocation"));
		bean.setEndLocation(rs.getString("endLocation"));
		bean.setStartDate(String.valueOf(rs.getString("startDate")));
		bean.setEndDate(String.valueOf(rs.getString("endDate")));
		bean.setPrice(rs.getInt("price"));
		bean.setPassengers(rs.getString("passengers"));
		/* 9.27 추가 칼럼 */
		bean.setCarName(rs.getString("carName"));
		bean.setCarImage01(rs.getString("carImage01"));
		bean.setCarImage02(rs.getString("carImage02"));
		bean.setCarImage03(rs.getString("carImage03"));
		
		return bean;
	}

	/* SL, EL, SD, ED */
	public int GetTotalRecordCountSLELSDED(String startLocation, String endLocation, String startDate, String endDate) throws Exception {
		System.out.println("대여 장소, 반납 장소, 날짜까지 선택");
		System.out.println("대여: " + startLocation);
		System.out.println("반납: " + endLocation);
		System.out.println("시작일: " + startDate);
		System.out.println("종료일: " + endDate);
		
		String startDateReplace = startDate.replace("/", ""); /* 날짜 문자열 */
		System.out.println(startDateReplace);
		String endDateReplace = endDate.replace("/", ""); /* 날짜 문자열 */
		System.out.println(endDateReplace);

		String sql = " select count(*) as cnt from rentalcar ";
		// 테이블의 총 행개수를 구합니다.
		/* x _ _ _ */
		if (startLocation == null || startLocation.equals("all")) {
			/* x x _ _ */
			if (endLocation == null || endLocation.equals("all")) {
				/* x x x _ */
				if (startDate == null || startDate.equals("")) {
					/* x x x x */
					if (endDate == null || endDate.equals("")) {
						System.out.println("싹 다 널값(all)이면 여기로 옴");
						/* x x x o */
					} else {
						sql += " where endDate >= to_date('" + startDateReplace + "', 'YYYYMMDD')";
					}
					/* x x o _ */
				} else {
					/* x x o x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						/* x x o o */
					} else {
						sql += " where startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						sql += " and endDate >= to_date('" + startDateReplace + "', 'YYYYMMDD')";
					}
				}
				/* x o _ _ */
			} else {
				/* x o x _ */
				if (startDate == null || startDate.equals("")) {
					/* x o x x */
					if (endDate == null || endDate.equals("")) {
						sql += " where endLocation ='" + endLocation + "'";
						/* x o x o */
					} else {
						sql += " where endLocation ='" + endLocation + "'";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
					/* x o o _ */
				} else {
					/* x o o x */
					if (endDate == null || endDate.equals("")) {
						sql += " where endLocation ='" + endLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						/* x o o o */
					} else {
						sql += " where endLocation ='" + endLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
				}
			}
			/* o _ _ _ */
		} else {
			/* o x _ _ */
			if (endLocation == null || endLocation.equals("all")) {
				/* o x x _ */
				if (startDate == null || startDate.equals("")) {
					/* o x x x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startLocation= '" + startLocation + "'";
						/* o x x o */
					} else {
						sql += " where startLocation= '" + startLocation + "'";
						sql += " and endDate >= to_date('" + startDateReplace + "', 'YYYYMMDD')";
					}
					/* o x o _ */
				} else {
					/* o x o x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						/* o x o o */
					} else {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						sql += " and endDate >= to_date('" + startDateReplace + "', 'YYYYMMDD')";
					}
				}
				/* o o _ _ */
			} else {
				/* o o x _ */
				if (startDate == null || startDate.equals("")) {
					/* o o x x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and endLocation ='" + endLocation + "'";
						/* o o x o */
					} else {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and endLocation ='" + endLocation + "'";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
					/* o o o _ */
				} else {
					/* o o o x */
					if (endDate == null || endDate.equals("")) {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and endLocation ='" + endLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						/* o o o o */
					} else {
						sql += " where startLocation ='" + startLocation + "'";
						sql += " and endLocation ='" + endLocation + "'";
						sql += " and startDate <= to_date('" + startDateReplace + "', 'YYYYMMDD')";
						sql += " and endDate >= to_date('" + endDateReplace + "', 'YYYYMMDD')";
					}
				}
			}
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		// 
		System.out.println("GetTotal-SLELSDED: " + sql);
		
		rs = pstmt.executeQuery();

		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}
	/* SD, ED */
	public int GetTotalRecordCountSDED(String startDate, String endDate) throws Exception {
		System.out.println("시작일, 종료일 둘다 선택");
		System.out.println("시작일 : " + startDate);
		System.out.println("종료일 : " + endDate);
		
		String startDateReplace = startDate.replace("/", "");
		System.out.println("SDEDstartDateReplace: " + startDateReplace);
		String endDateReplace = endDate.replace("/", "");
		System.out.println("SDEDendDateReplace: " + endDateReplace);

		
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar ";
		if (startDate == null || startDate.equals("")) {
			if(endDate == null || endDate.equals("")) {				
			}else {
				sql += " where endDate ='" + endDate + "'";
			}
		}else { 
			if (endDate == null || endDate.equals("all")) {
				sql += " where startDate= '" + startDateReplace+ "'";
			} else {
				sql += " where startDate= '" + startDateReplace + "'";
				sql += " and endDate='" + endDateReplace + "'";
			}
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		System.out.println("GetTotal-SDED: " + sql);
		rs = pstmt.executeQuery();

		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}
	/* SL, EL */
	public int GetTotalRecordCountSLEL(String startLocation, String endLocation) throws Exception {
		System.out.println("대여, 반납 둘다 선택");
		System.out.println("대여 장소: " + startLocation);
		System.out.println("반납 장소: " + endLocation);

		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar ";
		if (startLocation == null || startLocation.equals("all")) {
			if (endLocation == null || endLocation.equals("all")) {
			} else {
				sql += " where endlocation ='" + endLocation + "'";
			}
		} else {
			if (endLocation == null || endLocation.equals("all")) {
				sql += " where startLocation ='" + startLocation + "'";
			} else {
				sql += " where startLocation = '" + startLocation + "'";
				sql += " and endLocation ='" + endLocation + "'";
			}
		}
		
		System.out.println("SLEL: " + sql);
		

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		System.out.println("GetTotal-SLEL: " + sql);
		rs = pstmt.executeQuery();

		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}
	/* ED */
	public int GetTotalRecordCountED(String endDate) throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar ";
		
		String endDateReplace = endDate.replace("/", "");
		System.out.println("EDendDateReplace: " + endDateReplace);
		
		if (endDate == null || endDate.equals("")) {
		} else { // 전체 모드가 아니면
			sql += " where endDate >='" + endDateReplace + "'";
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		System.out.println("GetTotal-ED " + sql);
		rs = pstmt.executeQuery();
		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}
	/* SD */
	public int GetTotalRecordCountSD(String startDate) throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar ";
		
		String startDateReplace = startDate.replace("/", "");
		System.out.println("SDstartDateReplace: " + startDateReplace);
		
		if (startDate == null || startDate.equals("all")) {
		} else { // 전체 모드가 아니면
			sql += " where startDate <='" + startDateReplace + "'";
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		System.out.println("GetTotal-SD: " + sql);
		rs = pstmt.executeQuery();
		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}
	/* EL */
	public int GetTotalRecordCountEL(String endLocation) throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar ";

		if (endLocation == null || endLocation.equals("all")) {
		} else { // 전체 모드가 아니면
			sql += " where endLocation ='" + endLocation + "'";
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		System.out.println("GetTotal-EL: " + sql);
		rs = pstmt.executeQuery();
		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;

	}
	/* SL */
	public int GetTotalRecordCountSL(String startLocation) throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from rentalcar ";

		if (startLocation == null || startLocation.equals("all")) {
		} else { // 전체 모드가 아니면
			sql += " where startLocation ='" + startLocation + "'";
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		System.out.println("GetTotal-SL: " + sql);
		rs = pstmt.executeQuery();
		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}
	
	/* 싹 다 널 값 일 때*/
	public int GetTotalRecordCountAll() throws Exception{
		String sql =" select count(*) as cnt from rentalcar " ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int cnt = -1;

		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;		
	}
	public int InsertData(Rentalcar bean)throws Exception {
		// 기입한 상품 정보를 이용하여 데이터 베이스에 추가합니다.
		System.out.println("상품 등록 빈 :\n" + bean);		
		PreparedStatement pstmt = null ;
		// cpnum 안 씀
		String sql = " insert into rentalcar(rcid, carType, startLocation, endLocation, startDate, endDate, price, passengers, carName, carImage01, carImage02, carImage03)" ;
		sql += "         			  values(	?, 		 ?,    			?,       	 ?,         ?,       ?,     ?,     		?,     	 ?,    	     ?,       	 ?,     	 ?)" ;		
		int cnt = -1 ;
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		
		pstmt = conn.prepareStatement(sql) ;		
		pstmt.setString(1, bean.getRcid());
		pstmt.setString(2, bean.getCarType());
		pstmt.setString(3, bean.getStartLocation());
		pstmt.setString(4, bean.getEndLocation());
		pstmt.setString(5, bean.getStartDate());
		pstmt.setString(6, bean.getEndDate());
		pstmt.setInt(7, bean.getPrice());
		pstmt.setString(8, bean.getPassengers());
		pstmt.setString(9, bean.getCarName());
		pstmt.setString(10, bean.getCarImage01());
		pstmt.setString(11, bean.getCarImage02());
		pstmt.setString(12, bean.getCarImage03());
		
		cnt = pstmt.executeUpdate() ;
		conn.commit();		
		
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}		
		return cnt;		
		
	}
	
	


}
