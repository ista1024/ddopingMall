package com.example.spring03.service.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.model.order.dao.OrderDAO;
import com.example.spring03.model.order.dto.OrderDTO;
import com.example.spring03.model.order.dto.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDAO orderDao;


	@Override
	public void orderInfo_Details(OrderDetailDTO orderDetail) {
		orderDao.orderInfo_Details(orderDetail);
	}


	@Override
	public void orderInfo(OrderDTO order) {
		orderDao.orderInfo(order);
	}


	@Override
	public void cartAllDelete(String userId) throws Exception {
		orderDao.cartAllDelete(userId);
	}


	@Override
	public List<OrderDTO> orderList(String userId) throws Exception {
		return orderDao.orderList(userId);
	}

}
