package com.koreait.project.yongsoo.command.trainerReview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.MeetingDto;
import com.koreait.project.dto.ReviewDto;
import com.koreait.project.yongsoo.dao.TrainerReviewDao;

public class FindJoinMeetingListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		ReviewDto reviewDto = (ReviewDto)map.get("reviewDto");
		
		int target_user_no = reviewDto.getTarget_user_no();
		int writer_user_no = reviewDto.getWriter_user_no();

		TrainerReviewDao trainerReviewDao = sqlSession.getMapper(TrainerReviewDao.class);
		List<MeetingDto> joinMeetingList = trainerReviewDao.findJoinMeetingList(target_user_no, writer_user_no);
		
		Map<String, Object> result = new HashMap<String, Object>();
		if (joinMeetingList.size()>0) {
			result.put("result", true);
			result.put("joinMeetingList", joinMeetingList);
		} else {
			result.put("result", false);
			if (trainerReviewDao.findAlreadyRevied(target_user_no, writer_user_no)>0) {
				result.put("status", true);
			} else {
				result.put("status", false);
			}
			
		}
		
		return result;
	}

}
