package com.koreait.project.jungho.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TrainerController {

	private SqlSession sqlSession;
	
	@RequestMapping(value="TrainerClassMain.trainer", method=RequestMethod.GET)
	public String TrainerClassMain() {
		return "jungPages/TrainerClassMain";
	}
	
}
