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
import com.koreait.project.yongsoo.command.comment.AddCommentCommand;
import com.koreait.project.yongsoo.command.comment.GetCommentListCommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class CommentController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	@RequestMapping(value="getCommentList.plitche/{meeting_no}", method=RequestMethod.GET, 
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getCommentList(@PathVariable("meeting_no") int meeting_no, Model model) {
		model.addAttribute("meeting_no", meeting_no);
		GetCommentListCommand getCommentListCommand = ctx.getBean("getCommentListCommand", GetCommentListCommand.class);
		return getCommentListCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="addComment.plitche", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> addComment(@RequestBody CommentsDto commentsDto, Model model) {
		model.addAttribute("commentsDto", commentsDto);
		AddCommentCommand addCommentCommand = ctx.getBean("addCommentCommand", AddCommentCommand.class);
		return addCommentCommand.execute(sqlSession, model);
	}
	
}

