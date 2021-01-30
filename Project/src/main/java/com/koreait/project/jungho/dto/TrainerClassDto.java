package com.koreait.project.jungho.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TrainerClassDto {
	
	private int meeting_no;
	private int user_no;
	private String meeting_title;
	private Date meeting_date;
	private Date start_gather_date;
	private Date end_gather_date;
	private int meeting_min;
	private int meeting_max;
	private int exercise_no;
	private int location1_no;
	private int location2_no;
	private String detail_location;
	private String[] materialList; // join 대상자
	private String meeting_content;
	

}
