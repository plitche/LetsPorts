package com.koreait.project.yewon.dao;


import java.util.List;

import com.koreait.project.dto.Board_knowhowDto;


public interface KnowHowDao {

	public List<Board_knowhowDto> knowHowList();
	
	public int knowhowInsert(String knowhow_title, String knowhow_content);
	
	public int knowhowInsert2(int knowhow_tag_no, int knowhow_no, int tag_no);

	public int knowhowInsert3(int tag_no, String tag_name);
	
	
	// public Board_knowhowDto boardknowHowView(int no);
		
	


	
	
	
	
}
