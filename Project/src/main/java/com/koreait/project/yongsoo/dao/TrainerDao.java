package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.MeetingDto;
import com.koreait.project.dto.ReviewDto;
import com.koreait.project.dto.Trainer_qnaDto;
import com.koreait.project.yongsoo.dto.CreateNewMeetingDto;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public interface TrainerDao {

	// 트레이너 정보를 가져오기 위한 메소드
	public List<TrainerTemDto> trainerList();
	
	// 유저 번호를 통해 트레이너 정보를 가져오기 위한 메소드
	public TrainerTemDto trainerDetail(int user_no);
	
	// 트레이너가 개설한 모임 정보를 가져오기 위한 메소드
	public List<MeetingDto> findMeetings(int user_no);
	
	// 트레이너에게 리뷰를 남긴 정보를 가져오기 위한 메소드
	public List<ReviewDto>  findReview(int user_no);
	
	// 트레이너에게 질문한 질문 정보를 가져오기 위한 메소드
	public List<Trainer_qnaDto> findQuestion(int user_no);
	
	// 트레이너 모임 개설 페이지에서 meeting테이블에 insert를 하기위한 메소드
	public int createNewMeeting(CreateNewMeetingDto createNewMeetingDto);
	
	// 새로 생성된 모임의 모임번호를 가져오기 위한 메소드
	public int findMeetingNo(int user_no);

	// 새로 생성된 모임번호와 준비물을 저장하기 위한 메소드
	public int insertMaterialList(int meeting_no, String material);
	
	// 트레이너에게 질문 작성하고 그 내용을 테이블에 저장하기 위한 메소드
	public int insertQnAToTrainer(Trainer_qnaDto trainer_qnaDto);
	
	
	
	
	
}