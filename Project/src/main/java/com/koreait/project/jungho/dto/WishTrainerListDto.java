package com.koreait.project.jungho.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class WishTrainerListDto {
	
	private int scrap_referer_no;
	private String profile_photo;
	private String user_nickname;
	private String trainer_name;
	private String location1_name;
	private int location1_no;
	private String location2_name;
	private int location2_no;
	private String user_message;
	private int user_no;

}
