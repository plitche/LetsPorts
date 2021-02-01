package com.koreait.project.yewon.command;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.metadata.SqlServerCallMetaDataProvider;
import org.springframework.ui.Model;

import com.koreait.project.dto.Board_knowhowDto;
import com.koreait.project.yewon.dao.KnowHowDao;
import com.sun.javafx.collections.MappingChange.Map;

public class GoknowHowInsertCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Board_knowhowDto Board_knowhowDto = (Board_knowhowDto)map.get("Board_knowhowDto");
		KnowHowDao KnowHowDao = sqlSession.getMapper(KnowHowDao.class);
		KnowHowDao knowHowDao = KnowHowDao.knowHowList();
		
		
		Map<String, Object> result = new HashMap();
		
		
		
	}
	
	
}
