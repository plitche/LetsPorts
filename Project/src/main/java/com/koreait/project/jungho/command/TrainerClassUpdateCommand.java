package com.koreait.project.jungho.command;

import java.sql.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;
import com.koreait.project.jungho.dto.TrainerClassDto;

public class TrainerClassUpdateCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		TrainerClassDto trainerClassDto = (TrainerClassDto)map.get("trainerClassDto");
		
		int meeting_no = trainerClassDto.getMeeting_no();
		String meeting_title = trainerClassDto.getMeeting_title();
		Date meeting_date = trainerClassDto.getMeeting_date();
		Date start_gather_date = trainerClassDto.getStart_gather_date();
		Date end_gather_date = trainerClassDto.getEnd_gather_date();
		int meeting_min = trainerClassDto.getMeeting_min();
		int meeting_max = trainerClassDto.getMeeting_max();
		int exercise_no = trainerClassDto.getExercise_no();
		int location1_no = trainerClassDto.getLocation1_no();
		int location2_no = trainerClassDto.getLocation2_no();
		String detail_location = trainerClassDto.getDetail_location();
		String meeting_content = trainerClassDto.getMeeting_content();
		String [] materialList = trainerClassDto.getMaterials_name();
		trainerClassDto.setMeeting_no(meeting_no);
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
		
		// meeting 부분을 수정
		trainerClassDao.trainerClassUpdate(trainerClassDto);
		
		// materials 부분을 수정
		for (int i = 0; i < materialList.length; i++) {
			String material = materialList[i];
			trainerClassDao.materialsViewUpdate(material, meeting_no);
		}
		
		
		
	}

}
