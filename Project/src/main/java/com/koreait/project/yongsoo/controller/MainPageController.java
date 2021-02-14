package com.koreait.project.yongsoo.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.yongsoo.command.mainPage.GetMeetingCommand;
import com.koreait.project.yongsoo.command.mainPage.GetQnACommand;
import com.koreait.project.yongsoo.command.mainPage.GetTrainerCommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class MainPageController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	// 메인페이지에 마감이 임박한 모임 정보를 가져오기 위한 메소드
	@RequestMapping(value="getMeeting.plitche", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getMeeting(Model model) {
		GetMeetingCommand getMeetingCommand = ctx.getBean("getMeetingCommand", GetMeetingCommand.class);
		return getMeetingCommand.execute(sqlSession, model);
	}
	
	// 메인페이지에 인기 있는 트레이너 정보를 가져오기 위한 메소드
	@RequestMapping(value="getTrainer.plitche", method=RequestMethod.GET,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getTrainer(Model model) {
		GetTrainerCommand getTrainerCommand = ctx.getBean("getTrainerCommand", GetTrainerCommand.class);
		return getTrainerCommand.execute(sqlSession, model);
	}
	
	// 메인페이지에 최근에 작성된 질문 정보를 가져오기 위한 메소드
	@RequestMapping(value="getQnA.plitche", method=RequestMethod.GET,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getQnA(Model model) {
		GetQnACommand getQnACommand = ctx.getBean("getQnACommand", GetQnACommand.class);
		return getQnACommand.execute(sqlSession, model);
	}
		
	
}
