package com.koreait.project.yewon.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.project.yewon.command.GoknowHowListCommand;
import com.koreait.project.yewon.config.WonAppContext;

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
	public String listPage() {
		return "wonPages/board_knowhow/board_knowhowListPage";
	}
	
	
	@RequestMapping(value="boardknowHowInsertPage.limyeng")
	public String boardknowHowInsertPage(HttpServletRequest request,
										 Model model) {
		
		
		return "wonPages/board_knowhow/boardknowHowInsertPage";
	}

	
	
	@RequestMapping(value = "boardknowhowViewPage.limyeng")
	public String boardknowHowViewPage(HttpServletRequest request, 
									   Model model) {
		
		return "wonPages/board_knowhow/boardknowhoViewPage";
	}
	
	
	
	
	
}
