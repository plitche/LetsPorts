package com.koreait.project.yewon.command;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.Board_knowhowDto;
import com.koreait.project.yewon.dao.KnowHowDao;

public class GoknowHowViewCommand implements CommonVoidCommand {

	@Override
	
	// command에 들어갈 list들의 데이터를 command에 저장하고 view로 넘긴다.
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int knowhow_no = (int)map.get("knowhow_no");
		KnowHowDao knowHowDao = sqlSession.getMapper(KnowHowDao.class);
		knowHowDao.addhit(knowhow_no);
		Board_knowhowDto board_knowhowDto = knowHowDao.knowHowView(knowhow_no);
		model.addAttribute("board_knowhowDto", board_knowhowDto);
		
	}

}
