package com.koreait.project.Dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PhotoDto {

	private int photo_no;
	private int photo_referer_sep;
	private int photo_referer_no;
	private String photo_filename;
	private Date created_at;
	private int on_hide;
	
}
