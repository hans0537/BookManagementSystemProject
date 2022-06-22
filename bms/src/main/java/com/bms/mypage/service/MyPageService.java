package com.bms.mypage.service;

import java.util.List;
import java.util.Map;

import com.bms.member.dto.MemberDTO;
import com.bms.order.dto.OrderDTO;

public interface MyPageService{
	
	public List<OrderDTO> listMyOrderGoods(String memberId) throws Exception;
	public List<OrderDTO> findMyOrderInfo(String orderId) throws Exception;
	public List<OrderDTO> listMyOrderHistory(Map<String,String> dateMap) throws Exception;
	public MemberDTO  modifyMyInfo(Map<String,String> memberMap) throws Exception;
	public void cancelOrder(Map<String, String> cancelMap) throws Exception;
	public MemberDTO myDetailInfo(String memberId) throws Exception;

}
