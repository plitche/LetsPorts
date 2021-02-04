package com.koreait.project.hyejoon.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class MyPageController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	
	/***** 단순 이동 *****/
	// header페이지에서 '마이페이지' 버튼 클릭시 마이 페이지로 이동한다.
	// 기본은 모임 탭으로 함
	// 정보수정 페이지로 이동
	@RequestMapping(value="usersInfoUpdate.hey")
	public String usersInfoUpdate() {
		return "hyePages/usersInfoUpdate";
	}
	
	
	
	/***** 정보 전달 *****/
	
	
}
