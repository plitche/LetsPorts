package com.koreait.project.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Trainer_qnaDto {

	private int trainer_qna_no;
	private int question_user_no;
	private int trainer_user_no;
	private String trainer_qna_title;
	private String trainer_qna_content;
	private Timestamp created_at;
	private int is_published;	// 공개:0, 비공개:1
	private int is_answered;	// 답변아직:0, 답변완료:1 
	private String trainer_qna_answered;
	private Timestamp answered_date;
	private int on_hide;	// 안숨김:0, 숨김:1
	
	private String created_at2;
	private String answered_date2;
}
