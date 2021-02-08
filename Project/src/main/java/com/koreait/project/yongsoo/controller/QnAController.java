package com.koreait.project.yongsoo.controller;

import java.nio.channels.FileChannel.MapMode;

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

import com.koreait.project.yongsoo.command.qna.DeleteQnACommand;
import com.koreait.project.yongsoo.command.qna.GetQnAListCommand;
import com.koreait.project.yongsoo.command.qna.GoQnAUpdatePageCommand;
import com.koreait.project.yongsoo.command.qna.GoQnAViewPageCommand;
import com.koreait.project.yongsoo.command.qna.UpdateQnACommand;
import com.koreait.project.yongsoo.command.qna.WriteQnACommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class QnAController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	// 헤더의 질의응답 버튼을 클릭했을때 질문 리스트를 보여주기위한 메소드
	@RequestMapping(value="goQnAPage.plitche", method=RequestMethod.GET)
	public String goQnAPage(Model model) {
		GetQnAListCommand getQnAListCommand = ctx.getBean("getQnAListCommand", GetQnAListCommand.class);
		getQnAListCommand.execute(sqlSession, model);
		return "yongPage/QnAPage/totalQnAPage";
	}
	
	// 질문 작성하기 클릭시 단순이동
	@RequestMapping(value="goWriteQnAPage.plitche", method=RequestMethod.GET)
	public String goWriteQnAPage() {
		return "yongPage/QnAPage/writeQnAPage";
	}

	// 질문 작성 완료 클릭시 작동할 redirect 메소드
	@RequestMapping(value="writeQnA.plitche", method=RequestMethod.POST)
	public String WriteQnA(HttpServletRequest request, 
						   RedirectAttributes rttr,
						   Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		WriteQnACommand writeQnACommand = ctx.getBean("writeQnACommand", WriteQnACommand.class);
		writeQnACommand.execute(sqlSession, model);
		return "redirect:goQnAPage.plitche";
	}
	
	// 질문 리스트에서 제목 클릭시 view페이지로 이동하기 위한 메소드
	@RequestMapping(value="goQnAViewPage.plitche", method=RequestMethod.GET)
	public String qnaView(@RequestParam int board_qna_no, Model model) {
		model.addAttribute("board_qna_no", board_qna_no);
		GoQnAViewPageCommand goQnAViewPageCommand = ctx.getBean("goQnAViewPageCommand", GoQnAViewPageCommand.class);
		goQnAViewPageCommand.execute(sqlSession, model);
		return "yongPage/QnAPage/qnaViewPage";
	}
	
	// 질문 view페이지에서 수정하기 클릭 시 update 페이지로 이동하기 위한 메소드
	@RequestMapping(value="goUpdateQnAPage.plitche", method=RequestMethod.GET)
	public String goUpdateQnAPage(@RequestParam int board_qna_no, Model model) {
		model.addAttribute("board_qna_no", board_qna_no);
		// 어짜피 같은 역하을 하는 command, dao, query문이기 때문에 재활용 가능
		GoQnAViewPageCommand goQnAViewPageCommand = ctx.getBean("goQnAViewPageCommand", GoQnAViewPageCommand.class);
		goQnAViewPageCommand.execute(sqlSession, model);
		return "yongPage/QnAPage/qnaUpdatePage";
	}
	
	// 질문 view페이지에서 수정하기 클릭 시 delete해주기 위한 메소드
	@RequestMapping(value="deleteQnA.plitche")
	public String goDeleteQnA(@RequestParam int board_qna_no, RedirectAttributes rttr, Model model) {
		model.addAttribute("board_qna_no", board_qna_no);
		model.addAttribute("rttr", rttr);
		DeleteQnACommand deleteQnACommand = ctx.getBean("deleteQnACommand", DeleteQnACommand.class);
		deleteQnACommand.execute(sqlSession, model);
		return "redirect:goQnAPage.plitche";
	}
	
	// 질문 update페이지에서 수정완료 클릭 시 update해주기 위한 메소드
	@RequestMapping(value="updateQnA.plitche", method=RequestMethod.POST)
	public String updateQnA(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		UpdateQnACommand updateQnACommand = ctx.getBean("updateQnACommand", UpdateQnACommand.class);
		updateQnACommand.execute(sqlSession, model);
		int board_qna_no = Integer.parseInt(request.getParameter("board_qna_no"));
		return "redirect:goQnAViewPage.plitche?board_qna_no="+board_qna_no;
	}
	
}
