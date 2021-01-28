package com.koreait.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ExerciseDto {

	private int exercise_no;
	private String exercise_name;
	
	/*
	 * 0 : 족구
	 * 1 : 축구
	 * 2 : 농구
	 * 3 : 볼링
	 * 4 : 크로스핏
	 * 5 : 스피닝 
	 * 6 : 댄스
	 * 7 : 요가
	 * 8 : 명상
	 */
	
}
