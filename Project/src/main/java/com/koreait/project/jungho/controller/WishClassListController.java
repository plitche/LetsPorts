package com.koreait.project.jungho.controller;

import java.sql.Date;
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

import com.koreait.project.jungho.command.WishClassListCommand.WishClassDeleteCommand;
import com.koreait.project.jungho.command.WishClassListCommand.WishClassListInsertCommand;
import com.koreait.project.jungho.command.WishClassListCommand.WishClassListListCommand;
import com.koreait.project.jungho.command.WishClassListCommand.WishClassTotalCommand;
import com.koreait.project.jungho.config.WishClassListAppContext;
import com.koreait.project.jungho.dto.WishClassListDto;

@Controller
public class WishClassListController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(WishClassListAppContext.class);


	@RequestMapping(value="WishClassListPage.leo") // 리스트로 넘길때 로그인 중인 USER_NO를 보내야한다. 항상
	public String WishClassListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		WishClassListListCommand wishClassListListCommand = ctx.getBean("wishClassListListCommand", WishClassListListCommand.class);
		wishClassListListCommand.execute(sqlSession, model);
		return "jungPages/WishClassListPage";
	}
	
	@RequestMapping(value="WishClassInsert.leo",
								method=RequestMethod.GET,
								produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> WishClassListInsert(@RequestParam("scrap_referer_no") int scrap_referer_no,
																		@RequestParam("scrap_user_no") int scrap_user_no,
																		@RequestParam("user_no") int user_no,
																		@RequestParam("end_gather_date") Date end_gather_date,
																		Model model) {
		model.addAttribute("scrap_referer_no", scrap_referer_no);
		model.addAttribute("scrap_user_no", scrap_user_no);
		model.addAttribute("user_no", user_no);
		model.addAttribute("end_gather_date", end_gather_date);
		WishClassListInsertCommand wishClassListInsertCommand = ctx.getBean("wishClassListInsertCommand", WishClassListInsertCommand.class);
		return wishClassListInsertCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="WishClassTotal.leo",
							   method=RequestMethod.GET,
							   produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> WishClassTotal(@RequestParam("meeting_no") int meeting_no, Model model) {
		model.addAttribute("meeting_no", meeting_no);
		WishClassTotalCommand wishClassTotalCommand = ctx.getBean("wishClassTotalCommand", WishClassTotalCommand.class);
		return wishClassTotalCommand.execute(sqlSession, model);
	}
	
	
	@RequestMapping(value="WishClassDelete.leo",
							   method=RequestMethod.GET,
							   produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> WishClassDelete(@RequestParam("meeting_no") int meeting_no, Model model) {
		model.addAttribute("meeting_no", meeting_no);
		WishClassDeleteCommand wishClassDeleteCommand = ctx.getBean("wishClassDeleteCommand", WishClassDeleteCommand.class);
		return wishClassDeleteCommand.execute(sqlSession, model);
		
	}

}
