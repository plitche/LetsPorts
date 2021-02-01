package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.dto.MeetingDto;
import com.koreait.project.dto.Trainer_infoDto;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.yongsoo.dto.CreateNewMeetingDto;
import com.koreait.project.yongsoo.dto.MeetingTemDto;

public interface TrainerMeetingDao {

	// 트레이너가 개설한 모임 정보를 가져오기 위한 메소드
	public List<MeetingDto> findMeetings(int user_no);
	
	
	// 모임 제목,내용 클릭시 모임 번호의 정보를 토대로 필요한 data를 가져오기 위한 메소드
	// 1. meeting테이블에서 data 가져오기
	public MeetingDto findMeetingInfo(int meeting_no);
	// 2. 준비물 data 가져오기
	public List<MaterialsDto> findMaterialsInfo(int meeting_no);
	// 3. 모임 개설자(게시글 작성자)의 data를 유저 테이블에서 가져오기
	public UsersDto findUserInfo(int user_no);
	// 4. 모임 개설자(게시글 작성자)가 트레이너의 경우 트레이너 테이블에서 data 가져오기
	public Trainer_infoDto findTrainerInfo(int user_no);
	
	
	// 트레이너 모임 개설 페이지에서 meeting테이블에 insert를 하기위한 메소드
	public int createMeeting(CreateNewMeetingDto createNewMeetingDto);
	// 새로 생성된 모임의 모임번호를 가져오기 위한 메소드
	public int findMeetingNo(int user_no);
	// 새로 생성된 모임번호와 준비물을 저장하기 위한 메소드
	public int insertMaterialList(int meeting_no, String material);
	
	// 모임 개설자가 개설한 다른 모임들 data 가져오기 
	public List<MeetingDto> getOtherMeeting(int user_no, int meeting_no);

	// 현재 보고있는 모임과 같은 카테고리 모임들 중 현재 호스트가 아닌 다른 호스트의 모임 data 가져오기 
	public List<MeetingTemDto> getOtherHostMeeting(int user_no, int exercise_no);
	
}
