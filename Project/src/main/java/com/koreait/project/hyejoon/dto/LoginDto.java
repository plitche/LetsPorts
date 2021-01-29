package com.koreait.project.hyejoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class LoginDto {

	private int user_no;
	private String email;
	private String password;
	
}
