package com.koreait.project.yongsoo.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewTemDto {
	
	private String user_nickname;
	
	private int review_no;
	private int target_user_no;
	private int score;
	private int meeting_no;
	private String content;
	private Date created_at;
	private int on_hide;
	private int writer_user_no;
	
	private int exercise_no;
	private String meeting_title;
	private int location1_no;
	private int location2_no;
	
	private String profile_photo;
	private String location1_name;
	private String location2_name;
	
	private String exercise_name;
	
	private String created_at2;
}
