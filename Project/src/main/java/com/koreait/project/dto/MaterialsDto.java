package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class MaterialsDto {

	private int materials_no;
	private int meeting_no;
	private String materials_name;
	private Date created_at;
	
}
