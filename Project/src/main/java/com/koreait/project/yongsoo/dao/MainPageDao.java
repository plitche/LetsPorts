package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.yongsoo.dto.BoardQnATemDto;
import com.koreait.project.yongsoo.dto.MeetingTemDto;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public interface MainPageDao {

	// 메인페이지로 이동 시 ajax를 통해 마감이 임박한 모임 list를 가져오는 메소드
	public List<MeetingTemDto> getMeeting();
	
	// 메인페이지로 이동 시 ajax를 통해 리뷰가 5개 이상인 유저 번호를 가져오는 메소드
	public List<TrainerTemDto> getTrainer();
	// 리뷰 개수를 가져오기 위한 메소드
	public Integer reviewCount(int user_no);
	
	// 메인페이지로 이동 시 ajax를 통해 최근에 작성된 질문 list를 가져오는 메소드
	public List<BoardQnATemDto> getQnA();
	
}
