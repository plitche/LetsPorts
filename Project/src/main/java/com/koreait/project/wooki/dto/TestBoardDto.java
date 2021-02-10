package com.koreait.project.wooki.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TestBoardDto {
	private int no;
	private int user_no;
	private int temp_no;
	private String content;
}
