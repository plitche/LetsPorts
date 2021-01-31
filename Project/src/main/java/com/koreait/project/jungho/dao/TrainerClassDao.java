package com.koreait.project.jungho.dao;

import java.util.List;

import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.jungho.dto.TrainerClassDto;

public interface TrainerClassDao {

	public List<TrainerClassDto> trainerClassList();

	public int trainerClassInsert(TrainerClassDto trainerClassDto);
	
	public int findNewMeetingNo(int user_no);
	
	public int materialsInsert(int meeting_no, String material);
	
	public TrainerClassDto trainerClassView(int meeting_no);
	
	public List<MaterialsDto> materialsView(int meeting_no);
	
	public int materialsDelete(int meeting_no);
	
	public int trainerClassDelete(int meeting_no);
	
	public int trainerClassUpdate(TrainerClassDto trainerClassDto);
	
	public int materialsViewUpdate(String material, int meeting_no);
	
}
