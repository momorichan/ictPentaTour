package com.shopping.model.check;

import java.util.HashMap;
import java.util.Map;

public class BookingManager {
	
	
private Map<Integer, Integer> booking = null ;
	
	public BookingManager() {
		this.booking = new HashMap<Integer, Integer>() ;
	}

	public int getBookingSize() {
		// 카트에 담겨져 있는 품목의 갯수를 반환합니다.
		return this.booking.size();
	}

	public void addBooking(int pnum, int qty) {
		// 카트에 상품을 추가합니다.
		if(this.booking.containsKey(pnum)) { // 이미 카트에 품목이 있는 경우
			int newQty = this.booking.get(pnum) + qty ;
			this.booking.put(pnum, newQty) ;
		}else {
			this.booking.put(pnum, qty) ;
		}
	}

	public void editBooking(int pnum, int qty) {
		// 카트 내의 상품 수량을 변경합니다.(덮어 쓰기_overwrite)
		this.booking.put(pnum, qty) ;
	}

	public void deleteBooking(int pnum) {
		// 해당 상품 목록을 Cart 품목에서 제거합니다.
		this.booking.remove(pnum) ;
	}

	public void removeAllBooking() {
		// 카트에 들어 있는 모든 품목을 제거합니다.(결제시 사용할 예정)
		this.booking.clear();
	}

	public Map<Integer, Integer> getAllBookingList() {
		// 카트 내의 모든 품목들을 반환합니다.
		return this.booking ;
	}

}
