package com.koreait.project.yongsoo.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.yongsoo.command.trainerReview.GetTrainerReviewListCommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class TrainerReviewController {

	@Autowired
	SqlSession sqlSession;
	AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	@RequestMapping(value="getReviewList.plitche/{user_no}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getTrainerReviewList(@PathVariable("user_no") int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		GetTrainerReviewListCommand getTrainerReviewListCommand = ctx.getBean("getTrainerReviewListCommand", GetTrainerReviewListCommand.class);
		return getTrainerReviewListCommand.execute(sqlSession, model);
	}
	
	
}
