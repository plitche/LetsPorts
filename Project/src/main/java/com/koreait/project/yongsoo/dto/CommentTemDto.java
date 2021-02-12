package com.koreait.project.yongsoo.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentTemDto {

	private int comment_no;
	private int comment_referer_sep;	// 노하우:0, 질의응답:1, 커뮤니티:2
	private int comment_referer_no;
	private int user_no;
	private String comment_content;
	private Timestamp created_at;
	private int on_hide;	// 숨김:1, 안숨김:0
	private String user_nickname;
	private String profile_photo;
	
	private String created_at2;
}
