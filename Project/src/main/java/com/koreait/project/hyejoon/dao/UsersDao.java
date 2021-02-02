package com.koreait.project.hyejoon.dao;

import com.koreait.project.hyejoon.dto.UsersDto;

public interface UsersDao {
	
	public UsersDto usersLogin(UsersDto usersDto);

	public UsersDto usersLogin2(String email, String password);
	
}
