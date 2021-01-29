package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board_knowhowDto {

	private int knowhow_no;
	private String knowhow_title;
	private String knowhow_content;
	private Date created_at;
	private int user_no;
	private int user_separator;
	private int on_hide;
	private int knowhow_hit;
	
}
