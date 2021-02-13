package com.koreait.project.yongsoo.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CreateNewMeetingDto {

	private int meeting_no;
	private int user_no;
	private String meeting_title;
	private String meeting_content;
	private Date meeting_date;
	private Date start_gather_date;
	private Date end_gather_date;
	private int meeting_max;
	private int meeting_min;
	private int exercise_no;
	private int location1_no;
	private String location1_name;
	private int location2_no;
	private String location2_name;
	private String detail_location;
	private String photo_filename;
	private MultipartFile mainPhoto;
	private String[] materialList;
	
	private String meeting_date2;
	private String start_gather_date2;
	private String end_gather_date2;
	
}
