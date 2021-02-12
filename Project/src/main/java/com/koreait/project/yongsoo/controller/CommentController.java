package com.koreait.project.yongsoo.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.command.meetingComment.AddCommentCommand;
import com.koreait.project.yongsoo.command.meetingComment.DeleteCommentCommand;
import com.koreait.project.yongsoo.command.meetingComment.GetCommentListCommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class CommentController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	// 모임 View페이지로 이동 시 자동으로 해당 모임 게시글에 달린 뎃글 list를 가져오기위한 메소드
	@RequestMapping(value="getCommentList.plitche/{meeting_no}/commentPageNo/{commentPageNo}", method=RequestMethod.GET, 
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getCommentList(@PathVariable("meeting_no") int meeting_no, 
											  @PathVariable("commentPageNo") int commentPageNo,
											  Model model) {
		model.addAttribute("meeting_no", meeting_no);
		model.addAttribute("commentPageNo", commentPageNo);
		GetCommentListCommand getCommentListCommand = ctx.getBean("getCommentListCommand", GetCommentListCommand.class);
		return getCommentListCommand.execute(sqlSession, model);
	}
	
	// 모임 뎃글 작성 완료 버튼 클릭시 작동할 메소드
	@RequestMapping(value="addComment.plitche", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> addComment(@RequestBody CommentsDto commentsDto, Model model) {
		model.addAttribute("commentsDto", commentsDto);
		AddCommentCommand addCommentCommand = ctx.getBean("addCommentCommand", AddCommentCommand.class);
		return addCommentCommand.execute(sqlSession, model);
	}
	
	// 모임 뎃글 삭제 시 작동할 메소드
	@RequestMapping(value="deleteComment.plitche/{comment_no}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")		
	@ResponseBody
	public Map<String, Object> deleteComment(@PathVariable("comment_no") int comment_no, Model model) {
		model.addAttribute("comment_no", comment_no);
		DeleteCommentCommand deleteCommentCommand = ctx.getBean("deleteCommentCommand", DeleteCommentCommand.class);
		return deleteCommentCommand.execute(sqlSession, model);
	}
	
}

