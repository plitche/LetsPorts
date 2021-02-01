package com.koreait.project.yewon.command;


import org.apache.ibatis.session.SqlSession;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.scheduling.annotation.AnnotationAsyncExecutionInterceptor;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;

public class GoknowHowViewCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		
	}

}
