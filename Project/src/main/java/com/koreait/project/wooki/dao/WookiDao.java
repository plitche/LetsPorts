package com.koreait.project.wooki.dao;

import java.util.List;

import com.koreait.project.wooki.dto.BoardsDto;
import com.koreait.project.wooki.dto.CommentsDto;
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
	// 전체 게시글 리스트
	public int totalBoardsRecord();
	public List<BoardsDto> boardsList(int beginRecord, int endRecord);
	// 게시글 필터 리스트(게시글종류)
	public int totalBoardsRecordFilterAll(int boardSep);
	public List<BoardsDto> boardsListFilterAll(int beginRecord, int endRecord, int boardSep);
	// 게시글 필터 리스트(게시글종류 + 검색어)
	public int totalBoardsRecordFilterQuery(int boardSep, String columnName, String query);
	public List<BoardsDto> boardsListFilterQuery(int beginRecord, int endRecord, int boardSep, String columnName, String query);
	// 게시글 숨김, 보이기
	public int boardsOnHideToggle(int board_sep, int board_no, int on_hide);
	// 게시글 삭제 선행 삭제테이블
	public int boardDeleteBeforeScrap(int board_sep, int board_no);
	public int boardDeleteBeforeComments(int board_sep, int board_no);
	public String[] boardDeleteBeforePhotoList(int board_sep, int board_no);
	public int boardDeleteBeforePhoto(int board_sep, int board_no);
	public int boardDeleteBeforeAlarm(int board_no);
	// 게시글 삭제 메소드
	public int boardDelete(int board_sep, int board_no);
	// 전체 댓글 리스트
	public int totalCommentsRecord();
	public List<CommentsDto> commentsList(int beginRecord, int endRecord);
	// 댓글 필터 리스트(게시글종류)
	public int totalCommentsRecordFilterAll(int commentSep);
	public List<CommentsDto> commentsListFilterAll(int beginRecord, int endRecord, int commentSep);
	// 댓글 필터 리스트(게시글종류 + 검색어)
	public int totalCommentsRecordFilterQuery(int commentSep, String columnName, String query);
	public List<CommentsDto> commentsListFilterQuery(int beginRecord, int endRecord, int commentSep, String columnName, String query);
	// 댓글 숨김, 보이기
	public int commentsOnHideToggle(int comment_no, int on_hide);
}
