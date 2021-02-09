package com.koreait.project.yewon.dao;

import java.util.List;

import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yewon.dto.KnowhowClassDto;

public interface KnowHowCommentDao {
	//
	public List<CommentsDto> commentList(int comment_no);
	
	//
	public int commentInsert(KnowhowClassDto commentsDto);
	
	//
	public int commentDelete(int comment_no);
	
	//
	public int commentUpdate(String comment_content, int comment_no);
	
}
