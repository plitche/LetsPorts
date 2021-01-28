package com.koreait.project.Dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlertDto {
	
	private int alert_no;
	private int alert_separator; 	// 노하우:0, 질의응답:1, 커뮤니티:2, 트레이너:3
	private int alert_referer_no;
	private String alert_content;
	private int status;	// 읽음:0, 안읽음:1
	private Date created_at;
	
}
