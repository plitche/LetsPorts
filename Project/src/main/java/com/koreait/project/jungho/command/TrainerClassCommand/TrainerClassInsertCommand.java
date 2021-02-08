package com.koreait.project.jungho.command.TrainerClassCommand;

import java.io.File;
import java.sql.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;
import com.koreait.project.jungho.dto.MakeTrainerClassDto;

public class TrainerClassInsertCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		int user_no = Integer.parseInt(multipartRequest.getParameter("user_no"));
		String meeting_title = multipartRequest.getParameter("meeting_title");
		Date meeting_date =  Date.valueOf(multipartRequest.getParameter("meeting_date"));
		Date start_gather_date = Date.valueOf(multipartRequest.getParameter("start_gather_date"));
		Date end_gather_date =  Date.valueOf(multipartRequest.getParameter("end_gather_date"));
		int meeting_min = Integer.parseInt(multipartRequest.getParameter("meeting_min"));
		int meeting_max = Integer.parseInt(multipartRequest.getParameter("meeting_max"));
		int exercise_no = Integer.parseInt(multipartRequest.getParameter("exercise_no"));
		int location1_no = Integer.parseInt(multipartRequest.getParameter("location1_no"));
		int location2_no = Integer.parseInt(multipartRequest.getParameter("location2_no"));
		String detail_location = multipartRequest.getParameter("detail_location");
		String meeting_content = multipartRequest.getParameter("meeting_content");
		String[] materialList = multipartRequest.getParameterValues("materials_name");
		
		MakeTrainerClassDto makeTrainerClassDto = new MakeTrainerClassDto();
	
		makeTrainerClassDto.setUser_no(user_no);
		makeTrainerClassDto.setMeeting_title(meeting_title);
		makeTrainerClassDto.setMeeting_date(meeting_date);
		makeTrainerClassDto.setStart_gather_date(start_gather_date);
		makeTrainerClassDto.setEnd_gather_date(end_gather_date);
		makeTrainerClassDto.setMeeting_min(meeting_min);
		makeTrainerClassDto.setMeeting_max(meeting_max);
		makeTrainerClassDto.setExercise_no(exercise_no);
		makeTrainerClassDto.setLocation1_no(location1_no);
		makeTrainerClassDto.setLocation2_no(location2_no);
		makeTrainerClassDto.setDetail_location(detail_location);
		makeTrainerClassDto.setMeeting_content(meeting_content);
		
		
		
		// meeting 테이블에 값 삽입 작업 
		trainerClassDao.trainerClassInsert(makeTrainerClassDto);
		
		// 새로 삽입된 meeting_no의 숫자를 구하기 위한 처리 ( max(meeting_no) 로 최근에 생성된 번호 가져온다. )
		int meeting_no = trainerClassDao.findNewMeetingNo(user_no);
		
		// 여러개 입력된 준비물 리스트를 저장할 수 있도록 for문으로 처리
		
		// 새로 생성된 meeting_no에 가져온 준비물을 넣기 위한 작업처리
		for (int i = 0; i < materialList.length; i++) {
			String material = materialList[i];
			trainerClassDao.materialsInsert(meeting_no, material);
		}
		
		MultipartFile coverphoto = multipartRequest.getFile("coverphoto");
		// 첨부를 했는지 검사
		if (coverphoto != null && !coverphoto.isEmpty()) {
					String originalFilename = coverphoto.getOriginalFilename();
					String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
					String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
					String uploadFilename = filename +
															 "_" +
															 System.currentTimeMillis() + 
															 "." +
															 extension;
					String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
					File dir = new File(realPath);
					if (!dir.exists()) {
						dir.mkdirs();
					}
					File uploadFile = new File(realPath, uploadFilename);
					try {
						coverphoto.transferTo(uploadFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					trainerClassDao.insertPhoto(meeting_no, user_no, uploadFilename);
					
			
		} else {
			
			trainerClassDao.insertPhoto(meeting_no, user_no, "첨부없음");
			
		}
		

	}

}
