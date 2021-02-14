package com.koreait.project.yongsoo.dao;

import java.sql.Date;
import java.util.List;

import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.yongsoo.dto.CreateNewMeetingDto;
import com.koreait.project.yongsoo.dto.MeetingTemDto;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public interface TrainerMeetingDao {

	// 트레이너가 개설한 모임 정보를 가져오기 위한 메소드
	public List<MeetingTemDto> findMeetings(int page_no, int user_no);
	// 트레이너 디테일 페이지에서 해당 트레이너의 총 모임 개수를 가지고 오기 위한 메소드
	public int totalMeetingCount(int user_no);
	
	// 모임 제목,내용 클릭시 모임 번호의 정보를 토대로 필요한 data를 가져오기 위한 메소드
	// 1. meeting테이블에서 data 가져오기
	public CreateNewMeetingDto findMeetingInfo(int meeting_no);
	// 2. 준비물 data 가져오기
	public List<MaterialsDto> findMaterialsInfo(int meeting_no);
	// 3. 모임 개설자(게시글 작성자)의 data를 유저 테이블/트레이너 테이블에서 가져오기
	public TrainerTemDto findUserInfo(int user_no);
	// 4. 모임 개설자의 관심 종목을 가져오기 위한 메소드
	public List<String> getUserInterest(int user_no);
	
	// 이동하는 모임이 이미 스크랩 한 모임인지 판단하기 위한 메소드
	public int isInWishList(int user_no, int meeting_no);
	
	// 전달받은 모임 번호를 통해 end_gather_date를 구하는 메소드
	public Date getEndGatherDate(int scrap_referer_no);
	// 모임 view페이지에서 관심모임으로 등록하기 버튼 클릭 시 insert해주기 위한 메소드
	public int insertScrap(int user_no, int scrap_referer_no, Date end_gather_date);
	
	// 트레이너 모임 개설 페이지에서 meeting테이블에 insert를 하기위한 메소드
	public int createMeeting(CreateNewMeetingDto createNewMeetingDto);
	// 새로 생성된 모임의 모임번호를 가져오기 위한 메소드
	public int findMeetingNo(int user_no);
	// 모임 작성자 본인은 바로 모임 참가자 테이블에 insert해주기 위한 메소드
	public void joinToMyMeeting(int meeting_no, int user_no);
	// 모임 생성할 때 첨부한 파일을 저장하기위한 메소드
	public int insertPhotoOfMeeting(int meeting_no, int user_no, String photo_filename);
	// 새로 생성된 모임번호와 준비물을 저장하기 위한 메소드
	public int insertMaterialList(int meeting_no, String material);
	
	
	// 모임 개설자가 개설한 다른 모임들 data 가져오기 
	public List<MeetingTemDto> getOtherMeeting(int user_no, int meeting_no);

	// 현재 보고있는 모임과 같은 카테고리 모임들 중 현재 호스트가 아닌 다른 호스트의 모임 data 가져오기 
	public List<MeetingTemDto> getOtherHostMeeting(int user_no, int exercise_no);
	
}
