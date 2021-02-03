package com.koreait.project.jungho.dao;

import java.util.List;

import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.jungho.dto.TrainerClassDto;

public interface TrainerClassDao {

	public List<TrainerClassDto> trainerClassList();

	public int trainerClassInsert(TrainerClassDto trainerClassDto);
	
	public int findNewMeetingNo(int user_no);
	
	public int materialsInsert(int meeting_no, String materialS);
	
	public TrainerClassDto trainerClassView(int meeting_no);
	
	// 여러가지를 받아오기 때문에 list로 받아서 처리해야한다. 
	public List<MaterialsDto> materialsView(int meeting_no);
	
	public int materialsDelete(int meeting_no);
	
	public int trainerClassDelete(int meeting_no);
	
	public int trainerClassUpdate(TrainerClassDto trainerClassDto);
	
	public int materialsViewUpdate(String material, int meeting_no);
	
	// 관련 트레이너 클래스 리스트 추출
	public List<TrainerClassDto> relatedClass(TrainerClassDto trainerClassDto);
	
}
