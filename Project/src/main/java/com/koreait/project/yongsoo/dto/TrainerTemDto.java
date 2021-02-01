package com.koreait.project.yongsoo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TrainerTemDto {

	private int user_no;
	private String user_nickname;
	private String trainer_name;
	private String user_message;
	private String profile_photo;
	private int career;	// 1년,2년,3년 등 #연차로 표기
	private String employment;
	private String profile;
	private int location1_no;
	private int location2_no;
	private int score;
	private int reviews;
	
}
