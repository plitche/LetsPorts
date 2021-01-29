package com.koreait.project.jungho.command;

import java.sql.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

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
		int exercise_no = trainerClassDto.getExercise_no();
		int location1_no = trainerClassDto.getLocation1_no();
		int location2_no = trainerClassDto.getLocation2_no();
		String detail_location = trainerClassDto.getDetail_location();
		String materials_name = trainerClassDto.getMaterials_name();
		String meeting_content = trainerClassDto.getMeeting_content();
		trainerClassDto = new TrainerClassDto(user_no, meeting_title, meeting_date, start_gather_date, end_gather_date, meeting_min, meeting_max, exercise_no, location1_no, location2_no, detail_location, materials_name, meeting_content);
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		int InsertResult = trainerClassDao.trainerClassInsert(trainerClassDto);
		
		model.addAttribute("InsertResult", InsertResult);
		
	}

}
