package com.koreait.project.wooki.dao;

import java.util.List;

import com.koreait.project.wooki.dto.BoardsDto;
import com.koreait.project.wooki.dto.CommentsDto;
import com.koreait.project.wooki.dto.CreateUserCountDto;
import com.koreait.project.wooki.dto.PhotoDto;
import com.koreait.project.wooki.dto.ReviewDto;
import com.koreait.project.wooki.dto.Trainer_infoDto;
import com.koreait.project.wooki.dto.Trainer_qnaDto;
import com.koreait.project.wooki.dto.UsersDto;
import com.koreait.project.wooki.dto.is_reviewedDto;

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
	// 댓글 삭제 메소드
	public int deleteComment(int comment_no);
	// 전체 리뷰 리스트
	public int totalReviewRecord();
	public List<ReviewDto> reviewList(int beginRecord, int endRecord);
	// 리뷰 필터 리스트(검색테이블 + 검색어)
	public int totalReviewRecordFilterQuery(String reviewSep, String query);
	public List<ReviewDto> reviewListFilterQuery(int beginRecord, int endRecord, String reviewSep, String query);
	// 리뷰 숨김, 보이기
	public int reviewOnHideToggle(int review_no, int on_hide);
	// 전체 트레이너문의 리스트
	public int totalTQnARecord();
	public List<Trainer_qnaDto> tQnAList(int beginRecord, int endRecord);
	// 트레이너문의 필터 리스트(검색테이블 + 검색어)
	public int totalTQnARecordFilterQuery(String tQnASep, String query);
	public List<Trainer_qnaDto> tQnAListFilterQuery(int beginRecord, int endRecord, String tQnASep, String query);
	// 트레이너문의 답변 업데이트
	public int tAnswerdUpdate(int trainer_qna_no, String trainer_qna_answered);
	// 트레이너문의 숨김, 보이기
	public int tQnAOnHideToggle(int trainer_qna_no, int on_hide);
	// 전체 사진 리스트
	public int totalPhotoRecord();
	public List<PhotoDto> photoList(int beginRecord, int endRecord);
	// 사진 필터 리스트(게시글종류)
	public int totalPhotoRecordFilterAll(int photoSep);
	public List<PhotoDto> photoListFilterAll(int beginRecord, int endRecord, int photoSep);
	// 사진 필터 리스트(게시글종류 + 검색어)
	public int totalPhotoRecordFilterQuery(int photoSep, String columnName, String query);
	public List<PhotoDto> photoListFilterQuery(int beginRecord, int endRecord, int photoSep, String columnName, String query);
	// 사진 숨김, 보이기
	public int photoOnHideToggle(int photo_no, int on_hide);
	// 리뷰작성 대상 유저 리스트
	public List<is_reviewedDto> selectReviewTargetUser();
	// 리뷰작성 대상 테이블 인서트
	public int insertIsReviewed(List<is_reviewedDto> list);
	// 미팅 is_progress 상태 업데이트(1)
	public int updateMeetingIsProgress1();
	// 미팅 is_progress 상태 업데이트(2)
	public int updateMeetingIsProgress2();
	// 최근30일 일별회원수
	public List<CreateUserCountDto> dailyCreateUserCount();
	//  30일전 누적회원수
	public int beforeTotalUser();
}
