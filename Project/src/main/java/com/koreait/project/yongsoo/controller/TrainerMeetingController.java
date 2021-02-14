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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.dto.MeetingDto;
import com.koreait.project.dto.ScrapDto;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassDeleteCommand;
import com.koreait.project.jungho.config.JungAppContext;
import com.koreait.project.yongsoo.command.Scrap.InsertScrapCommand;
import com.koreait.project.yongsoo.command.Scrap.IsInWishListCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.CreateMeetingCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetOtherHostMeetingCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetOtherMeetingCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetTrainerMeetingListCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GoMeetingViewCommand;
import com.koreait.project.yongsoo.config.SooAppContext;
import com.koreait.project.yongsoo.dto.MeetingTemDto;

@Controller
public class TrainerMeetingController {

	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	private AbstractApplicationContext ctx2 = new AnnotationConfigApplicationContext(JungAppContext.class);
	
	// 트레이너 디테일 페이지에서 트레이너 모임 리스트를 불러오기 위한 메소드
	@RequestMapping(value="getTrainerMeetingList.plitche/{user_no}/meetingPageNo/{meetingPageNo}", method=RequestMethod.GET, 
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getTrainerMeetingList(@PathVariable("user_no") int user_no,
													 @PathVariable("meetingPageNo") int meetingPageNo,
													 Model model) {
		model.addAttribute("user_no", user_no);
		model.addAttribute("meetingPageNo", meetingPageNo);
		GetTrainerMeetingListCommand getTrainerMeetingListCommand = ctx.getBean("getTrainerMeetingListCommand", GetTrainerMeetingListCommand.class);
		return getTrainerMeetingListCommand.execute(sqlSession, model);
	}

	// 모임 클릭시 모임 상세 페이지로 이동할 메소드
	@RequestMapping(value="meetingViewPage.plitche", method=RequestMethod.GET)
	public String meetingViewPage(@RequestParam("meeting_no") int meeting_no, Model model) {
		model.addAttribute("meeting_no", meeting_no);
		GoMeetingViewCommand goMeetingViewCommand = ctx.getBean("goMeetingViewCommand", GoMeetingViewCommand.class);
		goMeetingViewCommand.execute(sqlSession, model);
		return "yongPage/meetingViewPage";
	}
	
	// 모임 상세 페이지로 이동 시 현재 로그인 되어있는 사람이 스크랩 한 모임인지 판단하기 위한 메소드
	@RequestMapping(value="isInWishList.plitche/{user_no}/meeting_no/{meeting_no}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> isInWishList(@PathVariable("user_no") int user_no,
											@PathVariable("meeting_no") int meeting_no,
											Model model) {
		model.addAttribute("user_no", user_no);
		model.addAttribute("meeting_no", meeting_no);
		IsInWishListCommand isInWishListCommand = ctx.getBean("isInWishListCommand", IsInWishListCommand.class);
		return isInWishListCommand.execute(sqlSession, model); 
	}
	
	// 관심 모임으로 등록하기 버튼 클릭시 insert 해주기위한 메소드
	@RequestMapping(value="addToWishList.plitche", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> addToWishList(@RequestBody ScrapDto scrapDto, Model model) {
		model.addAttribute("scrapDto", scrapDto);
		InsertScrapCommand insertScrapCommand = ctx.getBean("insertScrapCommand", InsertScrapCommand.class);
		return insertScrapCommand.execute(sqlSession, model);
	}
	
	// 트레이너 프로그램 등록 - 미팅(모임) 게시글 작성 페이지로 단순이동을 위한 메소드
	@RequestMapping(value="goCreateMeetingPage.plitche")
	public String goCreateMeetingPage() {
		return "yongPage/createMeetingPage";
	}
	
	// 모임 작성 후 작성완료 버튼 클릭시 작동할 메소드
	@RequestMapping(value="createMeeting.plitche", method=RequestMethod.POST)
	public String createNewMeeting(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		CreateMeetingCommand createMeetingCommand = ctx.getBean("createMeetingCommand", CreateMeetingCommand.class);
		int user_no = createMeetingCommand.execute(sqlSession, model);
		return "redirect:goTrainerDetail.plitche?user_no=" + user_no;
	}

	// 모임 View페이지에서 삭제하기 버튼 클릭 시 작동할 메소드
	@RequestMapping(value="TrainerClassDelete.plitche", method=RequestMethod.POST)
	public String TrainerClassViewDelete(@RequestParam("meeting_no") int meeting_no,
										 @RequestParam("user_no") int user_no,
										 Model model) {
		model.addAttribute("meeting_no", meeting_no);
		TrainerClassDeleteCommand trainerClassDeletCommand = ctx2.getBean("trainerClassDeleteCommand", TrainerClassDeleteCommand.class);
		trainerClassDeletCommand.execute(sqlSession, model);
		return "redirect:goTrainerDetail.plitche?user_no="+user_no;
	}
	
	// 트레이너 모임 View페이지로 이동 시 호스트의 다른 모임 정보를 불러오기 위한 메소드
	@RequestMapping(value="getOtherMeeting.plitche", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getOtherMeeting(@RequestBody MeetingDto meetingDto, Model model) {
		model.addAttribute("meetingDto", meetingDto);
		GetOtherMeetingCommand getOtherMeetingCommand = ctx.getBean("getOtherMeetingCommand", GetOtherMeetingCommand.class);
		return getOtherMeetingCommand.execute(sqlSession, model);
	}
	
	// 트레이너 모임 View페이지로 이동 시 다른 호스트의 같은 운동 모임정보를 불러오기 위한 메소드
	@RequestMapping(value="getOtherHostMeeting.plitche", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getOtherHostMeeting(@RequestBody MeetingTemDto meetingTemDto, Model model) {
		model.addAttribute("meetingTemDto", meetingTemDto);
		GetOtherHostMeetingCommand getOtherHostMeetingCommand = ctx.getBean("getOtherHostMeetingCommand", GetOtherHostMeetingCommand.class);
		return getOtherHostMeetingCommand.execute(sqlSession, model);
	}
	
	
	
	
	
}
