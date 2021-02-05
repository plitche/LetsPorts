package com.koreait.project.wooki.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CommentsDto {

	private int comment_no;
	private int comment_referer_sep;	// 노하우:0, 질의응답:1, 커뮤니티:2
	private int comment_referer_no;
	private int user_no;
	private String comment_content;
	private Timestamp created_at;
	private int on_hide;	// 숨김:1, 안숨김:0
}
