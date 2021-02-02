package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.Trainer_qnaDto;

public interface TrainerQnADao {

	// 트레이너 View페이지로 이동시 자동으로 해당 트레이너에게 달린 질문 목록을 가져오기 위한 메소드
	public List<Trainer_qnaDto> getTrainerQnAList(int user_no);

	// 트레이너에게 질문 작성하고 그 내용을 테이블에 저장하기 위한 메소드
	public int insertQnAToTrainer(Trainer_qnaDto trainer_qnaDto);
	
	// 트레이너에게 질문한 질문 정보를 가져오기 위한 메소드
	public List<Trainer_qnaDto> findQuestion(int user_no);
	
}
