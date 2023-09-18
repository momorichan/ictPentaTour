package com.shopping.model.mall;

import java.util.HashMap;
import java.util.Map;

// 이 클래스는 테스트용으로 CartItem 목록을 저장하고 있는 한시적 클래스입니다.
// 차후 데이터 베이스를 사용하여 처리할 예정입니다.
public class CartMap {
	private Map<Integer, CartItem> itemList = null ;
	
	public CartMap() { // 생성자
		this.itemList = new HashMap<Integer, CartItem>() ;
		
		// 목록 채워 넣기
		itemList.put(1, new CartItem(1, "우유", 10, 1000, "aaa.png", 5)) ;
		itemList.put(2, new CartItem(2, "요거트", 20, 2000, "bbb.png", 15)) ;
		itemList.put(3, new CartItem(3, "라면", 30, 3000, "ccc.png", 25)) ;
		itemList.put(4, new CartItem(4, "채소", 40, 4000, "ddd.png", 35)) ;
		itemList.put(5, new CartItem(5, "고기", 50, 5000, "eee.png", 45)) ;
	}
	
	public Map<Integer, CartItem> GetItemList() {
		return this.itemList; // 전체 목록 반환
	}

}
