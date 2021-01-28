package com.koreait.project.Dto;

import lombok.Data;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommentsDto {

	private int comment_no;
	private int comment_referer_sep;
	private int comment_referer_no;
	private int user_no;
	private String comment_content;
	private Date created_at;
	private int on_hide;
}
