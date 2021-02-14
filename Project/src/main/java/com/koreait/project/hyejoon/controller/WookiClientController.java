package com.koreait.project.hyejoon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.hyejoon.command.myPage.MyQnAListCommand;
import com.koreait.project.hyejoon.command.myPage.PastMeetingListCommand;
import com.koreait.project.hyejoon.command.myPage.PreparingMeetingListCommand;
import com.koreait.project.hyejoon.command.userAccount.UserUpdateCommand;
import com.koreait.project.hyejoon.config.WookiClientAppContext;
import com.koreait.project.hyejoon.dto.UserUpdateDto;

@Controller
public class WookiClientController {
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(WookiClientAppContext.class);
	private PreparingMeetingListCommand preparingMeetingListCommand = ctx.getBean("preparingMeetingListCommand", PreparingMeetingListCommand.class);
	private PastMeetingListCommand pastMeetingListCommand = ctx.getBean("pastMeetingListCommand", PastMeetingListCommand.class);
	private MyQnAListCommand myQnAListCommand = ctx.getBean("myQnAListCommand", MyQnAListCommand.class);
	private UserUpdateCommand userUpdateCommand = ctx.getBean("userUpdateCommand", UserUpdateCommand.class);
	
	
	// 참가 예정 모임중 진행예정 모임 
	@GetMapping(value="preparingMeetingList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> preparingMeetingList(
			@ModelAttribute("user_no") int user_no,
			@ModelAttribute("page") int page,
			Model model) {
		return preparingMeetingListCommand.execute(sqlSession, model);
	}
	
	// 참가했던 지난모임
	@GetMapping(value="pastMeetingList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> pastMeetingList(
			@ModelAttribute("user_no") int user_no,
			@ModelAttribute("page") int page,
			Model model) {
		return pastMeetingListCommand.execute(sqlSession, model);
	}
	
	// 질문과 답변 리스트
	@GetMapping(value="myQnAList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> myQnAList(
			@ModelAttribute("user_no") int user_no,
			@ModelAttribute("page") int page,
			Model model) {
		return myQnAListCommand.execute(sqlSession, model);
	}
	
	// 회원정보 업데이트
	@PostMapping(value="userUpdate.wooki")
	public String userUpdate(
			HttpServletRequest request,
			UserUpdateDto userUpdateDto,
			Model model) {
		model.addAttribute("request", request);
		model.addAttribute("userUpdateDto", userUpdateDto);
		userUpdateCommand.execute(sqlSession, model);
		return "redirect:myPage_commonPart.hey";
	}
}
