package com.koreait.project.wooki.command.textEditor;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.EditorDao;
import com.koreait.project.wooki.dto.TempBoardDto;

public class IsnertTempBoardCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int user_no = (int) model.asMap().get("user_no");
		EditorDao editorDao = sqlSession.getMapper(EditorDao.class); 
		
		editorDao.insertTempBoard(user_no);
		TempBoardDto tempBoard = editorDao.selectTempBoard(user_no);

		Map<String, Object> map = new HashMap<String, Object> ();
		
		if(tempBoard != null) {
			map.put("temp_no", tempBoard.getTemp_no());
		}
		
		return map;
	}

}
