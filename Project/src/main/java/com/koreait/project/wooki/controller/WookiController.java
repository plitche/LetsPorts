package com.koreait.project.wooki.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.wooki.command.AdminLoginCommand;
import com.koreait.project.wooki.command.CheckUserCommand;
import com.koreait.project.wooki.command.admin.AdminListCommand;
import com.koreait.project.wooki.command.admin.UpdateAdminUserCommand;
import com.koreait.project.wooki.command.admin.UpdateNormalUserCommand;
import com.koreait.project.wooki.command.boards.BoardDeleteCommand;
import com.koreait.project.wooki.command.boards.BoardsListCommand;
import com.koreait.project.wooki.command.boards.BoardsOnHideToggleCommand;
import com.koreait.project.wooki.command.comments.CommentDeleteCommand;
import com.koreait.project.wooki.command.comments.CommentsListCommand;
import com.koreait.project.wooki.command.comments.CommentsOnHideToggleCommand;
import com.koreait.project.wooki.command.review.ReivewListCommand;
import com.koreait.project.wooki.command.review.ReviewOnHideToggleCommand;
import com.koreait.project.wooki.command.trainer.AddTrainerSendEmailCommand;
import com.koreait.project.wooki.command.trainer.DeleteTrainerInfoCommand;
import com.koreait.project.wooki.command.trainer.FilterTrainerUserListCommand;
import com.koreait.project.wooki.command.trainer.TrainerUserListCommand;
import com.koreait.project.wooki.command.trainerQnA.TAnswerdUpdateCommand;
import com.koreait.project.wooki.command.trainerQnA.TQnAListCommand;
import com.koreait.project.wooki.command.trainerQnA.TQnAOnHideToggleCommand;
import com.koreait.project.wooki.command.users.ChangeEmailCommand;
import com.koreait.project.wooki.command.users.ChangeEmailIsPossibleCommand;
import com.koreait.project.wooki.command.users.DeleteUserCommand;
import com.koreait.project.wooki.command.users.FilterUserListCommand;
import com.koreait.project.wooki.command.users.SendTempPassCommand;
import com.koreait.project.wooki.command.users.UserListCommand;
import com.koreait.project.wooki.config.WookiAppContext;
import com.koreait.project.wooki.dto.Trainer_qnaDto;
import com.koreait.project.wooki.dto.UsersDto;

@Controller
public class WookiController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private JavaMailSender mailSender;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(WookiAppContext.class);
	private AdminLoginCommand adminLoginCommand = ctx.getBean("adminLoginCommand", AdminLoginCommand.class);
	private UserListCommand userListCommand = ctx.getBean("userListCommand", UserListCommand.class);
	private FilterUserListCommand filterUserListCommand = ctx.getBean("filterUserListCommand", FilterUserListCommand.class);
	private ChangeEmailIsPossibleCommand changeEmailIsPossibleCommand = ctx.getBean("changeEmailIsPossibleCommand", ChangeEmailIsPossibleCommand.class);
	private ChangeEmailCommand changeEmailCommand = ctx.getBean("changeEmailCommand", ChangeEmailCommand.class);
	private SendTempPassCommand sendTempPassCommand = ctx.getBean("sendTempPassCommand", SendTempPassCommand.class);
	private AdminListCommand adminListCommand = ctx.getBean("adminListCommand", AdminListCommand.class);
	private UpdateNormalUserCommand updateNormalUserCommand = ctx.getBean("updateNormalUserCommand", UpdateNormalUserCommand.class);
	private CheckUserCommand checkUserCommand = ctx.getBean("checkUserCommand", CheckUserCommand.class);
	private UpdateAdminUserCommand updateAdminUserCommand = ctx.getBean("updateAdminUserCommand", UpdateAdminUserCommand.class);
	private DeleteUserCommand deleteUserCommand = ctx.getBean("deleteUserCommand", DeleteUserCommand.class);
	private TrainerUserListCommand trainerUserListCommand = ctx.getBean("trainerUserListCommand", TrainerUserListCommand.class);
	private FilterTrainerUserListCommand filterTrainerUserListCommand = ctx.getBean("filterTrainerUserListCommand", FilterTrainerUserListCommand.class);
	private AddTrainerSendEmailCommand addTrainerSendEmailCommand = ctx.getBean("addTrainerSendEmailCommand", AddTrainerSendEmailCommand.class);
	private DeleteTrainerInfoCommand deleteTrainerInfoCommand = ctx.getBean("deleteTrainerInfoCommand", DeleteTrainerInfoCommand.class);
	private BoardsListCommand boardsListCommand = ctx.getBean("boardsListCommand", BoardsListCommand.class);
	private BoardsOnHideToggleCommand boardsOnHideToggleCommand = ctx.getBean("boardsOnHideToggleCommand", BoardsOnHideToggleCommand.class);
	private BoardDeleteCommand boardDeleteCommand = ctx.getBean("boardDeleteCommand", BoardDeleteCommand.class);
	private CommentsListCommand commentsListCommand = ctx.getBean("commentsListCommand", CommentsListCommand.class);
	private CommentsOnHideToggleCommand commentsOnHideToggleCommand = ctx.getBean("commentsOnHideToggleCommand", CommentsOnHideToggleCommand.class);
	private CommentDeleteCommand commentDeleteCommand = ctx.getBean("commentDeleteCommand", CommentDeleteCommand.class);
	private ReivewListCommand reivewListCommand = ctx.getBean("reivewListCommand", ReivewListCommand.class);
	private ReviewOnHideToggleCommand reviewOnHideToggleCommand = ctx.getBean("reviewOnHideToggleCommand", ReviewOnHideToggleCommand.class);
	private TQnAListCommand tQnAListCommand = ctx.getBean("tQnAListCommand", TQnAListCommand.class);
	private TAnswerdUpdateCommand tAnswerdUpdateCommand = ctx.getBean("tAnswerdUpdateCommand", TAnswerdUpdateCommand.class);
	private TQnAOnHideToggleCommand tQnAOnHideToggleCommand = ctx.getBean("tQnAOnHideToggleCommand", TQnAOnHideToggleCommand.class);
	
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
	
	@GetMapping(value="filterUserList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> filterUserList(
			@RequestParam("page") int page,
			HttpServletRequest request,
			Model model) {
		model.addAttribute("request", request);
		model.addAttribute("page", page);
		return filterUserListCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="changeEmailIsPossible.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> changeEmailIsPossible(@RequestParam("email") String email, Model model) {
		model.addAttribute("email", email);
		return changeEmailIsPossibleCommand.execute(sqlSession, model);
	}
	
	@PutMapping(value="changeEmail.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> changeEmail(@RequestBody UsersDto usersDto, Model model) {
		model.addAttribute(usersDto);
		return changeEmailCommand.execute(sqlSession, model);
	}
	
	@PutMapping(value="sendTempPass.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sendTempPass(@RequestBody UsersDto usersDto, Model model) {
		model.addAttribute("mailSender", mailSender);
		model.addAttribute("usersDto", usersDto);
		return sendTempPassCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="adminList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> adminList(Model model) {
		return adminListCommand.execute(sqlSession, model);
	}
	
	@PutMapping(value="updateNormalUser/{user_no}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> updateNormalUser(@PathVariable("user_no") int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		return updateNormalUserCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="checkUser.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> checkUser(@RequestParam("user_no") int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		return checkUserCommand.execute(sqlSession, model);
	}
	
	@PutMapping(value="updateAdminUser/{user_no}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> updateAdminUser(@PathVariable("user_no") int user_no, Model model) {
		model.addAttribute("user_no", user_no);
		return updateAdminUserCommand.execute(sqlSession, model);
	}
	
	@DeleteMapping(value="deleteUser/{user_no}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> deleteUser(
			@PathVariable("user_no") int user_no,
			HttpServletRequest request,
			Model model) {
		model.addAttribute("user_no", user_no);
		model.addAttribute("request", request);
		return deleteUserCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="trainerUserList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> trainerUserList(@RequestParam("page") int page, Model model) {
		model.addAttribute("page", page);
		return trainerUserListCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="filterTrainerUserList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> filterTrainerUserList(
			@RequestParam("page") int page,
			@RequestParam("search") int search,
			Model model) {
		model.addAttribute("search", search);
		model.addAttribute("page", page);
		return filterTrainerUserListCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="addTrainerSendEmail.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> addTrainerSendEmail(@RequestParam("user_no") int user_no, Model model) {
		model.addAttribute("mailSender", mailSender);
		model.addAttribute("user_no", user_no);
		return addTrainerSendEmailCommand.execute(sqlSession, model);
	}
	
	@DeleteMapping(value="deleteTrainerInfo/{user_no}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> deleteTrainerInfo(
			@PathVariable("user_no") int user_no,
			HttpServletRequest request,
			Model model) {
		model.addAttribute("user_no", user_no);
		model.addAttribute("request", request);
		return deleteTrainerInfoCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="boardsList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> boardsList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		return boardsListCommand.execute(sqlSession, model);
	}

	@PutMapping(value="boardsOnHideToggle/{board_no}/{board_sep}/{on_hide}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> boardsOnHideToggle(
			@PathVariable("board_no") int board_no,
			@PathVariable("board_sep") int board_sep,
			@PathVariable("on_hide") int on_hide,
			Model model) {
		model.addAttribute("board_no", board_no);
		model.addAttribute("board_sep", board_sep);
		model.addAttribute("on_hide", on_hide);
		return boardsOnHideToggleCommand.execute(sqlSession, model);
	}
	
	@DeleteMapping(value="boardDelete/{board_no}/{board_sep}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> boardDelete(
			@PathVariable("board_no") int board_no,
			@PathVariable("board_sep") int board_sep,
			HttpServletRequest request,
			Model model) {
		model.addAttribute("request", request);
		model.addAttribute("board_no", board_no);
		model.addAttribute("board_sep", board_sep);
		return boardDeleteCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="commentsList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> commentsList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		return commentsListCommand.execute(sqlSession, model);
	}
	
	@PutMapping(value="commentsOnHideToggle/{comment_no}/{on_hide}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> commentsOnHideToggle(
			@PathVariable("comment_no") int comment_no,
			@PathVariable("on_hide") int on_hide,
			Model model) {
		model.addAttribute("comment_no", comment_no);
		model.addAttribute("on_hide", on_hide);
		return commentsOnHideToggleCommand.execute(sqlSession, model);
	}
	
	@DeleteMapping(value="commentDelete/{comment_no}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> commentDelete(
			@PathVariable("comment_no") int comment_no,
			Model model) {
		model.addAttribute("comment_no", comment_no);
		return commentDeleteCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="reivewList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> reivewList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		return reivewListCommand.execute(sqlSession, model);
	}
	
	@PutMapping(value="reviewOnHideToggle/{review_no}/{on_hide}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> reviewOnHideToggle(
			@PathVariable("review_no") int review_no,
			@PathVariable("on_hide") int on_hide,
			Model model) {
		model.addAttribute("review_no", review_no);
		model.addAttribute("on_hide", on_hide);
		return reviewOnHideToggleCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="tQnAList.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> tQnAList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		return tQnAListCommand.execute(sqlSession, model);
	}

	@PutMapping(value="tAnswerdUpdate.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> tAnswerdUpdate(
			@RequestBody Trainer_qnaDto tQnA,
			Model model) {
		model.addAttribute("tQnA", tQnA);
		return tAnswerdUpdateCommand.execute(sqlSession, model);
	}
	
	@PutMapping(value="tQnAOnHideToggle/{trainer_qna_no}/{on_hide}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> tQnAOnHideToggle(
			@PathVariable("trainer_qna_no") int trainer_qna_no,
			@PathVariable("on_hide") int on_hide,
			Model model) {
		model.addAttribute("trainer_qna_no", trainer_qna_no);
		model.addAttribute("on_hide", on_hide);
		return tQnAOnHideToggleCommand.execute(sqlSession, model);
	}
}