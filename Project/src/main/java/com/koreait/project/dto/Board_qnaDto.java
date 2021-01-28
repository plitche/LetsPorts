package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board_qnaDto {

	private int board_qna_no;
	private String board_qna_title;
	private String board_qna_content;
	private int user_no;
	private Date created_at;
	private int is_resolved;	// 완료:1, 계속받겠다:0
	private Date resolve_date;
	private int on_hide;
}
