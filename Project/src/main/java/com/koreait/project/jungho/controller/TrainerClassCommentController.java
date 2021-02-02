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
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.dto.CommentsDto;
import com.koreait.project.jungho.command.TrainerClassCommentCommand.CommentInsertCommand;
import com.koreait.project.jungho.command.TrainerClassCommentCommand.CommentListCommand;
import com.koreait.project.jungho.config.JungAppContext;

@Controller
public class TrainerClassCommentController {
	
	@Autowired
	private SqlSession sqlSession;
	AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(JungAppContext.class);
	
	// List 뿌려주는 역할
	@RequestMapping(value="comment/{meeting_no}",
									method=RequestMethod.GET,
									produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> commentList(@PathVariable("meeting_no") int meeting_no, Model model) {
		model.addAttribute("meeting_no", meeting_no);
		CommentListCommand commentListCommand = ctx.getBean("commentListCommand", CommentListCommand.class);
		return commentListCommand.execute(sqlSession, model);
	}
	
	// Insert 하는 역할
	@RequestMapping(value="commentInsert",
									method=RequestMethod.POST,
									produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> commentInsert(@RequestBody CommentsDto commentsDto, Model model) {
		model.addAttribute("commentsDto", commentsDto);
		CommentInsertCommand commentInsertCommand = ctx.getBean("commentInsertCommand", CommentInsertCommand.class);
		return commentInsertCommand.execute(sqlSession, model);
	}
	

}
