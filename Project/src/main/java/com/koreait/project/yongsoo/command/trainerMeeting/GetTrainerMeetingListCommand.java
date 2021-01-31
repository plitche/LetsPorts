package com.koreait.project.yongsoo.command.trainerMeeting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.MeetingDto;
import com.koreait.project.yongsoo.dao.TrainerMeetingDao;

public class GetTrainerMeetingListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int user_no = (int)map.get("user_no");
		
		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		
		List<MeetingDto> meetingList = trainerMeetingDao.findMeetings(user_no);
		
		Map<String, Object> getMeetingListResult = new HashMap<>();
		if (meetingList.size()>0) {
			getMeetingListResult.put("result", true);
			getMeetingListResult.put("meetingList", meetingList);
		} else {
			getMeetingListResult.put("result", false);
		}
		
		return getMeetingListResult;
	}

}
