package com.koreait.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Is_reviewedDto {

	private int is_reviewed_no;
	private int meeting_no;
	private int target_user_no;
	private int writer_user_no;
	private int status;	// 작성가능:0, 작성거부:1, 작성완료2
	
}
