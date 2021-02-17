package com.koreait.project.jungho.dao;

import java.util.List;

import com.koreait.project.dto.CommentsDto;
import com.koreait.project.jungho.dto.MeetingCommentDto;

public interface TrainerClassCommentDao {

	public List<MeetingCommentDto> commentList(int beginRecord, int endRecord, int meeting_no);
	
	public int commentCount(int meeting_no);
	
	public int commentInsert(CommentsDto commentsDto);
	
	public int commentDelete(int comment_no);
	
	public int commentUpdate(String comment_content, int comment_no);
	
	
}
