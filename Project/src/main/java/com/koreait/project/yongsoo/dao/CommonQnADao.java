package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.Board_qnaDto;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.dto.BoardQnATemDto;
import com.koreait.project.yongsoo.dto.CommentTemDto;

public interface CommonQnADao {

	// 전체 목록 보여주기위한 메소드
	public int getQnACount();
	public List<BoardQnATemDto> getQnAList(int beginRecord, int endRecord); 
	// 해결 완료/미완료 에 따른 질문만 보여주기위한 메소드
	public int getIsSolvedQnACount(int is_solved);
	public List<BoardQnATemDto> getIsSolvedQnAList(int is_solved, int beginRecord, int endRecord);
	
	// 전체 목록 중 원하는 키워드를 포함할때 검색할 메소드
	// 1. 제목 + 내용
	public int getQnACount1(String searchKeyword);
	public List<BoardQnATemDto> getQnAListByKeyword1(int beginRecord, int endRecord, String searchKeyword);
	
	// 2. 제목만
	public int getQnACount2(String searchKeyword);
	public List<BoardQnATemDto> getQnAListByKeyword2(int beginRecord, int endRecord, String searchKeyword);
	
	// 3.  글작성자
	public int getQnACount3(String searchKeyword);
	public List<BoardQnATemDto> getQnAListByKeyword3(int beginRecord, int endRecord, String searchKeyword);
	
	// 질문 작성 완료 했을 때 insert하기 위한 메소드
	public int writeQnA(String board_qna_title, String board_qna_content, int user_no);
	public int lastQnANo(int user_no);
	public int updatePhotoTable(int lastQnANo, int temp_no);
	
	// 질문 제목 클릭시 해당 질문에 대한 정보를 가져오기 위한 메소드
	// 질문 뷰페이지에서 수정하기 버튼 클릭시 수정할 질문의 정보를 가져오기 위한 메소드
	public BoardQnATemDto getUpdateQnAInfo(int board_qna_no);
	
	// 질문 수정 시 update를 해주기위해 작동할 메소드
	public int updateQnA(Board_qnaDto board_qnaDto);
	
	// 질문 삭제 시 delete를 해주기위해 작동할 메소드
	public int deleteQnAInfo(int board_qna_no);
	
	// 질문 해결 완료 버튼 클릭시 작동할 메소드
	public int solveQnA(int board_qna_no);
	
	
	// 해당 질문에 달린 댓글 list를 가져오기 위한 메소드
	public List<CommentTemDto> getQnACommnetList(int qnaNo, int commentPageNo);
	// 해당 질문에 달린 댓글 개수를 가져오기 위한 메소드
	public int getQnACommentCount(int qnaNo);
	
	// 질문에 댓글 작성 후 작성완료 클릭시 insert 해주기 위한 메소드
	public int addQnACommnet(CommentsDto commentsDto);
	
	// 질문 댓글 수정완료 버튼 클릭시 update 해주기 위한 메소드
	public int updateQnAComment(int comment_no, String comment_content);
	
	// 질문 댓글 삭제버튼 클릭 시 delete 해주기 위한 메소드
	public int deleteQnAComment(int qnaComment_no);
	
	
	
}
