package com.koreait.project.yewon.dao;


import java.util.ArrayList;
import java.util.List;

import com.koreait.project.dto.Board_knowhowDto;


public interface KnowHowDao {
	
	public List<Board_knowhowDto> knowHowList();
	
	public int knowhowInsert(String knowhow_title, String knowhow_content);
	
	// 방금 작성완료 해서 insert된 게시글의 번호(no)를 가져오는 메소드
	public int findKnowhow_no(int user_no);
	
	public int knowhowInsert2(int knowhow_no, int tag_no);

	// public int knowhowInsert3(int tag_no, String tag_name);
	
	List<Board_knowhowDto> list = new ArrayList<Board_knowhowDto>();
	
	public Board_knowhowDto boardknowHowView(int knowhow_no);
		
	
	
	
	
	
	
	
	

	
	
	


	
	
	
	
}
