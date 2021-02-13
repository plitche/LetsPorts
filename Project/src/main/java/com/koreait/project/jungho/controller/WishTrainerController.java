package com.koreait.project.jungho.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.jungho.command.WishTrainerCommand.WishTrainerInsertCommand;
import com.koreait.project.jungho.command.WishTrainerCommand.WishTrainerListCommand;
import com.koreait.project.jungho.command.WishTrainerCommand.WishTrainerTotalCommand;
import com.koreait.project.jungho.config.WishTrainerAppContext;

@Controller
public class WishTrainerController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(WishTrainerAppContext.class);
	
	@RequestMapping(value="WishTrainerListPage.leo")
	public String WishTrainerListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		WishTrainerListCommand wishTrainerListCommand = ctx.getBean("wishTrainerListCommand", WishTrainerListCommand.class);
		wishTrainerListCommand.execute(sqlSession, model);
		return "jungPages/WishTrainerListPage";
	}
	
	@RequestMapping(value = "WishTrainerInsert.leo",
								method = RequestMethod.GET,
								produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> WishTrainerInsert(@RequestParam("scrap_referer_no") int scrap_referer_no,
																	 @RequestParam("user_no") int user_no,
																	 Model model) {
		model.addAttribute("scrap_referer_no", scrap_referer_no);
		model.addAttribute("user_no", user_no);
		WishTrainerInsertCommand wishTrainerInsertCommand = ctx.getBean("wishTrainerInsertCommand", WishTrainerInsertCommand.class);
		return wishTrainerInsertCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="WishTrainerTotal.leo",
							   method=RequestMethod.GET,
							   produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> WishTrainerTotal(@RequestParam("scrap_referer_no") int scrap_referer_no,
																   Model model) {
		model.addAttribute("scrap_referer_no", scrap_referer_no);
		WishTrainerTotalCommand wishTrainerTotalCommand = ctx.getBean("wishTrainerTotalCommand", WishTrainerTotalCommand.class);
		return wishTrainerTotalCommand.execute(sqlSession, model);
	}
	
	
}
