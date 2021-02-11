package com.koreait.project.jungho.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class WishClassListDto {

	private int meeting_no;
	private int user_no;
	private int scrap_user_no;
	Date end_gather_date;
	
}
