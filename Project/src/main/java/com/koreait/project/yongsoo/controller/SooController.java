package com.koreait.project.yongsoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SooController {

	@RequestMapping(value="/")
	public String goindex() {
		return "index";
	}
	
}
