package com.koreait.project.wooki.command;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class DeleteTestCommand {

	public void execute(Model model) {
		String filesname = (String) model.asMap().get("filesname");
		String[] list = filesname.split(",");
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		
		String realPath = request.getServletContext().getRealPath("resources/storage");
		for(int i = 0; i < list.length; i++) {
			File file = new File(realPath, list[i]);
			if(file.exists()) {
				file.delete();
			}
		}
	}

}
