package com.koreait.project.jungho.dao;

import java.util.List;

import com.koreait.project.yongsoo.dto.TrainerTemDto;

public interface WishTrainerDao {
	
	public List<TrainerTemDto> WishTrainerList(int user_no);  // 로그인한 유저가 스크랩한 모든 트레이너의 정보를 가져와라.

	public int WishTrainerInsert(int user_no, int scrap_referer_no);
	
	public int WishTrainerListTotal(int scrap_referer_no);
}
