package com.koreait.project.wooki.command.textEditor;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.EditorDao;

public class PhotoHideCheckCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		String filesname = (String) model.asMap().get("filesname");
		String[] list = filesname.split(",");
		
		Map<String, Object> map = new HashMap<String, Object>();
		String result = sqlSession.getMapper(EditorDao.class).photoHideCheck(list);
		map.put("list", result);
		return map;
	}

}
