package com.koreait.project.hyejoon.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.project.hyejoon.command.LoginCommand;
import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	
	// header페이지에서 '로그인' 버튼 클릭시 로그인 페이지로 이동
	@RequestMapping(value="loginPage.hey")
	public String loginPage(Model model) {
		LoginCommand loginCommand = ctx.getBean("loginCommand", LoginCommand.class);
		loginCommand.execute(sqlSession, model);
		return "HyePage/loginPage";
	}
	
}
