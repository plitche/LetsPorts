package com.koreait.project.hyejoon.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.command.signUp.NickCheckCommand;
import com.koreait.project.hyejoon.command.userAccount.DeleteAccountCommand;
import com.koreait.project.hyejoon.command.userAccount.UpdateAccountCommand;
import com.koreait.project.hyejoon.config.HyeAppContext;

@Controller
public class MyPageController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(HyeAppContext.class);
	private NickCheckCommand nickCheckCommand = ctx.getBean("nickCheckCommand", NickCheckCommand.class);
	private UpdateAccountCommand updateAccountCommand = ctx.getBean("updateAccountCommand", UpdateAccountCommand.class);
	private DeleteAccountCommand deleteAccountCommand = ctx.getBean("deleteAccountCommand", DeleteAccountCommand.class);
	
	/***** 단순 이동 *****/
	// header페이지에서 '마이페이지' 버튼 클릭시 마이 페이지로 이동한다.
	@RequestMapping(value="myPage_commonPart.hey")
	public String myPage() {
		return "hyePages/myPage_commonPart";
	}
	
	// 정보수정 페이지 이동용
	@RequestMapping(value="usersInfoUpdatePage.hey")
	public String usersInfoUpdatePage() {
		return "hyePages/usersInfoUpdatePage";
	}
	
	
	/***** 정보 전달 *****/
	// 회원 정보 보여주기
	
	
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
	@RequestMapping(value="deleteAccount.hey", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	public Map<String, Object> deleteAccount(@RequestBody UsersDto usersDto, Model model) {
		model.addAttribute("email", usersDto.getEmail());
		System.out.println("getEmail: " + usersDto.getEmail());
		return deleteAccountCommand.execute(sqlSession, model);
	}
}
