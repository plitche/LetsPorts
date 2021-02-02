package com.koreait.project.jungho.dao;

import java.util.List;

import com.koreait.project.dto.CommentsDto;

public interface TrainerClassCommentDao {

	public List<CommentsDto> commentList(int meeting_no);
	
	public int commentInsert(CommentsDto commentsDto);
	
	public int commentDelete(int comment_no);
	
	public int commentUpdate(CommentsDto commentsDto);
	
	
}
