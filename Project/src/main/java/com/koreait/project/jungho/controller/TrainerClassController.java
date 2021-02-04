package com.koreait.project.jungho.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.jungho.command.TrainerClassCommand.RelatedClassCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassDeleteCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassInsertCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassListCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassUpdateCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassViewCommand;
import com.koreait.project.jungho.config.JungAppContext;
import com.koreait.project.jungho.dto.TrainerClassDto;

import searchClass.SearchClassCommand;

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
	
	// 트레이너 클래스 작성 페이지로 넘겨주는 역할
	@RequestMapping(value="TrainerClassInsertPage.leo")
	public String maketrainerClass() {
		return "jungPages/TrainerClassInsertPage";
	}
	
	// 추가한 내용을 삽입시켜주는 명령역할
	@RequestMapping(value="TrainerClassInsert.leo")
	public String TrainerClassInsert(TrainerClassDto trainerClassDto, Model model) {
		
		model.addAttribute("trainerClassDto", trainerClassDto);
		TrainerClassInsertCommand trainerClassInsertCommand = ctx.getBean("trainerClassInsertCommand", TrainerClassInsertCommand.class);
		trainerClassInsertCommand.execute(sqlSession, model);
		
		return "redirect:TrainerClassListPage.leo";
		
	}
	
	// 목록 리스트 중 하나를 클릭하면 리스트 정보를 보여주는 페이지
	@RequestMapping(value="TrainerClassViewPage.leo")
	public String TrainerClassViewPage(@RequestParam("meeting_no") int meeting_no, Model model) {
		
		model.addAttribute("meeting_no", meeting_no);
		TrainerClassViewCommand trainerClassViewCommand = ctx.getBean("trainerClassViewCommand", TrainerClassViewCommand.class);
		trainerClassViewCommand.execute(sqlSession, model);
		
		return "jungPages/TrainerClassViewPage";
	}
	
	// view페이지에서 삭제
	@RequestMapping(value="TrainerClassViewDelete.leo", method=RequestMethod.POST)
	public String TrainerClassViewDelete(@RequestParam("meeting_no") int meeting_no, Model model) {
		
		model.addAttribute("meeting_no", meeting_no);
		TrainerClassDeleteCommand trainerClassDeletCommand = ctx.getBean("trainerClassDeleteCommand", TrainerClassDeleteCommand.class);
		trainerClassDeletCommand.execute(sqlSession, model);
		
		return "redirect:TrainerClassListPage.leo";
		
	}
	
	// view페이지에서 수정페이지로 넘어가는 역할
	@RequestMapping(value="TrainerClassViewUpdatePage.leo", method=RequestMethod.POST)
	public String TrainerClassViewUpdatePage(TrainerClassDto trainerClassDto, Model model) {
		model.addAttribute("trainerClassDto", trainerClassDto);
		return "jungPages/TrainerClassViewUpdatePage";
	}
	
	
	// 수정명령역할
	@RequestMapping(value="TrainerClassViewUpdate.leo", method=RequestMethod.POST)
	public String TrainerClassViewUpdate(TrainerClassDto trainerClassDto, Model model) {
		
		model.addAttribute("trainerClassDto", trainerClassDto);
		TrainerClassUpdateCommand trainerClassUpdateCommand = ctx.getBean("trainerClassUpdateCommand", TrainerClassUpdateCommand.class);
		trainerClassUpdateCommand.execute(sqlSession, model);
		
		return "redirect:TrainerClassViewPage.leo?meeting_no=" + trainerClassDto.getMeeting_no();
	}
	
	@RequestMapping(value="SearchClass.leo", method=RequestMethod.GET)
	public String SearchClass(@RequestParam("search_content") String search_content, Model model) {
		
		model.addAttribute("search_content", search_content);
		SearchClassCommand searchClassCommand = ctx.getBean("searchClassCommand", SearchClassCommand.class);
		searchClassCommand.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	
	
	// 관련 클래스 list 뿌려주는 역할
	@RequestMapping(value="relatedClass.leo",
										method=RequestMethod.POST,
										produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> relatedClass(@RequestBody TrainerClassDto trainerClassDto, Model model) {
		
		model.addAttribute("trainerClassDto", trainerClassDto);
		RelatedClassCommand relatedClassCommand = ctx.getBean("relatedClassCommand", RelatedClassCommand.class);
		return relatedClassCommand.execute(sqlSession, model);
		
	}
	
	
	
}
