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

import com.koreait.project.jungho.command.WishClassListCommand.WishClassListInsertCommand;
import com.koreait.project.jungho.command.WishClassListCommand.WishClassListListCommand;
import com.koreait.project.jungho.command.WishClassListCommand.WishClassListTotalCommand;
import com.koreait.project.jungho.config.WishClassListAppContext;

@Controller
public class WishClassListController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(WishClassListAppContext.class);

	
	// 해당 모임이 위시리스트에 담긴 모든 갯수
	@RequestMapping(value="WishClassListTotal.leo",
								method=RequestMethod.GET,
								produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> WishClassListTotal(@RequestParam("meeting_no") int meeting_no, Model model) {
		model.addAttribute("meeting_no", meeting_no);
		WishClassListTotalCommand wishClassListTotalCommand = ctx.getBean("wishClassListTotalCommand", WishClassListTotalCommand.class);
		return wishClassListTotalCommand.execute(sqlSession, model);
	}
	

	@RequestMapping(value="WishClassListPage.leo") // 리스트로 넘길때 로그인 중인 USER_NO를 보내야한다. 항상
	public String WishClassListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		WishClassListListCommand wishClassListListCommand = ctx.getBean("wishClassListListCommand", WishClassListListCommand.class);
		wishClassListListCommand.execute(sqlSession, model);
		return "jungPages/WishClassListPage";
	}
	
	@RequestMapping(value="WishClassInsert.leo")
	public String WishClassListInsert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		WishClassListInsertCommand wishClassListInsertCommand = ctx.getBean("wishClassListInsertCommand", WishClassListInsertCommand.class);
		wishClassListInsertCommand.execute(sqlSession, model);
		return "redirect:WishClassListPage.leo";
	}

}
