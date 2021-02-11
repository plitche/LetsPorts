package com.koreait.project.jungho.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class WishClassListDto {

	private int scrap_referer_no; // 찜을 당한 모임번호
	private int user_no;	// 찜한 사람의 유저번호
	private int scrap_user_no;	  // 찜을 당한 유저번호
	Date end_gather_date;	// 찜 당한 모임의 마감일
	
}
