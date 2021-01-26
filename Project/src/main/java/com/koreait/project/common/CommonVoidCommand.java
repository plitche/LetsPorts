package com.koreait.project.common;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface CommonVoidCommand {

	public void execute(SqlSession sqlSession, Model model);

}