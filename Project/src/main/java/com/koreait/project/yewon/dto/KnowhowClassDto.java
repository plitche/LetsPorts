package com.koreait.project.yewon.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class KnowhowClassDto {
	
	private int comment_no;
	private int comment_referer_sep;	// 노하우:0, 질의응답:1, 커뮤니티:2
	private int comment_referer_no;
	private int board_user_no;
	private int user_no;
	private String comment_content;
	private Date created_at;
	private int on_hide;	// 숨김:1, 안숨김:0
	
	private String user_nickname; // 유저 정보 테이블 조인
	private String profile_photo; // 유저 정보 테이블 조인
	
	
}
