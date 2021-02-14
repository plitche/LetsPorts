package com.koreait.project.hyejoon.command.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.WookiClientDao;
import com.koreait.project.hyejoon.dto.MyQnADto;
import com.koreait.project.wooki.common.Paging;

public class MyQnAListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		WookiClientDao wookiClientDao = sqlSession.getMapper(WookiClientDao.class);
		int user_no = (int) model.asMap().get("user_no");
		
		int totalRecord = wookiClientDao.totalMyQnARecord(user_no);
		int recordPerPage = 5;
		int page = (int) model.asMap().get("page");
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
		
		List<MyQnADto> list = wookiClientDao.myQnAList(user_no, beginRecord, endRecord);
		
		String paging = Paging.getPaging("fn_myQnAList", totalRecord, recordPerPage, page);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);
		map.put("totalRecord", totalRecord);
		map.put("page", page);
		map.put("recordPerPage", recordPerPage);
		return map;
	}

}
