package com.koreait.project.yongsoo.command.Scrap;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.TrainerMeetingDao;

public class IsInWishListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int user_no = (int)map.get("user_no");
		int meeting_no = (int)map.get("meeting_no");
		
		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		int wishResult = trainerMeetingDao.isInWishList(user_no, meeting_no);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (wishResult>0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
