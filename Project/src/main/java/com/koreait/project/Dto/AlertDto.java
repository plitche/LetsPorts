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
	private int alert_separator;
	private int alert_referer_no;
	private String alert_content;
	private int status;
	private Date created_at;
	
}
