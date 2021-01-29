package com.koreait.project.jungho.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.project.jungho.command.TrainerClassInsertCommand;
import com.koreait.project.jungho.command.TrainerClassListCommand;
import com.koreait.project.jungho.config.JungAppContext;
import com.koreait.project.jungho.dto.TrainerClassDto;

@Controller
public class TrainerClassController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(JungAppContext.class);
	
	
	
	// 커뮤니티 -> 트레이너 클래스 선택하면 넘어와서 리스트뿌려주는 command 작업
	@RequestMapping(value="TrainerClassListPage.leo")
	public String TrainerClassMain(Model model) {
		TrainerClassListCommand trainerClassListCommand = ctx.getBean("trainerClassListCommand", TrainerClassListCommand.class);
		trainerClassListCommand.execute(sqlSession, model);
		return "jungPages/TrainerClassListPage";
	}
	
	@RequestMapping(value="TrainerClassInsertPage.leo")
	public String maketrainerClass() {
		return "jungPages/TrainerClassInsertPage";
	}
	
	@RequestMapping(value="TrainerClassInsert.leo")
	public String TrainerClassInsert(TrainerClassDto trainerClassDto, Model model) {
		
		model.addAttribute("trainerClassDto", trainerClassDto);
		TrainerClassInsertCommand trainerClassInsertCommand = ctx.getBean("trainerClassInsertCommand", TrainerClassInsertCommand.class);
		trainerClassInsertCommand.execute(sqlSession, model);
		
		return "redirect:TrainerClassListPage.leo";
	}
	
}
