package com.koreait.project.yongsoo.command.trainerMeeting;

import java.io.File;
import java.sql.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.yongsoo.dao.TrainerMeetingDao;
import com.koreait.project.yongsoo.dto.CreateNewMeetingDto;

public class CreateMeetingCommand{

	public int execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		
		int user_no = Integer.parseInt(multipartRequest.getParameter("user_no"));
		String meeting_title = multipartRequest.getParameter("meeting_title");
		String meeting_content = multipartRequest.getParameter("meeting_content");
		Date meeting_date = Date.valueOf(multipartRequest.getParameter("meeting_date"));
		Date start_gather_date = Date.valueOf(multipartRequest.getParameter("start_gather_date"));
		Date end_gather_date = Date.valueOf(multipartRequest.getParameter("end_gather_date"));
		int meeting_max = Integer.parseInt(multipartRequest.getParameter("meeting_max"));
		int meeting_min = Integer.parseInt(multipartRequest.getParameter("meeting_min"));
		int exercise_no = Integer.parseInt(multipartRequest.getParameter("exercise_no"));
		int location1_no = Integer.parseInt(multipartRequest.getParameter("location1_no"));
		int location2_no = Integer.parseInt(multipartRequest.getParameter("location2_no"));
		String detail_location = multipartRequest.getParameter("detail_location");
		String[] materialList = multipartRequest.getParameterValues("materialList");
		
		CreateNewMeetingDto createNewMeetingDto = new CreateNewMeetingDto();
		createNewMeetingDto.setUser_no(user_no);
		createNewMeetingDto.setMeeting_title(meeting_title);
		createNewMeetingDto.setMeeting_content(meeting_content);
		createNewMeetingDto.setMeeting_date(meeting_date);
		createNewMeetingDto.setStart_gather_date(start_gather_date);
		createNewMeetingDto.setEnd_gather_date(end_gather_date);
		createNewMeetingDto.setMeeting_max(meeting_max);
		createNewMeetingDto.setMeeting_min(meeting_min);
		createNewMeetingDto.setExercise_no(exercise_no);
		createNewMeetingDto.setLocation1_no(location1_no);
		createNewMeetingDto.setLocation2_no(location2_no);
		createNewMeetingDto.setDetail_location(detail_location);
		
		// 데이터 저장
		// meeting테이블에 insert하기위한 메소드 호출
		trainerMeetingDao.createMeeting(createNewMeetingDto);
		
		// 새로 생성된 모임 번호를 가져오기위한 메소드 호출
		int meeting_no = trainerMeetingDao.findMeetingNo(user_no);
		
		// meeting테이블에 insert후 작성자 본인은 바로 모임 참가자 테이블에 insert해주기 위한 메소드호출
		trainerMeetingDao.joinToMyMeeting(meeting_no, user_no);
		
		// 새로 생성된 모임번호와 준비물을 저장하기 위한 메소드 호출
		for (int i=0; i<materialList.length; i++) {
			String material = materialList[i];
			trainerMeetingDao.insertMaterialList(meeting_no, material);
		}
		
		
		// 업로드
		MultipartFile mainPhoto = multipartRequest.getFile("mainPhoto");
		if ( mainPhoto!=null && !mainPhoto.isEmpty() ) {
			// 원래 파일명 알아내기
			String originFilename = mainPhoto.getOriginalFilename();
			// 중복 방지 대책으로 파일 이름 만들기
			String extension = originFilename.substring( originFilename.lastIndexOf(".") + 1 );
			String filename = originFilename.substring( 0, originFilename.lastIndexOf(".") );
			
			// 업로드할 파일명 만들기
			String uploadFilename = filename + "_" + System.currentTimeMillis() + "." + extension;
			
			// 업로드할 경로 구하기
			String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
			
			// 업도르할 경로가 없으면 storage 디렉토리 만들기
			File dir = new File(realPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			File uploadFile = new File(realPath, uploadFilename);
			
			try {
				mainPhoto.transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 테이블에 저장하기
			// 새로 생성된 모임 번호를 가지고 photo테이블에 insert하기위한 메소드 호출
			trainerMeetingDao.insertPhotoOfMeeting(meeting_no, user_no, uploadFilename);
			
		} else {
			trainerMeetingDao.insertPhotoOfMeeting(meeting_no, user_no, "첨부없음");
		}
		
		return user_no;
		
	}

}
