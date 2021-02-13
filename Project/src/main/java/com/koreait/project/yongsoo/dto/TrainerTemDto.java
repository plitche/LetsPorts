package com.koreait.project.yongsoo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TrainerTemDto {

	private int user_no;
	private int user_separator;
	private String user_nickname;
	private String profile_photo;
	private String trainer_name;
	private String user_message;
	private int career;	// 1년,2년,3년 등 #연차로 표기
	private String employment;
	private String profile;
	private int location1_no;
	private String location1_name;
	private int location2_no;
	private String location2_name;
	private Double score;
	private int reviews;
	private int scrap_referer_no;
	private String[] exercise_name;
}