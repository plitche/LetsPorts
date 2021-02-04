package com.koreait.project.yongsoo.dto;

import java.util.Date;

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
	private int meeting_no;
	private String meeting_title;
	private Date meeting_date;
	private int exercise_no;
	private Date created_at;
	private int meeting_max;
	private int meeting_min;
}
