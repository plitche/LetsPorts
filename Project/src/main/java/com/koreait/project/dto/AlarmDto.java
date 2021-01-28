package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlarmDto {
	
	private int alarm_no;
	private int alarm_separator;	// 노하우:0, 질의응답:1, 커뮤니티:2, 트레이너:3
	private int alarm_referer_no;
	private String alarm_content;
	private int status;  // 읽음:0, 안읽음:1
	private Date created_at;
	
}
