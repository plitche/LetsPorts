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
	
	// 게시판 제목 클릭하면 view페이지로 넘어가고 knowhow_no랑 일치하는 게시물 정보 가져오기
	public Board_knowhowDto knowHowView(int knowhow_no);
	
	// 게시판 수정 완료 후 viewPage 게시판으로 넘어가는 정보
	public void knowHowUpdate(String knowhow_title, String knowhow_content, int knowhow_no);

	// viewPage에서 삭제 한 후 데이터 없애기
	public int knowHowDelete(int knowhow_no);
	
	// 조회수 증가
	public int addhit(int knowhow_no);
	
}
