package com.koreait.project.yewon.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yewon.dao.KnowHowDao;

public class GoknowHowInsertCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String knowhow_title = request.getParameter("knowhow_title");
		String knowhow_content = request.getParameter("knowhow_content");
		
		
		KnowHowDao knowHowDao = sqlSession.getMapper(KnowHowDao.class);
		knowHowDao.knowhowInsert(knowhow_title, knowhow_content);

	}
}