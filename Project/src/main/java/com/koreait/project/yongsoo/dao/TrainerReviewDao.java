package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.ReviewDto;

public interface TrainerReviewDao {

	// 트레이너 디테일 페이지로 이동시 자등으로 리뷰 리스트를 불러오기 위한 메소드
	public List<ReviewDto> getTrainerReviewList(int user_no);
	// 트레이너 리스트페이지에서 트레이너 디테일 패이지로 이동 시 해당 트레이너에게 달린 리뷰 개수를 알아내기 위한 메소드
	public int listCount(int user_no);
	
}
