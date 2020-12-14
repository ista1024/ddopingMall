
package com.example.spring03.model.order.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.model.order.dto.OrderDTO;
import com.example.spring03.model.order.dto.OrderDetailDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void orderInfo(OrderDTO order) {
		sqlSession.insert("cart.orderInfo", order);
	}

	@Override
	public void orderInfo_Details(OrderDetailDTO orderDetail) {
		sqlSession.insert("cart.orderInfo_Details", orderDetail);
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		sqlSession.delete("cart.cartAllDelete", userId);
	}

	@Override
	public List<OrderDTO> orderList(String userId) throws Exception {
		return sqlSession.selectList("cart.orderList", userId);
	}

	@Override
	public List<OrderDTO> orderList2(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cart.orderList2", userId);
	}

}
