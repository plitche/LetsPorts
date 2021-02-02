package com.koreait.project.yewon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.project.yewon.command.GoknowHowInsertCommand;
import com.koreait.project.yewon.command.GoknowHowListCommand;
import com.koreait.project.yewon.config.WonAppContext;
import com.koreait.project.yewon.dao.KnowHowDao;

import sun.rmi.transport.proxy.HttpReceiveSocket;

@Controller
public class WonController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(WonAppContext.class);

	
	// header 페이지에서 '노하우게시판' 클릭시 list페이지로 이동
	/*@RequestMapping(value = "goboard_knowhowList.limyeng")
	public String goknowhowList(Model model) {
		GoknowHowListCommand goknowHowListCommand = ctx.getBean("goknowhowListCommand", GoknowHowListCommand.class);
		goknowHowListCommand.execute(sqlSession, model);
		return "wonPages/board_knowhow/board_knowhowListPage";
	}
	*/
	
	@RequestMapping(value = "goboard_knowhowList.limyeng")
	public String listPage(Model model) {
		GoknowHowListCommand goknowHowListCommand = ctx.getBean("goknowhowListCommand", GoknowHowListCommand.class);
		goknowHowListCommand.execute(sqlSession, model);
		return "wonPages/board_knowhow/board_knowHowListPage";
		
	}

	
	@RequestMapping(value="board_knowHowInsertPage.limyeng")
	public String boardknowHowInsertPage(Model model) {
		return "wonPages/board_knowhow/board_knowHowInsertPage";
	}

	
	
	@RequestMapping(value = "board_knowHowInsert.limyeng", method=RequestMethod.GET)
	public String boardknowHowViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		GoknowHowInsertCommand goknowHowInsertCommand = ctx.getBean("goknowHowInsertCommand", GoknowHowInsertCommand.class);
		goknowHowInsertCommand.execute(sqlSession, model);
		return "redirect:goboard_knowhowList.limyeng";
	}
	
	// 목록으로 돌아가기 버튼을 클릭했을때 list 페이지로 이동하는 컨트롤러
	@RequestMapping(value = "board_knowHowListPage.limyeng")
		public String boardknowHowListPage(Model model) {
			return "wonPages/board_knowhow/board_knowHowListPage";
	}
	
	
	
	
	
	
	
	
}
