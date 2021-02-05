package com.koreait.project.dto;

import lombok.Data;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommentsDto {

	private int comment_no;
	private int comment_referer_sep;	// 노하우:0, 질의응답:1, 커뮤니티:2
	private int comment_referer_no;
	private int board_user_no;
	private int user_no;
	private String comment_content;
	private Date created_at;
	private int on_hide;	// 숨김:1, 안숨김:0
}
