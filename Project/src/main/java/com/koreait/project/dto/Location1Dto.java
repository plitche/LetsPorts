package com.koreait.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Location1Dto {
	
	private int location1_no;
	private String location1_name;

	
	/*
	 * 0 : 서울특별시
	 * 1 : 인천광역시
	 * 2 : 경기도
	 */
}
