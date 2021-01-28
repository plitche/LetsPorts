package com.koreait.project.Dto;

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
	private int is_published;
	private int is_answered;
	private String trainer_qna_answer;
	private Date answered_date;
	private int on_hide;
}
