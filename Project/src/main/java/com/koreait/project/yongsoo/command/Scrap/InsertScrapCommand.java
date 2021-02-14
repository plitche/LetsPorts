package com.koreait.project.yongsoo.command.Scrap;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.ScrapDto;
import com.koreait.project.yongsoo.dao.TrainerMeetingDao;

public class InsertScrapCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		ScrapDto scrapDto = (ScrapDto)map.get("scrapDto");
		int user_no = scrapDto.getUser_no();
		int scrap_referer_no = scrapDto.getScrap_referer_no();

		TrainerMeetingDao trainerMeetingDao = sqlSession.getMapper(TrainerMeetingDao.class);
		
		// 전달받은 모임 번호를 통해 end_date를 구하기 위한 dao호출
		Date end_gather_date = trainerMeetingDao.getEndGatherDate(scrap_referer_no);
		// end_date를 구한 데이터를 포함하여 모든 내용을 스크랩 테이블에 insert dao호출
		int scrapResult = trainerMeetingDao.insertScrap(user_no, scrap_referer_no, end_gather_date);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (scrapResult>0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
