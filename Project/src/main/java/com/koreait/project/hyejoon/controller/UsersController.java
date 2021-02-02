package com.koreait.project.hyejoon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.hyejoon.command.UsersLoginCommand;
import com.koreait.project.hyejoon.config.HyeAppContext;
import com.koreait.project.wooki.dto.UsersDto;

@Controller
public class UsersController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	private UsersLoginCommand usersLoginCommand = ctx.getBean("usersLoginCommand", UsersLoginCommand.class);
	
	/***** 단순 이동 *****/
	@RequestMapping(value="index.hey")
	public String goIndex() {
		return "index";
	}
	
	// header페이지에서 '로그인' 버튼 클릭시 로그인 페이지로 이동한다.
	@GetMapping(value="usersLoginPage.hey")
	public String usersLoginPage() {
		return "hyePages/usersLoginPage";
	}
	
	// 회원가입 버튼을 눌렀을 때 회원 가입 선택 페이지로 이동
	@GetMapping(value="signUpChoicePage.hey")
	public String signUpChoicePage() {
		return "hyePages/signUpChoicePage";
	}
	
	// 회원가입 정보입력 페이지로 이동
	@GetMapping(value="usersSignUpInsert.hey")
	public String usersSignUpInsert() {
		return "hyePages/usersSignUpInsert";
	}

	/***** 정보 전달 *****/
	
	@PostMapping(value="usersLogin.hey")
	public String usersLogin(UsersDto usersDto, HttpServletRequest request, RedirectAttributes redirect, Model model) {
		model.addAttribute("redirect", redirect);
		model.addAttribute("request", request);
		model.addAttribute("usersDto", usersDto);
		usersLoginCommand.execute(sqlSession, model);
		return "index";
	}
	
	@GetMapping(value="usersLogout.hey")
	public String usersLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "index";
	}
	
	
	
}
