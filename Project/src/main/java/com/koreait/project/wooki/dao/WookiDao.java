package com.koreait.project.wooki.dao;

import java.util.List;

import com.koreait.project.wooki.dto.BoardsDto;
import com.koreait.project.wooki.dto.Trainer_infoDto;
import com.koreait.project.wooki.dto.UsersDto;

public interface WookiDao {
	public UsersDto adminLogin(UsersDto usersDto);
	public int totalRecord();
	public List<UsersDto> userList(int beginRecord, int endRecord);
	public int filterTotalRecord(String text_filter, String search, String user_separator);
	public List<UsersDto> filterUserList(int beginRecord, int endRecord, String text_filter, String search, String user_separator);
	public int changeEmailIsPossible(String email);
	public int changeEmail(UsersDto usersDto);
	public int updateTempPass(UsersDto usersDto);
	public List<UsersDto> adminList();
	public int updateNormalUser(int user_no);
	public UsersDto checkUser(int user_no);
	public int updateAdminUser(int user_no);
	// deleteUser를 하기 위한 사전작업
	public String[] deleteUserPhotoList(int user_no);
	public int deleteUserAlaram(int user_no);
	// deleteUser 실행메소드
	public int deleteUser(int user_no);
	public int totalTrainerRecord();
	public List<Trainer_infoDto> trainerUserList(int beginRecord, int endRecord);
	public int filterTotalTrainerRecord(int search);
	public List<Trainer_infoDto> filterTrainerUserList(int beginRecord, int endRecord, int search);
	public String getEmail(int user_no);
	// deleteTrainer를 하기 위한 사전작업
	public String deleteTrainerCertificateFilename(int user_no);
	public int deleteTrainerUserSeparatorUpdate(int user_no);
	public int deleteTrainerScrap(int user_no);
	public int deleteTrainerQNAAlarm(int user_no);
	// deleteTrainer 실행메소드
	public int deleteTrainer(int user_no);
	public List<BoardsDto> boardsList(int beginRecord, int endRecord);
	public int totalBoardsRecord();
}
