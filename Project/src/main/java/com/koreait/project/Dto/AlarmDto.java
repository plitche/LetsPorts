package com.koreait.project.Dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlarmDto {
	
	private int alarm_no;
	private int alarm_separator;
	private int alarm_referer_no;
	private String alarm_content;
	private int status;
	private Date created_at;
	
}
