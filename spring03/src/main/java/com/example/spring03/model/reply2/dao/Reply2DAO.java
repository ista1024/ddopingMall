package com.example.spring03.model.reply2.dao;

import java.util.List;

import com.example.spring03.model.reply2.dto.Reply2DTO;

public interface Reply2DAO {
	
	public List<Reply2DTO> list(int product_num);
	public int count(int product_num);
	public void create(Reply2DTO dto);
	public void update(Reply2DTO dto);
	public void delete(int product_num);
	

}
