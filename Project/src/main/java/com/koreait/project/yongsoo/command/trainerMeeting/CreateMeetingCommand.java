package com.koreait.project.yongsoo.command.trainerMeeting;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.yongsoo.dao.TrainerMeetingDao;
import com.koreait.project.yongsoo.dto.CreateNewMeetingDto;

public class CreateMeetingCommand{

	public int execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		CreateNewMeetingDto createNewMeetingDto = (CreateNewMeetingDto)map.get("createNewMeetingDto");
		List<String> materialList = createNewMeetingDto.getMaterialList();
		// 일단 세션이 없다보니 임시로 10이라고 지정해 둠
		int user_no = 10;
		createNewMeetingDto.setUser_no(user_no);
		
		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		// MEETING테이블에 insert하기위한 메소드 호출
		trainerMeetingDao.createMeeting(createNewMeetingDto);
		
		// 새로 생성된 모임 번호를 가져오기위한 메소드 호출
		int meeting_no = trainerMeetingDao.findMeetingNo(user_no);

		// 새로 생성된 모임번호와 준비물을 저장하기 위한 메소드 호출
		for (int i=0; i<materialList.size(); i++) {
			String material = materialList.get(i);
			trainerMeetingDao.insertMaterialList(meeting_no, material);
		}
		return user_no;
	}

}
