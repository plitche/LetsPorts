package com.koreait.project.jungho.command.TrainerClassCommand;

import java.io.File;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;
import com.koreait.project.jungho.dto.MakeTrainerClassDto;
import com.koreait.project.jungho.dto.TrainerClassDto;

public class TrainerClassUpdateCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		int user_no = Integer.parseInt(multipartRequest.getParameter("user_no"));
		int meeting_no = Integer.parseInt(multipartRequest.getParameter("meeting_no"));
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
		
		
		// meeting 부분을 수정
		trainerClassDao.trainerClassUpdate(makeTrainerClassDto);
		
		
		// materials 부분을 수정
		for (int i = 0; i < materialList.length; i++) {
			String material = materialList[i];
			trainerClassDao.materialsViewUpdate(material, meeting_no);
		}
		
		MultipartFile coverphotoUpdate = multipartRequest.getFile("coverphotoUpdate");
		if (coverphotoUpdate != null && !coverphotoUpdate.isEmpty()) {
			String originalFilename = coverphotoUpdate.getOriginalFilename();
			String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
			String uploadFilename = filename + "_" + System.currentTimeMillis() + "." + extension;
			String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
			File dir = new File(realPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File uploadFile = new File(realPath, uploadFilename);
			try {
				coverphotoUpdate.transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			trainerClassDao.updatePhoto(uploadFilename, meeting_no);
			
		} else {
			
			trainerClassDao.updatePhoto("첨부없음", meeting_no);
			
		}
		
		
		
	}

}
