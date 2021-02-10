package com.koreait.project.jungho.dao;

import java.util.List;

import com.koreait.project.dto.ExerciseDto;
import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.dto.MeetingDto;
import com.koreait.project.jungho.dto.MakeTrainerClassDto;
import com.koreait.project.jungho.dto.TrainerClassDto;

public interface TrainerClassDao {

	public List<TrainerClassDto> trainerClassList(int beginRecord, int endRecord);
	public int allClassCount(); // 모든 클래스 갯수 가져오기
	// 필터링 : 트레이너 리스트만 가져오는 것
	public List<TrainerClassDto> trainerList(int beginRecord, int endRecord);
	public int trainerClassCount(); // 트레이너클래스 갯수 가져오기
	// 필터링 : 운동메이트 리스트만 가져오는 것
	public List<TrainerClassDto> exerciseMateList(int beginRecord, int endRecord);
	public int exerciseMateCount(); // 운동메이트클래스 갯수 가져오기
	
	public List<ExerciseDto> classTag();
	
	public int trainerClassInsert(MakeTrainerClassDto makeTrainerClassDto);
	
	public int findNewMeetingNo(int user_no);
	
	public int materialsInsert(int meeting_no, String material);
	
	public int insertPhoto(int meeting_no, int user_no, String uploadFilename);
	
	public TrainerClassDto trainerClassView(int meeting_no);
	
	// 여러가지를 받아오기 때문에 list로 받아서 처리해야한다. 
	public List<MaterialsDto> materialsView(int meeting_no);
	
	public int addhit(int meeting_no);
	
	public int materialsDelete(int meeting_no);
	
	public int trainerClassDelete(int meeting_no);
	
	public int trainerClassUpdate(MakeTrainerClassDto makeTrainerClassDto);
	
	public int materialsViewUpdate(String material, int meeting_no);
	
	public int updatePhoto(String uploadFilename, int meeting_no);
	
	// 관련 트레이너 클래스 리스트 추출
	public List<TrainerClassDto> relatedClass(int user_no, int exercise_no);
	
	// 검색한 내용과 일치하는 트레이너클래스를 뿌려주는 역할
	public List<TrainerClassDto> searchClass(int beginRecord, int endRecord, String search_content);
	public int searchClassCount(String search_content); // 검색한 클래스의 총 갯수
	
	// 태그들 ▼▼▼▼▼▼▼▼▼▼
	public List<TrainerClassDto> Tag0(int beginRecord, int endRecord, String 족구);
	public int 족구TagCount();
	public int 축구TagCount();
	public int 농구TagCount();
	public int 볼링TagCount();
	public int 크로스핏TagCount();
	public int 스피닝TagCount();
	public int 댄스TagCount();
	public int 요가TagCount();
	public int 명상TagCount();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
