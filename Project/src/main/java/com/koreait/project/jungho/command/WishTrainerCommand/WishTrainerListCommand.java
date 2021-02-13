package com.koreait.project.jungho.command.WishTrainerCommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.WishTrainerDao;

public class WishTrainerListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		WishTrainerDao wishTrainerDao = sqlSession.getMapper(WishTrainerDao.class);
		
		model.addAttribute("WishTrainerList", wishTrainerDao.WishTrainerList(user_no)); // 로그인 되어 있는 사람의 트레이너 정보를 가져온다.
		
	}

}
