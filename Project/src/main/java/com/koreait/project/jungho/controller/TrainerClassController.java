package com.koreait.project.jungho.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.jungho.command.TagCommand.Tag0Command;
import com.koreait.project.jungho.command.TagCommand.Tag1Command;
import com.koreait.project.jungho.command.TagCommand.Tag2Command;
import com.koreait.project.jungho.command.TagCommand.Tag3Command;
import com.koreait.project.jungho.command.TagCommand.Tag4Command;
import com.koreait.project.jungho.command.TagCommand.Tag5Command;
import com.koreait.project.jungho.command.TagCommand.Tag6Command;
import com.koreait.project.jungho.command.TagCommand.Tag7Command;
import com.koreait.project.jungho.command.TagCommand.Tag8Command;
import com.koreait.project.jungho.command.TrainerClassCommand.ExerciseMateListCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.RelatedClassCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.SearchClassCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassDeleteCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassInsertCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassListCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassUpdateCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassViewCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerListCommand;
import com.koreait.project.jungho.config.JungAppContext;
import com.koreait.project.jungho.dto.TrainerClassDto;

@Controller
public class TrainerClassController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(JungAppContext.class);
	
	// 커뮤니티 -> 트레이너 클래스 선택하면 넘어와서 리스트뿌려주는 command 작업
	@RequestMapping(value="TrainerClassListPage.leo")
	public String TrainerClassMain(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		TrainerClassListCommand trainerClassListCommand = ctx.getBean("trainerClassListCommand", TrainerClassListCommand.class);
		trainerClassListCommand.execute(sqlSession, model);
		return "jungPages/TrainerClassListPage";
	}
	
	// 트레이너모임 관련 클래스만 뿌려주는 command
	@RequestMapping(value="TrainerClassList.leo")
	public String TrainerClassList(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		TrainerListCommand trainerListCommand = ctx.getBean("trainerListCommand", TrainerListCommand.class);
		trainerListCommand.execute(sqlSession, model);
		return "jungPages/TrainerClassListPage";
	}
	
	// 운동메이트 관련 클래스만 뿌려주는 command
	@RequestMapping(value="ExerciseMateList.leo")
	public String ExerciseMateList(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		ExerciseMateListCommand exerciseMateListCommand = ctx.getBean("exerciseMateListCommand", ExerciseMateListCommand.class);
		exerciseMateListCommand.execute(sqlSession, model);
		return "jungPages/TrainerClassListPage";
	}
	
	// 트레이너 클래스 작성 페이지로 넘겨주는 역할
	@RequestMapping(value="TrainerClassInsertPage.leo")
	public String maketrainerClass() {
		return "jungPages/TrainerClassInsertPage";
	}
	
	// 추가한 내용을 삽입시켜주는 명령역할
	@RequestMapping(value="TrainerClassInsert.leo", method=RequestMethod.POST)
	public String TrainerClassInsert(MultipartHttpServletRequest multipartRequest, Model model) {
		
		model.addAttribute("multipartRequest", multipartRequest);
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
	public String TrainerClassViewUpdate(MultipartHttpServletRequest multipartRequest, Model model) {
		
		model.addAttribute("multipartRequest", multipartRequest);
		TrainerClassUpdateCommand trainerClassUpdateCommand = ctx.getBean("trainerClassUpdateCommand", TrainerClassUpdateCommand.class);
		trainerClassUpdateCommand.execute(sqlSession, model);
		
		return "redirect:TrainerClassViewPage.leo?meeting_no=" + multipartRequest.getParameter("meeting_no");
	}
	
	// 트레이너 클래스의 검색 명령 역할
	@RequestMapping(value="SearchClass.leo", method=RequestMethod.GET)
	public String SearchClass(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
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
	
	
	// 태그 9개 처리 (족구, 축구, 스피닝 등등등)
	@RequestMapping(value="Tag0.leo", method=RequestMethod.GET)
	public String Tag0(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag0Command tag0Command = ctx.getBean("tag0Command", Tag0Command.class);
		tag0Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	@RequestMapping(value="Tag1.leo", method=RequestMethod.GET)
	public String Tag1(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag1Command tag1Command = ctx.getBean("tag1Command", Tag1Command.class);
		tag1Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	@RequestMapping(value="Tag2.leo", method=RequestMethod.GET)
	public String Tag2(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag2Command tag2Command = ctx.getBean("tag2Command", Tag2Command.class);
		tag2Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	@RequestMapping(value="Tag3.leo", method=RequestMethod.GET)
	public String Tag3(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag3Command tag3Command = ctx.getBean("tag3Command", Tag3Command.class);
		tag3Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	@RequestMapping(value="Tag4.leo", method=RequestMethod.GET)
	public String Tag4(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag4Command tag4Command = ctx.getBean("tag4Command", Tag4Command.class);
		tag4Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	@RequestMapping(value="Tag5.leo", method=RequestMethod.GET)
	public String Tag5(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag5Command tag5Command = ctx.getBean("tag5Command", Tag5Command.class);
		tag5Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	@RequestMapping(value="Tag6.leo", method=RequestMethod.GET)
	public String Tag6(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag6Command tag6Command = ctx.getBean("tag6Command", Tag6Command.class);
		tag6Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	@RequestMapping(value="Tag7.leo", method=RequestMethod.GET)
	public String Tag7(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag7Command tag7Command = ctx.getBean("tag7Command", Tag7Command.class);
		tag7Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}
	@RequestMapping(value="Tag8.leo", method=RequestMethod.GET)
	public String Tag8(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		Tag8Command tag8Command = ctx.getBean("tag8Command", Tag8Command.class);
		tag8Command.execute(sqlSession, model);
		
		return "jungPages/TrainerClassListPage";
	}

}
