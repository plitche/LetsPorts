package com.koreait.project.yongsoo.command.trainerMeeting;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.TrainerMeetingDao;
import com.koreait.project.yongsoo.dto.MeetingTemDto;

public class GetOtherHostMeetingCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MeetingTemDto meetingTemDto = (MeetingTemDto)map.get("meetingTemDto");
		int user_no = meetingTemDto.getUser_no();
		int exercise_no = meetingTemDto.getExercise_no();

		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		List<MeetingTemDto> list = trainerMeetingDao.getOtherHostMeeting(user_no, exercise_no);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd(E)");
		for(int i=0; i<list.size(); i++) {
			list.get(i).setMeeting_date2(format.format(list.get(i).getMeeting_date()));
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (list.size()>0) {
			result.put("result", true);
			result.put("meetingList", list);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
