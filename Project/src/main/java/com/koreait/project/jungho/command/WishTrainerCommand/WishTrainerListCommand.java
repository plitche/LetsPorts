package com.koreait.project.jungho.command.WishTrainerCommand;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.WishTrainerDao;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public class WishTrainerListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		WishTrainerDao wishTrainerDao = sqlSession.getMapper(WishTrainerDao.class);
		
		//WishTrainerListDto wishTrainerListDto = (WishTrainerListDto);
		
	//	int user_nos = wishTrainerListDto.getUser_no();
		
		List<TrainerTemDto> list = wishTrainerDao.WishTrainerList(user_no);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setExercise_name ( wishTrainerDao.interestList(list.get(i).getScrap_referer_no()));
			
			System.out.println((list.get(i).getScrap_referer_no()));
			System.out.println(wishTrainerDao.interestList(list.get(i).getScrap_referer_no())[0]);
			System.out.println(wishTrainerDao.interestList(list.get(i).getScrap_referer_no())[1]);
		}
		
		
		model.addAttribute("WishTrainerList", list); // 로그인 되어 있는 사람의 트레이너 정보를 가져온다.
		
		//model.addAttribute("interestList", wishTrainerDao.interestList(user_nos));
	}

}
