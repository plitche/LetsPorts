package com.koreait.project.hyejoon.dao;

import java.util.List;

import com.koreait.project.hyejoon.dto.LoginDto;

public interface LoginDao {
	
	public List<LoginDto> userList(); 
	
}
