package com.koreait.project.jungho.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	private String[] materials_name; // join 대상자
	private String meeting_content;
	private String exercise_name;
	private String location1_name;
	private String location2_name;
	private String user_nickname;
	private String user_message;
	private String profile_photo;
	private String email;
	private int meeting_hit;
	private MultipartFile mainPhoto;
	private String photo_filename;

}
