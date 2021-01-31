package com.koreait.project.yewon.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.metadata.SqlServerCallMetaDataProvider;
import org.springframework.ui.Model;

import com.koreait.project.yewon.dao.KnowHowDao;
import com.sun.javafx.collections.MappingChange.Map;

public class GoknowHowInsertCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		KnowHowDao knowHowDao = (KnowHowDao)map.get("Board_knowHowDto");
		
		
		
		
	}
	
	
}
