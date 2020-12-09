package com.example.spring03.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.model.board.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;
	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reply.listReply", bno);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(ReplyDTO dto) {
		sqlSession.insert("reply.insertReply", dto);

	}

	@Override
	public void delete(int bno) {
		sqlSession.delete("reply.deleteReply", bno);

	}

}
