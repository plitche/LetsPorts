package com.koreait.project.hyejoon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.command.login.SendTempPwCommand;
import com.koreait.project.hyejoon.command.login.UserCheckCommand;
import com.koreait.project.hyejoon.command.login.UsersLoginCommand;
import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class UsersLoginController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	private UsersLoginCommand usersLoginCommand = ctx.getBean("usersLoginCommand", UsersLoginCommand.class);
	private SendTempPwCommand sendTempPwCommand = ctx.getBean("sendTempPwCommand", SendTempPwCommand.class);
	private UserCheckCommand userCheckCommand = ctx.getBean("userCheckCommand", UserCheckCommand.class);
	
	/***** 단순 이동 *****/
	
	// header페이지에서 '로그인' 버튼 클릭시 로그인 페이지로 이동한다.
	@RequestMapping(value="usersLoginPage.hey")
	public String usersLoginPage() {
		return "hyePages/usersLoginPage";
	}
	
	// 회원가입 버튼을 눌렀을 때 회원 가입 선택 페이지로 이동
	@RequestMapping(value="signUpChoicePage.hey")
	public String signUpChoicePage() {
		return "hyePages/signUpChoicePage";
	}
	
	// 회원가입 정보입력 페이지로 이동
	@RequestMapping(value="usersSignUpPage.hey")
	public String usersSignUpInsert() {
		return "hyePages/usersSignUpPage";
	}
	
	
	
	/***** 정보 전달 *****/
	
	// 로그인
	@RequestMapping(value="usersLogin.hey", method=RequestMethod.POST)
	public String usersLogin(HttpServletRequest request, Model model, RedirectAttributes redirect) {
		model.addAttribute("request", request);
		model.addAttribute("redirect", redirect);
		usersLoginCommand.execute(sqlSession, model);
		return "redirect:usersLoginPage.hey";	// redirect = 옆에적은 경로의 url로 이동한다.( 그 전에 있던 request 정보만 없다.)
	}
	// 로그아웃
	@RequestMapping(value="usersLogout.hey")
	public String usersLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	// 회원인지 여부 확인을 위한 ajax용
	@RequestMapping(value="userCheck.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> userCheck(@RequestBody UsersDto usersDto, Model model){
		model.addAttribute("usersDto", usersDto);
		return userCheckCommand.execute(sqlSession, model);
	}
	
	// 임시 비밀번호 발송
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="sendTempPw.hey", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendTempPw(@RequestBody String email, Model model) {
		model.addAttribute("mailSender", mailSender);
		model.addAttribute("email", email);
		return sendTempPwCommand.execute(sqlSession, model);
	}
	
}