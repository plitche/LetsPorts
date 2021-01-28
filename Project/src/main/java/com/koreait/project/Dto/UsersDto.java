package com.koreait.project.Dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UsersDto {

	private int user_no;
	private String email;
	private String password;
	private int user_separator;
	private Date create_at;
	private Date last_login;
	private int login_count;
	private int login_attempt;   // login_attemps -> login_attempt  수정완료
	private int disable;
	private String user_reg_method;
	private String user_nickname;
	private String user_profile; // 수정해야될 부분?
	private String profile_photo;
	private int birth_year;
	private int birth_month;
	private int birth_day;
	private int location1_no;
	private int location2_no;

}
