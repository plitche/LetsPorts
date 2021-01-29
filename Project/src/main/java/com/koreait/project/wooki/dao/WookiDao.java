package com.koreait.project.wooki.dao;

import java.util.List;

import com.koreait.project.wooki.dto.UsersDto;

public interface WookiDao {
	public UsersDto adminLogin(UsersDto usersDto);
	public int totalRecord();
	public List<UsersDto> memberList(int beginRecord, int endRecord);
}
