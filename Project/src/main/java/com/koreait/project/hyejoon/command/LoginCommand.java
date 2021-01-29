package com.koreait.project.hyejoon.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.hyejoon.dao.LoginDao;

public class LoginCommand implements CommonVoidCommand {
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {

		LoginDao loginDao = sqlSession.getMapper(LoginDao.class);
		model.addAttribute("userList", loginDao.userList());
		
	}
}
