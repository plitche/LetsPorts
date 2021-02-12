package com.koreait.project.wooki.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class is_reviewedDto {
	private int is_reviewed_no;
	private int meeting_no;
	private int target_user_no;
	private int writer_user_no;
	private int status;
}
