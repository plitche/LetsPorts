package com.koreait.project.wooki.dao;

import java.util.List;

import com.koreait.project.wooki.dto.UsersDto;

public interface WookiDao {
	public UsersDto adminLogin(UsersDto usersDto);
	public int totalRecord();
	public List<UsersDto> userList(int beginRecord, int endRecord);
	public int filterTotalRecord(String text_filter, String search, String user_separator);
	public List<UsersDto> filterUserList(int beginRecord, int endRecord, String text_filter, String search, String user_separator);
	public int changeEmailIsPossible(String email);
	public int changeEmail(UsersDto usersDto);
	public int updateTempPass(UsersDto usersDto);
}
