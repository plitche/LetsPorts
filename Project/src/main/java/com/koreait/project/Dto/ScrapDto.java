package com.koreait.project.Dto;

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
	private int scrap_separator;
	private int scrap_referer_no;
	private Date end_gather_date;
	private Date created_at;
}
