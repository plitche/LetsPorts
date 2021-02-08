package com.koreait.project.yewon.dao;

import java.util.List;

import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yewon.dto.knowhowClassDto;

public interface KnowhowCommentDao {
	//
	public List<CommentsDto> commentList(int comment_no);
	
	//
	public int commentInsert(knowhowClassDto commentsDto);
	
	//
	public int commentDelete(int comment_no);
	
	//
	public int commentUpdate(String comment_content, int comment_no);
	
}
