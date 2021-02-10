package com.koreait.project.wooki.dao;

import com.koreait.project.wooki.dto.TempBoardDto;
import com.koreait.project.wooki.dto.TestBoardDto;

public interface EditorDao {
	public int insertTempBoard(int user_no);
	public TempBoardDto selectTempBoard(int user_no);
	public int insertTempPhoto(int temp_no, int user_no, String uploadFilename);
	public int deleteTempPhoto(String[] list);
	
	// 게시글 인서트
	public int insertBoard(TestBoardDto testBoardDto);
	// 인서트한 게시글 번호 및 구분자로 photo table 업데이트
	public int updatePhoto(TestBoardDto testBoardDto);
	// view 테스트
	public TestBoardDto view(int no);
}
