package com.koreait.project.hyejoon.dao;

import java.util.List;

import com.koreait.project.dto.ExerciseDto;
import com.koreait.project.dto.UsersDto;

public interface UsersDao {
	
	public UsersDto usersLogin(String email, String password); // 로그인 
	
	public int nickCheck(String user_nickname);	// 닉네임 체크
	
	public int emailCheck(String email);	// 이메일 중복 체크
	
	public String emailAuth(String email);	// 이메일 인증
	
	public UsersDto infoUdatePwCheck(String password);	// 정보 수정 전 비번 체크
	
	public List<ExerciseDto> exerciseChecked(int exercise_no);	// exercise 테이블에 저장할 exercise
	
}