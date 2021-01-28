package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {
	
	private int review_no;
	private int target_user_no;
	private int score;
	private int meeting_no;
	private String content;
	private Date created_at;
	private int on_hide;
	private int writer_user_no;

}
