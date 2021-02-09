package com.koreait.project.wooki.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.wooki.command.DeleteTestCommand;
import com.koreait.project.wooki.command.TestCommand;

@Controller
public class TestController {
	@GetMapping(value="test.wooki")
	public String test() {
		return "wookiPages/editTest";
	}
	
	@PostMapping(value="upload.wooki", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> asdf(MultipartHttpServletRequest multipartRequest, Model model) {
		TestCommand test = new TestCommand();
		return test.test(multipartRequest, model);
	}
	
	@DeleteMapping(value="testDelete/{filesname}.wooki")
	@ResponseBody
	public void fdfd(HttpServletRequest request, @PathVariable("filesname") String filesname, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("filesname", filesname);
		DeleteTestCommand test = new DeleteTestCommand();
		test.execute(model);
	}
}
