package com.koreait.project.jungho.dao;

import java.sql.Date;
import java.util.List;

import com.koreait.project.jungho.dto.TrainerClassDto;
import com.koreait.project.jungho.dto.WishClassListDto;

public interface WishClassListDao {

	// 모든 유저들이 찜한 갯수를 가져온다
	public int WishClassListTotal(int scrap_referer_no);
	// 로그인된 유저가 찜했던 모임정보를 뿌려준다.
	public List<TrainerClassDto> WishClassListList(int user_no);
	// 찜한 리스트를 db에 삽입한다.
	public int WishClassInsert(int user_no, int scrap_referer_no, Date end_gather_date);
	// 다시 클릭했을 때 리스트 삭제한다.
	public int WishClassDelete(int meeting_no);
	
}
