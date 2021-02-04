package com.koreait.project.wooki.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Trainer_infoDto {
	
	private int	trainer_no;
	private int user_no;
	private int career;	// 1년,2년,3년 등 #연차로 표기
	private String trainer_name;
	private String certificate_filename;
	private String employment;
	private String profile;
	private Timestamp created_at;

}
