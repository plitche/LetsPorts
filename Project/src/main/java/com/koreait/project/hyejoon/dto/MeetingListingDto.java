package com.koreait.project.hyejoon.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class MeetingListingDto {

	private String meeting_filename;
	private String meeting_title;
	private String exercise_name;
	private int min;
	private int max;
	private String location1;
	private String location2;
	private Timestamp meeting_date;
	private String profile_filename;
	private String nickname;
	private int meeting_no;
}
