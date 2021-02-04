package com.koreait.project.hyejoon.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.hyejoon.command.NickCheckCommand;
import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class UsersSignUpController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	private NickCheckCommand nickCheckCommand = ctx.getBean("nickCheckCommand", NickCheckCommand.class);
	
	// 회원 가입 닉네임 체크를 위한 ajax용
	@RequestMapping(value="nickCheck.hey/{user_nickname}")
	@ResponseBody
	public Map<String, Object> nickCheck(@PathVariable("user_nickname") String user_nickname, Model model){
		model.addAttribute("user_nickname", user_nickname);
		System.out.println(user_nickname);
		return nickCheckCommand.execute(sqlSession, model);
	}
	
}
