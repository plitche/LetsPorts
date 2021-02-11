package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.Trainer_qnaDto;
import com.koreait.project.yongsoo.dto.QnATemDto;

public interface TrainerQnADao {

	// 트레이너 View페이지로 이동시 자동으로 해당 트레이너에게 달린 질문 목록을 가져오기 위한 메소드
	public List<Trainer_qnaDto> getTrainerQnAList(int page_no, int user_no);
	// 트레이너 리스트페이지에서 트레이너 디테일 패이지로 이동 시 해당 트레이너에게 달린 질문 개수를 알아내기 위한 메소드
	public int TrainerQnACount(int user_no);
	
	// 트레이너에게 질문 작성하고 그 내용을 테이블에 저장하기 위한 메소드
	public int insertQnAToTrainer(Trainer_qnaDto trainer_qnaDto);
	
	// 질문 제목, 내용 클릭시 해당 질문의 상세 내용을 가져오기 위한 메소드
	public QnATemDto showQnA(int trainer_qna_no);
	
	// 답변 완료 작성 시 update해주기 위한 메소드
	public int writeAnswer(int trainer_qna_no, String trainer_qna_answered);
	
	
	
}
