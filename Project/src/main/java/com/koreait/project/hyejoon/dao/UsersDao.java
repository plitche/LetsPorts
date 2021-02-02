package com.koreait.project.hyejoon.dao;

import com.koreait.project.hyejoon.dto.UsersDto;

public interface UsersDao {
	
	public UsersDto usersLogin(String email, String password);
	
}