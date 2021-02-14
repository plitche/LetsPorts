package com.koreait.project.hyejoon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.command.myPage.DeletePhotoCommand;
import com.koreait.project.hyejoon.command.myPage.UpdateMsgCommand;
import com.koreait.project.hyejoon.command.myPage.UploadProfilePhotoCommand;
import com.koreait.project.hyejoon.command.myPage.ViewMeetingInfoCommand;
import com.koreait.project.hyejoon.command.signUp.NickCheckCommand;
import com.koreait.project.hyejoon.command.userAccount.DeleteAccountCommand;
import com.koreait.project.hyejoon.command.userAccount.UpdateAccountCommand;
import com.koreait.project.hyejoon.command.userAccount.UserUpdateViewCommand;
import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class MyPageController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	private NickCheckCommand nickCheckCommand = ctx.getBean("nickCheckCommand", NickCheckCommand.class);
	private UserUpdateViewCommand userUpdateViewCommand = ctx.getBean("userUpdateViewCommand", UserUpdateViewCommand.class);
	private UpdateAccountCommand updateAccountCommand = ctx.getBean("updateAccountCommand", UpdateAccountCommand.class);
	private DeleteAccountCommand deleteAccountCommand = ctx.getBean("deleteAccountCommand", DeleteAccountCommand.class);
	private UploadProfilePhotoCommand uploadProfilePhotoCommand = ctx.getBean("uploadProfilePhotoCommand", UploadProfilePhotoCommand.class);
	private DeletePhotoCommand deletePhotoCommand = ctx.getBean("deletePhotoCommand", DeletePhotoCommand.class);
	private UpdateMsgCommand updateMsgCommand = ctx.getBean("updateMsgCommand", UpdateMsgCommand.class);
	private ViewMeetingInfoCommand viewMeetingInfoCommand = ctx.getBean("viewMeetingInfoCommand", ViewMeetingInfoCommand.class);
	
	
	/***** 단순 이동 *****/
	// header페이지에서 '마이페이지' 버튼 클릭시 마이 페이지로 이동한다.
	@RequestMapping(value="myPage_commonPart.hey")
	public String myPage() {
		return "hyePages/myPage_commonPart";
	}
	
	// 트레이너 회원가입 페이지
	@RequestMapping(value="trainerSignUp.hey")
	public String trainerSignUp() {
		return "hyePages/trainerSignUp";
	}
	
	
	
	/***** 정보 전달 *****/
	// 파일 업로드
	@RequestMapping(value="uploadPhoto.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> uploadPhoto(MultipartHttpServletRequest multipartRequest, Model model){
		model.addAttribute("multipartRequest", multipartRequest);
		return uploadProfilePhotoCommand.execute(sqlSession, model);
	}

	// 파일 삭제
	@PutMapping(value="deletePhoto/{user_no}/{filename}.hey", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> deletePhoto(
			@PathVariable("user_no") int user_no,
			@PathVariable("filename") String filename,
			HttpServletRequest request,
			Model model){
		model.addAttribute("request", request);
		model.addAttribute("filename", filename);
		model.addAttribute("user_no", user_no);
		return deletePhotoCommand.execute(sqlSession, model);
	}
	
	// 상태메세지 수정
	@RequestMapping(value="updateMsg.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> updateMsg(@RequestBody UsersDto usersDto, Model model){
		model.addAttribute("user_no", usersDto.getUser_no());
		model.addAttribute("user_message", usersDto.getUser_message());
		return updateMsgCommand.execute(sqlSession, model);
	}
	
	
	// 회원 정보 보여주기
	@RequestMapping(value="userUpdateView.hey", method=RequestMethod.GET)
	public String userUpdateView(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		userUpdateViewCommand.execute(sqlSession, model);
		return "hyePages/usersInfoUpdatePage";
		
	}
	
	// 닉네임 중복 체크
	// 회원정보에서 사용한 것 재활용
	@RequestMapping(value="updateNickCheck.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> updateNickCheck(@RequestBody UsersDto usersDto, Model model){
		model.addAttribute("user_nickname", usersDto.getUser_nickname());
		return nickCheckCommand.execute(sqlSession, model);
	}
	
	// 회원 정보 수정하기
	@RequestMapping(value="updateAccount.hey", method=RequestMethod.POST)
	public String updateAccount(HttpServletRequest request, Model model, RedirectAttributes redirect) {
		model.addAttribute("request", request);
		model.addAttribute("redirect", redirect);
		updateAccountCommand.execute(sqlSession, model);
		return "redirect:myPage_commonPart.hey";
	}
	
	// 회원 탈퇴하기
	@ResponseBody
	@RequestMapping(value="deleteAccount.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	public Map<String, Object> deleteAccount(@RequestBody UsersDto usersDto, Model model) {
		model.addAttribute("user_no", usersDto.getUser_no());
		System.out.println("user_no: " + usersDto.getUser_no());
		return deleteAccountCommand.execute(sqlSession, model);
	}
	
	/**** 탭 ****/
	// 내가 주최하는 모임 정보 가져오기
	@RequestMapping(value="meetingInfo.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> meetingInfo(@RequestBody UsersDto usersDto, Model model){
		model.addAttribute("user_no", usersDto.getUser_no());
		return viewMeetingInfoCommand.execute(sqlSession, model);
	}
	
	// 질의응답
	
	
}
