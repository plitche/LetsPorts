package com.koreait.project.wooki.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
}
