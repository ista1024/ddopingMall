package com.example.spring03.service.reply2;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.model.reply2.dao.Reply2DAO;
import com.example.spring03.model.reply2.dto.Reply2DTO;
@Service
public class Reply2Service2Impl implements Reply2Service {
	@Inject
	Reply2DAO replyDao;
	

	@Override
	public List<Reply2DTO> list(int product_num) {
		
		return replyDao.list(product_num);
	}

	@Override
	public int count(int product_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(Reply2DTO dto) {
		replyDao.create(dto);

	}

	@Override
	public void update(Reply2DTO dto) {
		replyDao.update(dto);

	}

	@Override
	public void delete(int rno) {
		replyDao.delete(rno);

	}

}
