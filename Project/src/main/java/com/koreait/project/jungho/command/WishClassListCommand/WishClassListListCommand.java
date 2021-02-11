package com.koreait.project.jungho.command.WishClassListCommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.WishClassListDao;

public class WishClassListListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		
		System.out.println(user_no);
		WishClassListDao wishClassListDao = sqlSession.getMapper(WishClassListDao.class);
		model.addAttribute("WishClassList", wishClassListDao.WishClassListList(user_no));
		
	}

}
