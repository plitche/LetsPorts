package com.koreait.project.yongsoo.command.trainerMeeting;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.dto.MeetingDto;
import com.koreait.project.dto.Trainer_infoDto;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.yongsoo.dao.TrainerMeetingDao;

public class GoMeetingViewCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int meeting_no = (int)map.get("meeting_no");
		
		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		
		MeetingDto meetingDto = trainerMeetingDao.findMeetingInfo(meeting_no); // 1번
		int user_no = meetingDto.getUser_no();

		List<MaterialsDto> materialList = trainerMeetingDao.findMaterialsInfo(meeting_no); // 2번
		
		UsersDto usersDto = trainerMeetingDao.findUserInfo(user_no); // 3번
		Trainer_infoDto trainer_infoDto = trainerMeetingDao.findTrainerInfo(user_no); // 4번
		
		model.addAttribute("meetingDto", meetingDto);
		model.addAttribute("materialList", materialList);
		model.addAttribute("usersDto", usersDto);
		model.addAttribute("trainer_infoDto", trainer_infoDto);
		
	}

}
