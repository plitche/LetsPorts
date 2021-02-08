package com.koreait.project.hyejoon.controller;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.dto.ExerciseDto;
import com.koreait.project.hyejoon.command.signUp.EmailAuthCommand;
import com.koreait.project.hyejoon.command.signUp.EmailCheckCommand;
import com.koreait.project.hyejoon.command.signUp.ExerciseCheckedCommand;
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
	private ExerciseCheckedCommand exerciseCheckedCommand = ctx.getBean("exerciseCheckedCommand", ExerciseCheckedCommand.class);
	
	// 회원 가입 닉네임 중복체크를 위한 ajax용
	@RequestMapping(value="nickCheck.hey/{user_nickname}", method=RequestMethod.GET, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> nickCheck(@PathVariable("user_nickname") String user_nickname, Model model){
		model.addAttribute("user_nickname", user_nickname);
		return nickCheckCommand.execute(sqlSession, model);
	}
	
	// 회원 가입 이메일 중복체크를 위한 ajax용
	@RequestMapping(value="emailCheck.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailCheck(@RequestBody String email, Model model){
		model.addAttribute("email", email);
		return emailCheckCommand.execute(sqlSession, model);
	}
	
	
	// 회원 가입 이메일 인증을 위한 ajax용
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="emailAuth.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailAuth(@RequestBody String email, Model model) {
		model.addAttribute("email", email);
		model.addAttribute("mailSender", mailSender);
		System.out.println(1+ email + 1);
		return emailAuthCommand.execute(sqlSession, model);
	}
	
	// 관심 분야 선택 ajax용
	@RequestMapping(value="exerciseCheck.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> exerciseCheck(@RequestParam(value="exercise_no") int exercise_no, Model model){
		ArrayList<Integer> list = new ArrayList<>();
		model.addAttribute("list", list);
		return exerciseCheckedCommand.execute(sqlSession, model);
	}
	
	
}
