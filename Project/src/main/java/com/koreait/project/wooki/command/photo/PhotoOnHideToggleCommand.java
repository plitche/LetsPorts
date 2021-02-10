package com.koreait.project.wooki.command.photo;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class PhotoOnHideToggleCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int photo_no = (int) model.asMap().get("photo_no");
		int on_hide = (int) model.asMap().get("on_hide");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int result = wookiDao.photoOnHideToggle(photo_no, on_hide);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(result >0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

}
