package com.example.spring03.model.reply2.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.model.reply2.dto.Reply2DTO;
@Repository
public class Reply2DAOImpl implements Reply2DAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<Reply2DTO> list(int product_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reply2.listReply", product_num);
	}

	@Override
	public int count(int product_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void create(Reply2DTO dto) {
		sqlSession.insert("reply2.insertReply", dto);

	}

	@Override
	public void update(Reply2DTO dto) {
		sqlSession.update("reply2.updateReply", dto);
	}

	@Override
	public void delete(int rno) {
		sqlSession.delete("reply2.deleteReply",  rno);

	}

}
