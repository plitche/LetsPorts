package com.koreait.project.yongsoo.command;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.TrainerDao;
import com.koreait.project.yongsoo.dto.CreateNewMeetingDto;

public class InsertMeetingCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		CreateNewMeetingDto createNewMeetingDto = (CreateNewMeetingDto)map.get("createNewMeetingDto");
		List<String> materialList = createNewMeetingDto.getMaterialList();
		
		// 일단 세션이 없다보니 임시로 10이라고 지정해 둠
		createNewMeetingDto.setUser_no(10);
		
		TrainerDao trainerDao = sqlSession.getMapper(TrainerDao.class);
		// MEETING테이블에 insert하기위한 메소드 호출
		trainerDao.createNewMeeting(createNewMeetingDto);
		
		// 새로 생성된 모임 번호를 가져오기위한 메소드 호출
		// int meeting_no = trainerDao.findMeetingNo();
		int meeting_no = 8;
		
		// 새로 생성된 모임번호와 준비물을 저장하기 위한 메소드 호출
		for (int i=0; i<materialList.size(); i++) {
			String material = materialList.get(i);
			trainerDao.insertMaterialList(meeting_no, material);
		}
		
	}

}
