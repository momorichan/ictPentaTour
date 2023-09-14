package com.shopping.model.mall;

import java.util.HashMap;
import java.util.Map;

// 매장 내의 카트를 관리하기 위한 유틸리티 클래스입니다.
public class CartManager {
	// carts : 나의 카트에 담겨져 있는 상품들의 번호와 수량 정보
	// 카트의 품목은 <번호, 수량> 형식입니다. 
	private Map<Integer, Integer> carts = null ;
	
	public CartManager() {
		this.carts = new HashMap<Integer, Integer>() ;
	}

	public int getCartItemSize() {
		// 카트에 담겨져 있는 품목의 갯수를 반환합니다.
		return this.carts.size();
	}

	public void addCart(int pnum, int qty) {
		//카트에 상품을 추가합니다.
		if(this.carts.containsKey(pnum)) {//이미 카트에 품목이 있는 경우
			int newQty = this.carts.get(pnum) + qty;
			this.carts.put(pnum, newQty);
		}else {
			this.carts.put(pnum, qty);
		}
	}

	public void editCart(int pnum, int qty) {
		// 카트 내의 상품 수량을 변경합니다.(overwrite)
		this.carts.put(pnum, qty);
	}

	public void deleteCart(int pnum) {
		// 해당 상품 목록을 Cart에서 제거합니다.
		this.carts.remove(pnum);
	}

	public void removeAllCart(int pnum, int qty) {
		// 카트에 들어있는 모든 품목 제거.(결제시 사용할 예정)
		this.carts.clear();
	}

	public Map<Integer, Integer> getAllCartList() {
		// 카트 내의 모든 품목들을 반환합니다.
		
		return this.carts;
	}
	
	
}
