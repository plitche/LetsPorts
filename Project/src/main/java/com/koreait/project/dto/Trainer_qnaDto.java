package com.koreait.project.dto;

import java.sql.Date;

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
	private Date created_at;
	private int is_published;	// 공개:1, 비공개:0
	private int is_answered;	// 답변완료:1, 답변아직:0
	private String trainer_qna_answered;
	private Date answered_date;
	private int on_hide;	// 숨김:1, 안숨김:0
}
