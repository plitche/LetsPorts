package com.koreait.project.hyejoon.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.hyejoon.command.myPage.UserInfoUpdatePwCheckCommand;
import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class MyPageController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	private UserInfoUpdatePwCheckCommand userInfoUpdatePwCheckCommand = ctx.getBean("userInfoUpdatePwCheckCommand", UserInfoUpdatePwCheckCommand.class);
	
	/***** 단순 이동 *****/
	// header페이지에서 '마이페이지' 버튼 클릭시 마이 페이지로 이동한다.
	@RequestMapping(value="myPage_commonPart.hey")
	public String myPage() {
		return "hyePages/myPage_commonPart";
	}
	
	// header페이지에서 '마이페이지' 버튼 클릭시 마이 페이지로 이동한다.
	@RequestMapping(value="usersInfoUpdatePage.hey")
	public String usersInfoUpdatePage() {
		return "hyePages/usersInfoUpdatePage";
	}
	
	
	
	/***** 정보 전달 *****/
	
	// 마이페이지 정보 수정 페이지로 이동하기 위한 비밀번호 체크
	@RequestMapping(value="goUsersInfoUpdate.hey", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> goUsersInfoUpdate(@RequestBody String password, Model model){
		model.addAttribute("password", password);
		System.out.println("password:" + password);
		return userInfoUpdatePwCheckCommand.execute(sqlSession, model);
	}
	
	
}
