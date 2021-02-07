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

import com.koreait.project.dto.ReviewDto;
import com.koreait.project.yongsoo.command.trainerReview.FindJoinMeetingListCommand;
import com.koreait.project.yongsoo.command.trainerReview.GetAllReviewContentCommand;
import com.koreait.project.yongsoo.command.trainerReview.GetTrainerReviewListCommand;
import com.koreait.project.yongsoo.command.trainerReview.ShortReviewContentCommand;
import com.koreait.project.yongsoo.command.trainerReview.WriteReviewCommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class TrainerReviewController {

	@Autowired
	SqlSession sqlSession;
	AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	// 현재 보고있는 트레이너 디테일 페이지의 트레이너를 대상으로 작성된 리뷰 정보를 가져오는 메소드
	@RequestMapping(value="getTrainerReviewList.plitche/{user_no}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getTrainerReviewList(@PathVariable("user_no") int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		GetTrainerReviewListCommand getTrainerReviewListCommand = ctx.getBean("getTrainerReviewListCommand", GetTrainerReviewListCommand.class);
		return getTrainerReviewListCommand.execute(sqlSession, model);
	}
	
	// 현재 보고있는 트레이너 디테일 페이지의 트레이너와 로그인된 유져의 함께한 모임 정보를 가져오는 메소드
	@RequestMapping(value="findJoinMeetingList.plitche", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> findJoinMeetingList(@RequestBody ReviewDto reviewDto, Model model) {
		model.addAttribute("reviewDto", reviewDto);
		FindJoinMeetingListCommand findJoinMeetingListCommand = ctx.getBean("findJoinMeetingListCommand", FindJoinMeetingListCommand.class);
		return findJoinMeetingListCommand.execute(sqlSession, model);
	}
	
	// 리뷰 작성완료를 누르면 작동할 메소드
	@RequestMapping(value="writeReview.plitche", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> writeReview(@RequestBody ReviewDto reviewDto, Model model) {
		model.addAttribute("reviewDto", reviewDto);
		WriteReviewCommand writeReviewCommand = ctx.getBean("writeReviewCommand",  WriteReviewCommand.class);
		return writeReviewCommand.execute(sqlSession, model);
	}
	
	// 리뷰 내용 축약되어있을 때 내용 클릭시 모든 내용이 보이게 하기 위한 메소드
	@RequestMapping(value="showAllReviewContent.plitche/{review_no}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> showAllReviewContent(@PathVariable("review_no") int review_no, Model model) {
		model.addAttribute("review_no", review_no);
		GetAllReviewContentCommand getAllReviewContentCommand = ctx.getBean("getAllReviewContentCommand", GetAllReviewContentCommand.class);
		return getAllReviewContentCommand.execute(sqlSession, model);
	}
	
	// 리뷰 내용이 전체 다 표시될 때 내용 클릭시 다시 축약하여 보이게 하기위한 메소드
	@RequestMapping(value="shortReviewContent.plitche/{review_no}", method=RequestMethod.GET,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> shortReviewContent(@PathVariable("review_no") int review_no, Model model) {
	model.addAttribute("review_no", review_no);
	ShortReviewContentCommand shortReviewContentCommand = ctx.getBean("shortReviewContentCommand", ShortReviewContentCommand.class);
	return shortReviewContentCommand.execute(sqlSession, model);
	}
	
}
