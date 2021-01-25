package com.koreait.project.common;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface CommonMapCommand {

	public Map<String, Object> execute(SqlSession sqlSession, Model model);
	
}
