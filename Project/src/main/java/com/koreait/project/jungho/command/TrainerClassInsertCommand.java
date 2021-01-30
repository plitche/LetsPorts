package com.koreait.project.jungho.command;

import java.sql.Date;
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
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int user_no = 10;
		String meeting_title = request.getParameter("meeting_title");
		Date meeting_date =  Date.valueOf(request.getParameter("meeting_date"));
		Date start_gather_date = Date.valueOf(request.getParameter("start_gather_date"));
		Date end_gather_date = Date.valueOf(request.getParameter("end_gather_date"));
		int meeting_min = Integer.parseInt(request.getParameter("meeting_min"));
		int meeting_max = Integer.parseInt(request.getParameter("meeting_max"));
		List<String> materialList = Arrays.asList(request.getParameter("materials_name"));
		int exercise_no = Integer.parseInt(request.getParameter("exercise_no"));
		int location1_no = Integer.parseInt(request.getParameter("location1_no"));
		int location2_no = Integer.parseInt(request.getParameter("location2_no"));
		String detail_location = request.getParameter("detail_location");
		String meeting_content = request.getParameter("meeting_content");
		TrainerClassDto trainerClassDto = new TrainerClassDto();
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
		
		
		
		for (int i = 0; i < materialList.size(); i++) {
			String material = materialList.get(i);
		}
		
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		int InsertResult = trainerClassDao.trainerClassInsert(trainerClassDto);
		
		model.addAttribute("InsertResult", InsertResult);
		
	}

}
