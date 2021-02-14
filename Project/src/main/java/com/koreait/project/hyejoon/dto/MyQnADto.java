package com.koreait.project.hyejoon.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MyQnADto {
	private String board_qna_title;
	private int comment_count;
	private int board_qna_no;
	private Timestamp created_at;
	
}
