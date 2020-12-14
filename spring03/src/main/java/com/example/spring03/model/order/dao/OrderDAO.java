package com.example.spring03.model.order.dao;

import java.util.List;

import com.example.spring03.model.order.dto.OrderDTO;
import com.example.spring03.model.order.dto.OrderDetailDTO;

public interface OrderDAO {
	public void orderInfo(OrderDTO order);
	public void orderInfo_Details(OrderDetailDTO orderDetail);
	public void cartAllDelete(String userId) throws Exception;
	public List<OrderDTO> orderList(String userId) throws Exception;
	public List<OrderDTO> orderList2(String userId) throws Exception;

}
