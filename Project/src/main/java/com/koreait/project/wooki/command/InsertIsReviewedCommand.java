package com.koreait.project.wooki.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;

public class InsertIsReviewedCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		//WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		
		/*
			1. 모임(meeting_date)가 오늘과 같거나 이전인 경우
			2. 모임진행여부(is_progress)가 0인 경우
			3. 모집인원 보다 참가승인된 사람이 더 많은경우
			
		*/
		//wookiDao.updateProgressMeeting();

	}

}
