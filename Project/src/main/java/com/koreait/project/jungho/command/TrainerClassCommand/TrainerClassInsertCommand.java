package com.koreait.project.jungho.command.TrainerClassCommand;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.w3c.dom.ls.LSInput;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;
import com.koreait.project.jungho.dto.TrainerClassDto;

public class TrainerClassInsertCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		TrainerClassDto trainerClassDto = (TrainerClassDto)map.get("trainerClassDto");
		
		int user_no = 10;
		String meeting_title = trainerClassDto.getMeeting_title();
		Date meeting_date =  trainerClassDto.getMeeting_date();
		Date start_gather_date = trainerClassDto.getStart_gather_date();
		Date end_gather_date = trainerClassDto.getEnd_gather_date();
		int meeting_min = trainerClassDto.getMeeting_min();
		int meeting_max = trainerClassDto.getMeeting_max();
		List<String> materialList = trainerClassDto.getMaterials_name();
		int exercise_no = trainerClassDto.getExercise_no();
		int location1_no = trainerClassDto.getLocation1_no();
		int location2_no = trainerClassDto.getLocation2_no();
		String detail_location = trainerClassDto.getDetail_location();
		String meeting_content = trainerClassDto.getMeeting_content();
		trainerClassDto.setUser_no(user_no);
		trainerClassDto.setMeeting_title(meeting_title);
		trainerClassDto.setMeeting_date(meeting_date);
		trainerClassDto.setStart_gather_date(start_gather_date);
		trainerClassDto.setEnd_gather_date(end_gather_date);
		trainerClassDto.setMeeting_min(meeting_min);
		trainerClassDto.setMeeting_max(meeting_max);
		trainerClassDto.setExercise_no(exercise_no);
		trainerClassDto.setLocation1_no(location1_no);
		trainerClassDto.setLocation2_no(location2_no);
		trainerClassDto.setDetail_location(detail_location);
		trainerClassDto.setMeeting_content(meeting_content);
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		
		// meeting 테이블에 값 삽입 작업 
		trainerClassDao.trainerClassInsert(trainerClassDto);
		
		// 새로 삽입된 meeting_no의 숫자를 구하기 위한 처리 ( max(meeting_no) 로 최근에 생성된 번호 가져온다. )
		int meeting_no = trainerClassDao.findNewMeetingNo(user_no);
		
		// 여러개 입력된 준비물 리스트를 저장할 수 있도록 for문으로 처리
		
		// 새로 생성된 meeting_no에 가져온 준비물을 넣기 위한 작업처리
		for (int i = 0; i < materialList.size(); i++) {
			String material = materialList.get(i);
			trainerClassDao.materialsInsert(meeting_no, material);
		}
		
		
		
		
	}

}
