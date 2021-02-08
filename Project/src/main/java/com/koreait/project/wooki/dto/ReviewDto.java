package com.koreait.project.wooki.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {
	
	private int review_no;
	private int target_user_no;
	private int score;
	private int meeting_no;
	private String content;
	private Timestamp created_at;
	private int on_hide;
	private int writer_user_no;

}
