package com.koreait.project.hyejoon.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class MyPageController {
	
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	
	/***** 단순 이동 *****/
	// header페이지에서 '마이페이지' 버튼 클릭시 마이 페이지로 이동한다.
	// 기본은 모임 탭으로 함
	@RequestMapping(value="myPage_meeting.hey")
	public String usersMyPageMeeting() {
		return "hyePages/myPage_meeting";
	}
	
	// 마이페이지 안에 있는 탭 중 '게시물'로 이동
	@RequestMapping(value="myPage_posted.hey")
	public String usersMyPagePosted() {
		return "hyePages/myPage_posted";
	}
	// 마이페이지 안에 있는 탭 중 '리뷰관리'로 이동
	@RequestMapping(value="myPage_review.hey")
	public String usersMyPageReview() {
		return "hyePages/myPage_review";
	}
	// 마이페이지 안에 있는 탭 중 '질의응답'으로 이동
	@RequestMapping(value="myPage_qna.hey")
	public String usersMyPageQna() {
		return "hyePages/myPage_qna";
	}
	
	
	/***** 정보 전달 *****/
	
	
}
