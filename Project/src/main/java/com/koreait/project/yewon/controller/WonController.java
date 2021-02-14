package com.koreait.project.yewon.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.yewon.command.GoknowHowDeleteCommand;
import com.koreait.project.yewon.command.GoKnowHowInsertCommand;
import com.koreait.project.yewon.command.GoKnowHowListCommand;
import com.koreait.project.yewon.command.GoknowHowUpdateCommand;
import com.koreait.project.yewon.command.GoknowHowUpdatePageCommand;
import com.koreait.project.yewon.command.GoknowHowViewCommand;
import com.koreait.project.yewon.config.WonAppContext;

@Controller
public class WonController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(WonAppContext.class);

	
	// header 페이지에서 '노하우게시판' 클릭시 list 페이지로 이동
	@RequestMapping(value = "GoBoard_KnowHowList.limyeng")
	public String goknowhowList(Model model) {
		GoKnowHowListCommand goKnowHowListCommand = ctx.getBean("goKnowHowListCommand", GoKnowHowListCommand.class);
		goKnowHowListCommand.execute(sqlSession, model);
		return "wonPages/board_knowhow/board_KnowHowListPage";
	}
	
	@RequestMapping(value="goBoard_KnowHowInsertPage.limyeng")
	public String goBoardKnowhowInsertPage(Model model) {
		
		return "wonPages/board_knowhow/board_knowHowInsertPage";
	}
	
	@RequestMapping(value = "Board_KnowHowInsertPage.limyeng", method=RequestMethod.GET)
	public String BoardKnowHowViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		GoKnowHowInsertCommand goKnowHowInsertCommand = ctx.getBean("goknowHowInsertCommand", GoKnowHowInsertCommand.class);
		goKnowHowInsertCommand.execute(sqlSession, model);
		return "redirect:GoBoard_KnowHowList.limyeng";
	}
	
	// 목록으로 돌아가기 버튼을 클릭했을때 list 페이지로 이동
	/*
	@RequestMapping(value = "board_knowHowList.limyeng")
	public String boardknowHowListPage(Model model) {
		return "wonPages/board_knowhow/board_knowHowListPage";	
	}
	*/
	
	// listPage에서 게시글 클릭하면 viewPage로 이동
	@RequestMapping(value = "Board_KnowHowViewPage.limyeng", method=RequestMethod.GET)
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
		GoknowHowUpdatePageCommand goknowHowUpdatePageCommand = ctx.getBean("goknowHowUpdatePageCommand", GoknowHowUpdatePageCommand.class);
		goknowHowUpdatePageCommand.execute(sqlSession, model);
		return "wonPages/board_knowhow/board_knowHowUpdatePage";
	}
	
	
	
	// viewPage에서 글목록으로 돌아가기 버튼 클릭시 list페이지로 이동
	/*
	@RequestMapping(value = "board_knowHowListPage.limyeng",method=RequestMethod.GET)
		public String boardknowHowlistPage(@RequestParam("knowhow_no")int knowhow_no, Model model) {
		GoknowHowViewCommand goknowHowViewCommand = ctx.getBean("goknowHowViewCommand", GoknowHowViewCommand.class);
		model.addAttribute("knowhow_no", knowhow_no);
		return "redirect:goboard_knowhowList.limyeng";
	}
	*/
	
	// updatePage에서 수정완료 후 viewPage로 이동
	@RequestMapping(value = "board_knowHowUpdate.limyeng", method=RequestMethod.GET)
		public String boardViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		GoknowHowUpdateCommand goknowHowUpdateCommand= ctx.getBean("goknowHowUpdateCommand", GoknowHowUpdateCommand.class);
		goknowHowUpdateCommand.execute(sqlSession, model);
		int knowhow_no = goknowHowUpdateCommand.execute(sqlSession, model);
		return "redirect:Board_KnowHowViewPage.limyeng?knowhow_no=" + knowhow_no;
	}

	
	// viewPage에서 삭제버튼 누르면 버리기
	@RequestMapping(value = "board_knowHowDelete.limyeng", method=RequestMethod.GET)
	public String knowhowDelete(@RequestParam int knowhow_no, RedirectAttributes rttr , Model model) {
		model.addAttribute("knowhow_no",knowhow_no);
		model.addAttribute("rttr", rttr);
		GoknowHowDeleteCommand goknowHowDeleteCommand = ctx.getBean("goknowHowDeleteCommand", GoknowHowDeleteCommand.class);
		goknowHowDeleteCommand.execute(sqlSession, model);
		return "redirect:GoBoard_KnowHowList.limyeng";
	}

	// list페이지에서 조회수 증가

	
	
	
	
}
	
	

