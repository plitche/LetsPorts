package com.koreait.project.hyejoon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.koreait.project.hyejoon.command.signUp.EmailAuthCommand;
import com.koreait.project.hyejoon.command.signUp.EmailCheckCommand;
import com.koreait.project.hyejoon.command.signUp.InsertJoinCommand;
import com.koreait.project.hyejoon.command.signUp.NickCheckCommand;
import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class UsersSignUpController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	private NickCheckCommand nickCheckCommand = ctx.getBean("nickCheckCommand", NickCheckCommand.class);
	private EmailCheckCommand emailCheckCommand = ctx.getBean("emailCheckCommand", EmailCheckCommand.class);
	private EmailAuthCommand emailAuthCommand = ctx.getBean("emailAuthCommand", EmailAuthCommand.class);
	private InsertJoinCommand insertJoinCommand = ctx.getBean("insertJoinCommand", InsertJoinCommand.class);
	
	// 회원 가입 닉네임 중복체크를 위한 ajax용
	@RequestMapping(value="nickCheck.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> nickCheck(@RequestBody UsersDto usersDto, Model model) {
		System.out.println("user_nickname: " + usersDto.getUser_nickname());
		model.addAttribute("user_nickname", usersDto.getUser_nickname());
		return nickCheckCommand.execute(sqlSession, model);
	}
	
	// 회원 가입 이메일 중복체크를 위한 ajax용
	@RequestMapping(value="emailCheck.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailCheck(@RequestBody UsersDto usersDto, Model model){
		model.addAttribute("email", usersDto.getEmail());
		return emailCheckCommand.execute(sqlSession, model);
	}
	
	
	// 회원 가입 이메일 인증을 위한 ajax용
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="emailAuth.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailAuth(@RequestBody UsersDto usersDto, Model model) {
		model.addAttribute("email", usersDto.getEmail());
		model.addAttribute("mailSender", mailSender);
		return emailAuthCommand.execute(sqlSession, model);
	}
	
	
	// 회원가입 정보 입력을 위한 insert만들기
	@RequestMapping(value="insertJoin.hey", method=RequestMethod.POST)
	public String insertJoin(HttpServletRequest request, Model model, RedirectAttributes redirect) {
		model.addAttribute("request", request);
		model.addAttribute("redirect", redirect);
		insertJoinCommand.execute(sqlSession, model);
		return "redirect:usersLoginPage.hey";
	}
	
	
	
}
