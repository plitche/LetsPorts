package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class MeetingDto {
	
	private int meeting_no;
	private int user_no;
	private int meeting_max;
	private int meeting_min;
	private int exercise_no;
	private Date created_at;
	private Date start_gather_date;
	private Date end_gather_date;
	private Date meeting_date;
	private int location1_no;
	private int location2_no;
	private String meeting_title;
	private String meeting_content;
	private int is_progress;	// 모임 진행 여부 ??
	private String cancel_reason;
	private int on_hide;
	private String detail_location;
	private int meeting_hit;
	
}
