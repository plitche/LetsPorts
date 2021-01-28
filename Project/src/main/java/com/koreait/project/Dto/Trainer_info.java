package com.koreait.project.Dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Trainer_info {
	
	private int	trainer_no;
	private int user_no;
	private int career;
	private String trainer_name;
	private String certificate_filename;
	private String employment;
	private String profile;
	private Date created_at;

}
