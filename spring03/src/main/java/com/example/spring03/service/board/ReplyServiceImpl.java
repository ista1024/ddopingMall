package com.example.spring03.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.model.board.dao.ReplyDAO;
import com.example.spring03.model.board.dto.ReplyDTO;
@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	ReplyDAO replyDao;

	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return replyDao.list(bno);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(ReplyDTO dto) {
		replyDao.create(dto);

	}

	@Override
	public void delete(int bno) {
		replyDao.delete(bno);

	}

}
