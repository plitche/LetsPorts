package com.koreait.project.hyejoon.dao;

import java.util.List;

import com.koreait.project.dto.Trainer_infoDto;
import com.koreait.project.hyejoon.dto.MeetingListingDto;
import com.koreait.project.hyejoon.dto.MyQnADto;
import com.koreait.project.hyejoon.dto.UserUpdateDto;

public interface WookiClientDao {

	public int totalRecord(int user_no, int is_progress);
	public List<MeetingListingDto> meetingList(int user_no, int beginRecord, int endRecord, int is_progress);
	
	public int totalMyQnARecord(int user_no);
	public List<MyQnADto> myQnAList(int user_no, int beginRecord, int endRecord);
	
	public UserUpdateDto updateUserInfo(int user_no);
	public String updateUserInterest(int user_no);
	
	public int userUpdate(UserUpdateDto userUpdateDto);
	public int deleteInterest(int user_no);
	public int insertNewInterest(int user_no, int exercise_no);
	
	public int updateTrainerUser(int user_no);
	public int insertTrainer(Trainer_infoDto trainer_infoDto);
}
