package com.koreait.project.hyejoon.dao;

import com.koreait.project.dto.UsersDto;

public interface UsersDao {
	
	public UsersDto usersLogin(String email, String password); // 로그인 
	
	public int nickCheck(String user_nickname);	// 닉네임 중복 체크
	
	public int emailCheck(String email);	// 이메일 중복 체크
	
	public String emailAuth(String email);	// 이메일 인증
	
	public int insertJoin(UsersDto usersDto);	// 회원가입
	
	public int getUserNo(String email);	// 이메일 정보 일치 확인으로 user_no 얻을 메소드
	public int insertExerciseList(int user_no, int exercise_no);	// 관심 분야 유저번호와 운동종목을 저장할 메소드
	
	public int userCheck(String email);	// 유저여부 체크
	public int updateTempPw(String email, String password);	// 임시 비번으로 비번 수정할 메소드
	
	public int updateAccount(UsersDto usersDto);	// 회원 정보 수정
	
	public int deleteAccount(int user_no);	// 회원 탈퇴
	
}