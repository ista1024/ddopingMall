package com.example.spring03.controller.reply2;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring03.model.reply2.dto.Reply2DTO;
import com.example.spring03.service.reply2.Reply2Service;

@RestController
@RequestMapping("reply2/*")
public class Reply2Controller {
	@Inject
	Reply2Service replyService;
	
	@RequestMapping("insert.do")
	public void insert(Reply2DTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setReplyer(userid);
		replyService.create(dto);
		System.out.println(dto);
	}
	@RequestMapping("list.do")
	public ModelAndView list(int product_num, ModelAndView mav) {
		List<Reply2DTO> list=replyService.list(product_num);
		mav.setViewName("shop/reply_list");
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("update.do")
	public String update(Reply2DTO dto) throws Exception{
		if(dto !=null) {
			replyService.update(dto);
		}
		return "redirect:/reply2/list.do?product_num="+dto.getProduct_num();
	}
	@RequestMapping("delete.do")
	public void delete(int rno) throws Exception{
		System.out.println(rno);
		replyService.delete(rno);
	}
	
	

}
