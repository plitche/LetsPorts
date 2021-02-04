package com.koreait.project.yewon.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.project.yewon.command.GoknowHowInsertCommand;
import com.koreait.project.yewon.command.GoknowHowListCommand;
import com.koreait.project.yewon.command.GoknowHowUpdateCommand;
import com.koreait.project.yewon.command.GoknowHowViewCommand;
import com.koreait.project.yewon.config.WonAppContext;

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
	
	// 목록으로 돌아가기 버튼을 클릭했을때 list 페이지로 이동
	@RequestMapping(value = "board_knowHowList.limyeng")
	public String boardknowHowListPage(Model model) {
			return "wonPages/board_knowhow/board_knowHowListPage";
			
	}
	
	// listPage에서 게시글 클릭하면 viewPage로 이동
	@RequestMapping(value = "board_knowHowViewPage.limyeng", method=RequestMethod.GET)
	public String boardKnowHowViewPage(@RequestParam("knowhow_no") int knowhow_no, Model model) {
		model.addAttribute("knowhow_no", knowhow_no);
		GoknowHowViewCommand goknowHowViewCommand = ctx.getBean("goknowHowViewCommand", GoknowHowViewCommand.class);
		goknowHowViewCommand.execute(sqlSession, model);
		return "wonPages/board_knowhow/board_knowHowViewPage";
		
	}
	
	// viewPage에서 수정 버튼을 누르면 updatePage로 이동
	@RequestMapping(value = "board_knowHowUpdatePage.limyeng", method=RequestMethod.GET)
	public String boardKnowHowUpdatePage(@RequestParam("knowhow_no") int knowhow_no, Model model) {
		model.addAttribute("knowhow_no", knowhow_no);
		GoknowHowUpdateCommand goknowHowUpdateCommand = ctx.getBean("goknowHowUpdateCommand", GoknowHowUpdateCommand.class);
		goknowHowUpdateCommand.execute(sqlSession, model);
		return "wonPages/board_knowhow/board_knowHowUpdatePage";
	}
	
	// viewPage에서 글목록으로 돌아가기 버튼 클릭시 list페이지로 이동
	@RequestMapping(value = "board_knowHowListPage.limyeng")
	public String boardknowHowUpdatePage(Model model) {
		GoknowHowViewCommand goknowHowViewCommand = ctx.getBean("goknowHowViewCommand", GoknowHowViewCommand.class);
			return "redirect:goboard_knowhowList.limyeng";
	}
	
	// updatePage에서 수정완료 후 viewPage로 이동
	@RequestMapping(value = "board_knowHowUpdate.limyeng", method =RequestMethod.GET)
	public String boardknowHowUpdatePage(HttpRequest httpRequest, Model model) {
		GoknowHowUpdateCommand goknowHowUpdateCommand= ctx.getBean("goknowHowUpdateCommand", GoknowHowUpdateCommand.class);
		goknowHowUpdateCommand.execute(sqlSession, model);
		return "redirect:goboard_knowhowView.limyeng";
	}
	
	
	// 댓글 작성 기능 구현
	

}
	
	

