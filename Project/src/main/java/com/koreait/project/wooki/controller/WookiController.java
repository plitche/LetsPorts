package com.koreait.project.wooki.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.wooki.command.AdminLoginCommand;
import com.koreait.project.wooki.command.UserListCommand;
import com.koreait.project.wooki.config.WookiAppContext;
import com.koreait.project.wooki.dto.UsersDto;

@Controller
public class WookiController {
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(WookiAppContext.class);
	private AdminLoginCommand adminLoginCommand = ctx.getBean("adminLoginCommand", AdminLoginCommand.class);
	private UserListCommand userListCommand = ctx.getBean("userListCommand", UserListCommand.class);
	
	@GetMapping(value="adminPage.wooki")
	public String adminPage() {
		return "wookiPages/adminLogin";
	}
	
	@PostMapping(value="adminLogin.wooki")
	public String adminLogin(UsersDto usersDto, HttpServletRequest request, RedirectAttributes redirect, Model model) {
		model.addAttribute("redirect", redirect);
		model.addAttribute("request", request);
		model.addAttribute("usersDto", usersDto);
		adminLoginCommand.execute(sqlSession, model);
		return "redirect:adminPage.wooki";
	}
	
	@GetMapping(value="adminLogout.wooki")
	public String adminLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:adminPage.wooki";
	}
	
	@GetMapping(value="adminIndex.wooki")
	public String adminIndex() {
		return "wookiPages/adminIndex";
	}
	
	@GetMapping(value="userList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> userList(@RequestParam("page") int page, Model model) {
		model.addAttribute("page", page);
		return userListCommand.execute(sqlSession, model);
	}
}
