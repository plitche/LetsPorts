package com.koreait.project.hyejoon.dao;

import java.util.List;

import com.koreait.project.dto.User_interestDto;
import com.koreait.project.dto.UsersDto;

public interface UsersDao {
	// 로그인
	public UsersDto usersLogin(String email, String password); // 로그인 
	public int updateTempPw(String email, String password);	// 임시 비번으로 비번 수정할 메소드
	
	// 회원가입
	public int nickCheck(String user_nickname);	// 닉네임 중복 체크
	public int emailCheck(String email);	// 이메일 중복 체크
	public String emailAuth(String email);	// 이메일 인증
	public int insertJoin(UsersDto usersDto);	// 회원가입
	
	public int getUserNo(String email);	// 이메일 정보 일치 확인으로 user_no 얻을 메소드
	public int insertExerciseList(int user_no, int exercise_no);	// 관심 분야 유저번호와 운동종목을 저장할 메소드
	public String getExerciseName(int exercise_no);
	
	// 마이페이지
	public int userProfilePhotoUpdate(int user_no, String uploadFilename);	// 프로필 사진 업로드
	public int userProfilePhotoBlankUpdate(int user_no);	// 기본사진으로 돌리기
	public UsersDto getUserSession(int user_no); // 사진업로드 후 유저세션 업로드용
	public int userCheck(String email);	// 유저여부 체크
	public List<User_interestDto> userUpdateInterest(int user_no);	// 회원정보수정페이지 보여주기(user_interest 테이블용)
	
	public int updateAccount(UsersDto usersDto);	// 회원 정보 수정
	
	public UsersDto deleteAccount(int user_no);	// 회원 탈퇴
	
	public int updateMsg(int user_no, String user_message);	// 상태메세지 수정
	
	public int viewMeetingInfo(int user_no);	// 탭 모임 정보 가져오기
	
}