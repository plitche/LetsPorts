package com.koreait.project.jungho.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.dto.CommentsDto;
import com.koreait.project.jungho.command.TrainerClassCommentCommand.CommentDeleteCommand;
import com.koreait.project.jungho.command.TrainerClassCommentCommand.CommentInsertCommand;
import com.koreait.project.jungho.command.TrainerClassCommentCommand.CommentListCommand;
import com.koreait.project.jungho.command.TrainerClassCommentCommand.CommentUpdateCommand;
import com.koreait.project.jungho.config.JungAppContext;
import com.koreait.project.jungho.config.commentAppContext;

@Controller
public class TrainerClassCommentController {
	
	@Autowired
	private SqlSession sqlSession;
	AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(commentAppContext.class);
	
	// List 뿌려주는 역할
	@RequestMapping(value="comment.leo",
									method=RequestMethod.GET,
									produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> commentList(@RequestParam("meeting_no") int meeting_no,
																		  @RequestParam("commentPage") int commentPage,
																		  Model model) {
		model.addAttribute("meeting_no", meeting_no); 			// command에 meeting_no을 보낸다
		model.addAttribute("commentPage", commentPage); // command에 commentPage를 보낸다.
		CommentListCommand commentListCommand = ctx.getBean("commentListCommand", CommentListCommand.class);
		return commentListCommand.execute(sqlSession, model);
	}
	
	// Insert 하는 역할
	@RequestMapping(value="commentInsert.leo",
									method=RequestMethod.POST,
									produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> commentInsert(@RequestBody CommentsDto commentsDto, Model model) {
		model.addAttribute("commentsDto", commentsDto);
		CommentInsertCommand commentInsertCommand = ctx.getBean("commentInsertCommand", CommentInsertCommand.class);
		return commentInsertCommand.execute(sqlSession, model);
	}
	
	// delete 하는 역할
	
	@RequestMapping(value="commentDelete.leo/{comment_no}",
								method=RequestMethod.GET,
								produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> commentDelete(@PathVariable("comment_no") int comment_no, Model model) {
		model.addAttribute("comment_no", comment_no);
		CommentDeleteCommand commentDeleteCommand = ctx.getBean("commentDeleteCommand", CommentDeleteCommand.class);
		return commentDeleteCommand.execute(sqlSession, model);
	}

	
	// update 하는 역할
	@RequestMapping(value="commentUpdate.leo",
								method=RequestMethod.POST,
								produces="application/json; charset=utf-8")		
	@ResponseBody
	public Map<String, Object> commentUpdate(@RequestBody CommentsDto commentsDto, Model model) {
		model.addAttribute("commentsDto", commentsDto);
		CommentUpdateCommand commentUpdateCommand = ctx.getBean("commentUpdateCommand", CommentUpdateCommand.class);
		return commentUpdateCommand.execute(sqlSession, model);
	}
	

}

