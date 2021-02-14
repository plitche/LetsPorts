package com.koreait.project.hyejoon.dao;

import java.util.List;

import com.koreait.project.hyejoon.dto.MeetingListingDto;
import com.koreait.project.hyejoon.dto.UserUpdateDto;

public interface WookiClientDao {

	public int preparingTotalRecord(int user_no);
	public List<MeetingListingDto> preparingMeetingList(int user_no, int beginRecord, int endRecord);
	public UserUpdateDto updateUserInfo(int user_no);
	public String updateUserInterest(int user_no);
	
	public int userUpdate(UserUpdateDto userUpdateDto);
	public int deleteInterest(int user_no);
	public int insertNewInterest(int user_no, int exercise_no);
	
}
