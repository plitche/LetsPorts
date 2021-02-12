package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.dto.CommentTemDto;

public interface MeetingCommentDao {

	// 특정 모임 게시글에 달린 댓글 리스트를 불러오기 위한 메소드
	public List<CommentTemDto> getCommentList(int meeting_no, int commentPageNo);
	// 해당 질문에 달린 댓글 개수를 가져오기 위한 메소드
	public int getCommentCount(int meeting_no);
	
	// 특정 모임 게시글에 댓글을 추가하는 메소드
	public int addComment(CommentsDto commentsDto);
	
	// 댓글 삭제 메소드
	public int deleteComment(int comment_no);
	
}
