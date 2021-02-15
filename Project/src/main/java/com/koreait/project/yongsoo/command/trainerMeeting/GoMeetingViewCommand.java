package com.koreait.project.yongsoo.command.trainerMeeting;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.yongsoo.dao.TrainerMeetingDao;
import com.koreait.project.yongsoo.dto.CreateNewMeetingDto;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public class GoMeetingViewCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int meeting_no = (int)map.get("meeting_no");

		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		
		CreateNewMeetingDto createNewMeetingDto = trainerMeetingDao.findMeetingInfo(meeting_no); // 1번
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd(E)");
		createNewMeetingDto.setMeeting_date2(format.format(createNewMeetingDto.getMeeting_date()));
		createNewMeetingDto.setStart_gather_date2(format.format(createNewMeetingDto.getStart_gather_date()));
		createNewMeetingDto.setEnd_gather_date2(format.format(createNewMeetingDto.getEnd_gather_date()));
		
		int user_no = createNewMeetingDto.getUser_no();
		
		List<MaterialsDto> materialList = trainerMeetingDao.findMaterialsInfo(meeting_no); // 2번
		TrainerTemDto trainerTemDto = trainerMeetingDao.findUserInfo(user_no); // 3번
		List<String> interestList = trainerMeetingDao.getUserInterest(user_no); // 4번
		int full = trainerMeetingDao.isFull(meeting_no);
		
		// 신청하기 버튼 관련해서는 일단 먼저 무조건 보여주고, 버튼 클릭시 결과에 따른 alert창 띄우기로
		
		model.addAttribute("meetingDto", createNewMeetingDto);
		model.addAttribute("materialList", materialList);
		model.addAttribute("trainerTemDto", trainerTemDto);
		model.addAttribute("interestList", interestList);
		model.addAttribute("fromWhere", "trainer");
		
		
	}

}
