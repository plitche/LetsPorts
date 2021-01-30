package com.koreait.project.jungho.dao;

import java.util.List;

import com.koreait.project.jungho.dto.TrainerClassDto;

public interface TrainerClassDao {

	public List<TrainerClassDto> trainerClassList();

	public int trainerClassInsert(TrainerClassDto trainerClassDto);
	
	public TrainerClassDto trainerClassView(int meeting_no);
	
}
