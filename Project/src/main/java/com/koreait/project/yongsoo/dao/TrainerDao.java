package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.yongsoo.dto.TrainerTemDto;

public interface TrainerDao {

	// 트레이너 정보를 가져오기 위한 메소드
	public List<TrainerTemDto> trainerList();
	// 평점을 가져오기 위한 메소드
	public Double trainerScore(int user_no);
	// 리뷰 개수를 가져오기 위한 메소드
	public Integer reviewCount(int user_no);
	
	
	// 유저 번호를 통해 트레이너 정보를 가져오기 위한 메소드
	public TrainerTemDto trainerDetail(int user_no);
	
}