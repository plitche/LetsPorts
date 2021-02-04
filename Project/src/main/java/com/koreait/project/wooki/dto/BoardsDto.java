package com.koreait.project.wooki.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class BoardsDto {
	private int board_no;			// 게시글번호
	private int board_sep;			// 게시글 구분자 노하우 : 0, 질문과답변게시판 : 1, 미팅 : 2
	private String board_title;		// 게시글 제목
	private int user_no;			// 작성자 유저번호
	private Timestamp created_at;	// 작성일자
	private int on_hide;			// 숨김여
}
