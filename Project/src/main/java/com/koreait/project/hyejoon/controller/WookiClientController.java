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
