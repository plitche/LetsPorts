package com.koreait.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class Meeting_participantsDto {

	private int participants_no;
	private int meeting_no;
	private int user_no;
	private Date created_at;
	private int status;	// 신청완료:0, 참가승인:1, 참가거절:2
	private String reject_reason;
}
