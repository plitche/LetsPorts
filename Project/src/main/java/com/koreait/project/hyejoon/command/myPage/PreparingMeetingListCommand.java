package com.koreait.project.hyejoon.command.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.WookiClientDao;
import com.koreait.project.hyejoon.dto.MeetingListingDto;
import com.koreait.project.wooki.common.Paging;

public class PreparingMeetingListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		WookiClientDao wookiClientDao = sqlSession.getMapper(WookiClientDao.class);
		int user_no = (int) model.asMap().get("user_no");
		
		int totalRecord = wookiClientDao.preparingTotalRecord(user_no);
		int recordPerPage = 4;
		int page = (int) model.asMap().get("page");
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
		
		List<MeetingListingDto> list = wookiClientDao.preparingMeetingList(user_no, beginRecord, endRecord);
		
		String paging = Paging.getPaging("fn_preparingMeetingList", totalRecord, recordPerPage, page);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);
		map.put("page", page);
		return map;
	}

}
