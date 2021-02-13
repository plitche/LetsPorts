package com.koreait.project.wooki.command;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.is_reviewedDto;

public class InsertIsReviewedCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		
		/*
			1. 모임(meeting_date)가 오늘과 같거나 이전인 경우
			2. 모임진행여부(is_progress)가 0인 경우
			3. 진행 최소 인원 보다 참가승인된 사람이 더 많은경우
			4. 진행 유저가 트레이너인 모임
			5. 1~4의 조건 중 모임주최자가 아닌 모임참가유저
		*/
		List<is_reviewedDto> list = wookiDao.selectReviewTargetUser();
		if(list.size() > 0) {
			// is_reviewed 테이블에 받아온 인서트 유저 데이터를 추가해준다.
			wookiDao.insertIsReviewed(list);
			
			/*
			1. 모임(meeting_date)가 오늘과 같거나 이전인 경우
			2. 모임진행여부(is_progress)가 0인 경우
			3. 진행 최소 인원 보다 참가승인된 사람이 더 많은경우는 is_progress = 1
			 */
			wookiDao.updateMeetingIsProgress1();
			
			/*
			1. 모임 모집 마감일이(end_gather_date)가 오늘보다 작은경우(이전)
			2. 모임진행여부(is_progress)가 0인 경우
			3. 진행 최소 인원 보다 참가승인된 사람이 더 적은경우는 is_progress = 2
			 */
			wookiDao.updateMeetingIsProgress2();
		}
	}
}
