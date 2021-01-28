package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.yongsoo.dto.TrainerTemDto;

public interface TrainerDao {

	public List<TrainerTemDto> trainerList();
	
	public TrainerTemDto trainerDetail(int user_no);
}
