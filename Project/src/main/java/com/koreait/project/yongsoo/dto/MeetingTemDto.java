package com.koreait.project.yongsoo.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MeetingTemDto {

	private int user_no;
	private String user_nickname;
	private String user_message;
	private String profile_photo;
	private int meeting_no;
	private String meeting_title;
	private Timestamp meeting_date;
	private Timestamp start_gather_date;
	private Timestamp end_gather_date;
	private int exercise_no;
	private String exercise_name;
	private Timestamp created_at;
	private int meeting_max;
	private int meeting_min;
	private String photo_filename;
	private int location1_no;
	private String location1_name;
	private int location2_no;
	private String location2_name;
	
	private String meeting_date2;
	private String start_gather_date2;
	private String end_gather_date2;
}
