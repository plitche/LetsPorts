package com.koreait.project.yongsoo.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.command.qna.AddQnACommnetCommand;
import com.koreait.project.yongsoo.command.qna.DeleteQnACommand;
import com.koreait.project.yongsoo.command.qna.DeleteQnACommentCommand;
import com.koreait.project.yongsoo.command.qna.GetQnACommentCommand;
import com.koreait.project.yongsoo.command.qna.GetQnAListCommand;
import com.koreait.project.yongsoo.command.qna.GoQnAViewPageCommand;
import com.koreait.project.yongsoo.command.qna.GoUpdateQnAPageCommand;
import com.koreait.project.yongsoo.command.qna.SolveQnACommend;
import com.koreait.project.yongsoo.command.qna.UpdateQnACommand;
import com.koreait.project.yongsoo.command.qna.UpdateQnACommentContentCommand;
import com.koreait.project.yongsoo.command.qna.WriteQnACommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class QnAController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	// 헤더의 질의응답 버튼을 클릭했을때 질문 리스트를 보여주기위한 메소드
	// 검색어 관련된 내용 처리를 위한 메소드
	// 필터링 선택 하였을 때 작동할 메소드
	@RequestMapping(value="goQnAPage.plitche", method=RequestMethod.GET)
	public String goQnAPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
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
	public String qnaView(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		GoQnAViewPageCommand goQnAViewPageCommand = ctx.getBean("goQnAViewPageCommand", GoQnAViewPageCommand.class);
		goQnAViewPageCommand.execute(sqlSession, model);
		return "yongPage/QnAPage/qnaViewPage";
	}
	
	// 질문 view페이지에서 수정하기 클릭 시 update 페이지로 이동하기 위한 메소드
	@RequestMapping(value="goUpdateQnAPage.plitche", method=RequestMethod.GET)
	public String goUpdateQnAPage(@ModelAttribute("board_qna_no") int board_qna_no, Model model) {
		model.addAttribute("board_qna_no", board_qna_no);
		GoUpdateQnAPageCommand goUpdateQnAPageCommand = ctx.getBean("goUpdateQnAPageCommand", GoUpdateQnAPageCommand.class);
		goUpdateQnAPageCommand.execute(sqlSession, model);
		return "yongPage/QnAPage/qnaUpdatePage";
	}
	
	// 질문 view페이지에서 삭제하기 클릭 시 delete해주기 위한 메소드
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
	
	// 질문 view 페이지에서 해결 완료 클릭시 데이터에 접근하기 위한 메소드
	@RequestMapping(value="solveQnA.plitche/{board_qna_no}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> solveQnA(@PathVariable("board_qna_no") int board_qna_no, Model model) {
		model.addAttribute("board_qna_no", board_qna_no);
		SolveQnACommend solveQnACommend = ctx.getBean("solveQnACommend", SolveQnACommend.class);
		return solveQnACommend.execute(sqlSession, model);
	}
	
	// 특정 질문에 작성된 뎃글 list를 가져오기 위한 메소드
	@RequestMapping(value="getQnACommentList.plitche/{qnaNo}/commentPageNo/{commentPageNo}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getQnACommentList(@PathVariable("qnaNo") int qnaNo,
												 @PathVariable("commentPageNo") int commentPageNo,
												 Model model) {
		model.addAttribute("qnaNo", qnaNo);
		model.addAttribute("commentPageNo", commentPageNo);
		GetQnACommentCommand getQnACommentCommand = ctx.getBean("getQnACommentCommand", GetQnACommentCommand.class);
		return getQnACommentCommand.execute(sqlSession, model);
	}
	
	// 특정 질문에 댓글 작성완료 버튼 클릭시 insert를 해주기 위한 메소드
	@RequestMapping(value="addQnAComment.plitche", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> addQnAComment(@RequestBody CommentsDto commentsDto, Model model) {
		model.addAttribute("commentsDto", commentsDto);
		AddQnACommnetCommand addQnACommnetCommand = ctx.getBean("addQnACommnetCommand", AddQnACommnetCommand.class);
		return addQnACommnetCommand.execute(sqlSession, model);
	}
	
	// 댓글 수정 완료 클릭 시 update해주기 위한 메소드
	@RequestMapping(value="updateQnAComment.plitche", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> updateQnAComment(@RequestBody CommentsDto commentsDto, Model model) {
		model.addAttribute("commentsDto", commentsDto);
		UpdateQnACommentContentCommand updateQnACommentContentCommand = ctx.getBean("updateQnACommentContentCommand", UpdateQnACommentContentCommand.class);
		return updateQnACommentContentCommand.execute(sqlSession, model);
	}
	
	// 댓글 삭제버튼 클릭 시 delete해주기 위한 메소드
	@RequestMapping(value="deleteQnAComment.plitche/{qnaComment_no}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> deleteQnACommnet(@PathVariable("qnaComment_no") int qnaComment_no, Model model) {
		model.addAttribute("qnaComment_no", qnaComment_no);
		DeleteQnACommentCommand deleteQnACommentCommand = ctx.getBean("deleteQnACommentCommand", DeleteQnACommentCommand.class);
		return deleteQnACommentCommand.execute(sqlSession, model);
	}
	
	
	
	
	
	
	
	
}
