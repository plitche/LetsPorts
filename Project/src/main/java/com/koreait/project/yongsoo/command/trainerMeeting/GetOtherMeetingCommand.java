package com.koreait.project.yongsoo.command.trainerMeeting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.MeetingDto;
import com.koreait.project.yongsoo.dao.TrainerMeetingDao;

public class GetOtherMeetingCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MeetingDto meetingDto = (MeetingDto)map.get("meetingDto");
		int user_no = meetingDto.getUser_no();
		int meeting_no = meetingDto.getMeeting_no();
		
		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		List<MeetingDto> meetingList = trainerMeetingDao.getOtherMeeting(user_no, meeting_no);
		Map<String, Object> result = new HashMap<String, Object>();

		if (meetingList.size()>0) {
			result.put("result", true);
			result.put("meetingList", meetingList);
		} else {
			result.put("result", false);
		}
		return result;
	}

}
