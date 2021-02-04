package com.koreait.project.yewon.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yewon.dao.KnowHowDao;

public class GoknowHowUpdateCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		int knowhow_no = (int)map.get("knowhow_no");
		
		KnowHowDao knowHowDao = sqlSession.getMapper(KnowHowDao.class);
		model.addAttribute("board_knowhowDto", knowHowDao.getKnowhowInfoByNo(knowhow_no));
		
	}

}
