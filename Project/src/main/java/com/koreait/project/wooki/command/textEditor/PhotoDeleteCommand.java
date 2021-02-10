package com.koreait.project.wooki.command.textEditor;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.EditorDao;

public class PhotoDeleteCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		String filesname = (String) model.asMap().get("filesname");
		String[] list = filesname.split(",");
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		String realPath = request.getServletContext().getRealPath("resources/storage");
		filesname = "";
		for(int i = 0; i < list.length; i++) {
			File file = new File(realPath, list[i]);
			if(file.exists()) {
				file.delete();
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		int result = sqlSession.getMapper(EditorDao.class).deleteTempPhoto(list);
		if(result > 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

}
