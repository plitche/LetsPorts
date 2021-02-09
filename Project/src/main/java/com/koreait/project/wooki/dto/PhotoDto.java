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
public class PhotoDto {

	private int photo_no;
	private int photo_referer_sep;	// 노하우:0, 질의응답:1, 커뮤니티:2	
	private int photo_referer_no;
	private String photo_filename;
	private Timestamp created_at;
	private int on_hide;	// 숨김:1, 안숨김:0
	private int user_no;
	
}
