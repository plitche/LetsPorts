package com.koreait.project.hyejoon.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class UserUpdateDto {
	private int user_no;
	private String user_nickname;
	private String password;
	private int location1_no;
	private int location2_no;
	private String interest_list;
	
}
