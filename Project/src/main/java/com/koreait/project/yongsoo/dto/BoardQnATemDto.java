package com.koreait.project.yongsoo.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardQnATemDto {

	private int board_qna_no;
	private String board_qna_title;
	private String board_qna_content;
	private int user_no;
	private Timestamp created_at;
	private int is_resolved;	// 완료:1, 계속받겠다:0
	private Timestamp resolve_date;
	private int on_hide;
	
	private String user_nickname;
	private int user_separator;
	private String profile_photo;
	
	private String created_at2;
	private String resolve_date2;
	
}
