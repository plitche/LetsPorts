package com.koreait.project.Dto;

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
	private int is_resolved;
	private Date resolve_date;
	private int on_hide;
}
