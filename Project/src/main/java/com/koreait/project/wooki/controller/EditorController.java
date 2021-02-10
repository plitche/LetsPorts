package com.koreait.project.wooki.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.wooki.command.textEditor.BoardUpdatePageCommand;
import com.koreait.project.wooki.command.textEditor.InsertBoardTestCommand;
import com.koreait.project.wooki.command.textEditor.IsnertTempBoardCommand;
import com.koreait.project.wooki.command.textEditor.PhotoDeleteCommand;
import com.koreait.project.wooki.command.textEditor.PhotoUploadCommand;
import com.koreait.project.wooki.command.textEditor.TestViewCommand;
import com.koreait.project.wooki.config.EditorAppContext;
import com.koreait.project.wooki.dto.TestBoardDto;

@Controller
public class EditorController {
	@Autowired
	private SqlSession sqlSession;
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(EditorAppContext.class);
	private IsnertTempBoardCommand isnertTempBoardCommand = ctx.getBean("isnertTempBoardCommand", IsnertTempBoardCommand.class);
	private PhotoUploadCommand photoUploadCommand = ctx.getBean("photoUploadCommand", PhotoUploadCommand.class);
	private PhotoDeleteCommand photoDeleteCommand = ctx.getBean("photoDeleteCommand", PhotoDeleteCommand.class);
	
	// 테스트케이스
	private InsertBoardTestCommand insertBoardTestCommand = ctx.getBean("insertBoardTestCommand", InsertBoardTestCommand.class);
	private TestViewCommand testViewCommand = ctx.getBean("testViewCommand", TestViewCommand.class);
	private BoardUpdatePageCommand boardUpdatePageCommand = ctx.getBean("boardUpdatePageCommand", BoardUpdatePageCommand.class);
	
	@GetMapping(value="isnertTempBoard.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> isnertTempBoard(@ModelAttribute("user_no") int user_no, Model model) {
		return isnertTempBoardCommand.execute(sqlSession, model);
	}
	
	@PostMapping(value="photoUpload.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> photoUpload(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		return photoUploadCommand.execute(sqlSession, model);
	}
	
	@DeleteMapping(value="photoDelete/{filesname}.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> photoDelete(
			HttpServletRequest request, @PathVariable("filesname") String filesname,
			Model model) {
		model.addAttribute("request", request);
		model.addAttribute("filesname", filesname);
		return photoDeleteCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="test.wooki")
	public String test() {
		return "wookiPages/editTest";
	}
	
	@PostMapping(value="insertBoardTest.wooki")
	public String insertBoardTest(TestBoardDto testBoardDto, Model model) {
		model.addAttribute("testBoardDto", testBoardDto);
		insertBoardTestCommand.execute(sqlSession, model);
		return "redirect:/";
	}
	
	@GetMapping(value="testView.wooki")
	public String testView(@ModelAttribute("no") int no, Model model) {
		testViewCommand.execute(sqlSession, model);
		return "wookiPages/testView";
	}
	
	@GetMapping(value="boardUpdatePage.wooki")
	public String boardUpdatePage(@ModelAttribute("no") int no, Model model) {
		boardUpdatePageCommand.execute(sqlSession, model);
		return "wookiPages/testViewUpdatePage";
	}
}
