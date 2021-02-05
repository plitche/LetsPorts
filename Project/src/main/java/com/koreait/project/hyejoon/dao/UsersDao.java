package com.koreait.project.hyejoon.dao;

import com.koreait.project.dto.UsersDto;

public interface UsersDao {
	
	public UsersDto usersLogin(String email, String password); // 로그인 
	
	public int nickCheck(String user_nickname);	// 닉네임 체크
	
	public int pwCheck(String password);	// 비밀번호 유효성 체크
	
}