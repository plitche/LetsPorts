package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScrapDto {

	private int scrap_no;
	private int user_no;
	private int scrap_separator; // 노하우게시글:0, 트레이너:1, 커뮤니티:2
	private int scrap_referer_no;
	private Date end_gather_date;
	private Date created_at;
}
