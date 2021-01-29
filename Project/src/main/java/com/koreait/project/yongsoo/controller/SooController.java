package com.koreait.project.yongsoo.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.project.yongsoo.command.GoTrainerDetailCommand;
import com.koreait.project.yongsoo.command.GoTrainerListCommand;

import com.koreait.project.yongsoo.config.SooAppContext;

import com.koreait.project.yongsoo.command.InsertMeetingCommand;
import com.koreait.project.yongsoo.config.SooAppContext;
import com.koreait.project.yongsoo.dto.CreateNewMeetingDto;


@Controller
public class SooController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	// header페이지에서 '트레이너' 버튼 클릭시 트레이너 list페이지로 이동

	@RequestMapping(value="goTrainerList.do")

	@RequestMapping(value="goTrainerList.plitche")

	public String goTrainerList(Model model) {
		GoTrainerListCommand goTrainerListCommand = ctx.getBean("goTrainerListCommand", GoTrainerListCommand.class);
		goTrainerListCommand.execute(sqlSession, model);
		return "yongPage/trainerListPage";

	}
	
	// 트레이너 리스트페이지에서 특정 트레이너 클릭시 트레이너 상세페이지로 이동
	@RequestMapping(value="goTrainerDetail.do")
	public String goTrainerDetail(@RequestParam int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		GoTrainerDetailCommand goTrainerDetailCommand = ctx.getBean("goTrainerDetailCommand", GoTrainerDetailCommand.class);
		goTrainerDetailCommand.execute(sqlSession, model);
		return "yongPage/trainerDetailPage";
	}
	
	

	}
	
	// 트레이너 리스트페이지에서 특정 트레이너 클릭시 트레이너 상세페이지로 이동
	@RequestMapping(value="goTrainerDetail.plitche")
	public String goTrainerDetail(@RequestParam int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		GoTrainerDetailCommand goTrainerDetailCommand = ctx.getBean("goTrainerDetailCommand", GoTrainerDetailCommand.class);
		goTrainerDetailCommand.execute(sqlSession, model);
		return "yongPage/trainerDetailPage";
	}
	
	// 트레이너 프로그램 등록 - 미팅(모임) 게시글 작성 페이지로 단순이동을 위한 메소드
	@RequestMapping(value="goCreateMeetingPage.plitche")
	public String goCreateMeetingPage() {
		return "yongPage/createNewMeetingPage";
	}
	
	// 모임 작성 후 작성완료 버튼 클릭시 작동할 메소드
	@RequestMapping(value="createNewMeeting.plitche")
	public String createNewMeeting(CreateNewMeetingDto createNewMeetingDto, Model model) {
		model.addAttribute("createNewMeetingDto", createNewMeetingDto);
		InsertMeetingCommand insertMeetingCommand = ctx.getBean("insertMeetingCommand", InsertMeetingCommand.class);
		insertMeetingCommand.execute(sqlSession, model);
		return "redirect:goTrainerDetail.plitche?user_no"+10;
	}

	
	
}
