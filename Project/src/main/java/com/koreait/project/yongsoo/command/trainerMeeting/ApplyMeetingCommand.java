package com.koreait.project.yongsoo.command.trainerMeeting;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.TrainerMeetingDao;
import com.koreait.project.yongsoo.dto.MeetingTemDto;

public class ApplyMeetingCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MeetingTemDto meetingTemDto = (MeetingTemDto)map.get("meetingTemDto");

		int user_no = meetingTemDto.getUser_no();
		int meeting_no= meetingTemDto.getMeeting_no();
		int meeting_max = meetingTemDto.getMeeting_max();
		
		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		
		// 이미 해당 모임의 인원수가 가득 찼는지 확인하기 위한 메소드
		int currentApply = trainerMeetingDao.isFull(meeting_no);
		int isApply = trainerMeetingDao.isApply(user_no, meeting_no);
		
		Map<String, Object> applyResult = new HashMap<String, Object>();
		
		if (currentApply < meeting_max) {
			// 더 신청이 가능한 상태
			applyResult.put("isFull", false);
			if (isApply > 0) {
				// 해당 게시글에 본인은 신청 안한 상태
				applyResult.put("isApply", false);
				
			} else {
				// 이미 신청을 본인이 한 상태
				applyResult.put("isApply", true);
			}
			
		} else {
			// 이미 제한 인원이 가득 찬 상태
			applyResult.put("isFull", true);
		}
		
		return null;
	}

}
