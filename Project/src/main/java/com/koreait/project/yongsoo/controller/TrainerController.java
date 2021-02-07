package com.koreait.project.yongsoo.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.project.yongsoo.command.trainer.GoTrainerDetailCommand;
import com.koreait.project.yongsoo.command.trainer.GoTrainerListCommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class TrainerController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	// header페이지에서 '트레이너' 버튼 클릭시 트레이너 list페이지로 이동
	@RequestMapping(value="goTrainerList.plitche")
	public String goTrainerList(Model model) {
		GoTrainerListCommand goTrainerListCommand = ctx.getBean("goTrainerListCommand", GoTrainerListCommand.class);
		goTrainerListCommand.execute(sqlSession, model);
		return "yongPage/trainerListPage";
	}
	
	// 트레이너 리스트페이지에서 특정 트레이너 클릭시 트레이너 상세페이지로 이동
	@RequestMapping(value="goTrainerDetail.plitche")
	public String goTrainerDetail(@RequestParam int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		GoTrainerDetailCommand goTrainerDetailCommand = ctx.getBean("goTrainerDetailCommand", GoTrainerDetailCommand.class);
		goTrainerDetailCommand.execute(sqlSession, model);
		return "yongPage/trainerDetailPage";
	}
	

	
	
	
	
	
	
	
	
}