package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Trainer_infoDto {
	
	private int	trainer_no;
	private int user_no;
	private int career;	// 1년,2년,3년 등 #연차로 표기
	private String trainer_name;
	private String certificate_filename;
	private String employment;
	private String profile;
	private Date created_at;

}
