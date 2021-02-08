package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.Board_qnaDto;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.dto.CommentTemDto;
import com.koreait.project.yongsoo.dto.QnATemDto;

public interface CommonQnADao {

	// 전체 목록 보여주기위한 메소드
	public List<QnATemDto> getQnAList(); 
	
	// 질문 작성 완료 했을 때 insert하기 위한 메소드
	public int writeQnA(String board_qna_title, String board_qna_content, int user_no);
	
	// 질문 뷰페이지에서 수정하기 버튼 클릭시 수정할 질문의 정보를 가져오기 위한 메소드 
	// 질문 제목 클릭시 해당 질문에 대한 정보를 가져오기 위한 메소드
	public QnATemDto getUpdateQnAInfo(int board_qna_no);
	
	// 질문 수정 시 update를 해주기위해 작동할 메소드
	public int updateQnA(Board_qnaDto board_qnaDto);
	
	// 질문 삭제 시 delete를 해주기위해 작동할 메소드
	public int deleteQnAInfo(int board_qna_no);
	
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
