package com.koreait.project.wooki.command.trainerQnA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.common.Paging;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.Trainer_qnaDto;

public class TQnAListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		String tQnASep = request.getParameter("tQnASep");
		String query = request.getParameter("query");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int totalRecord = 0;
		if(tQnASep.equals("100")) {
			totalRecord = wookiDao.totalTQnARecord();
		} else {
			// tQnASep, query 둘다 넘겨서 리스트 가져옴
			totalRecord = wookiDao.totalTQnARecordFilterQuery(tQnASep, query);
		}
		int recordPerPage = 5;
		int page = Integer.parseInt(request.getParameter("page"));
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
		
		List<Trainer_qnaDto> list = null;
		if(tQnASep.equals("100")) {
			list = wookiDao.tQnAList(beginRecord, endRecord);
		} else {
			// tQnASep, query 둘다 넘겨서 리스트 가져옴
			list = wookiDao.tQnAListFilterQuery(beginRecord, endRecord, tQnASep, query);
		}
		String paging = Paging.getPaging("fn_tQnAList", totalRecord, recordPerPage, page);

		map.put("list", list);
		map.put("paging", paging);
		map.put("totalRecord", totalRecord);
		map.put("page", page);
		map.put("recordPerPage", recordPerPage);
		return map;
	}

}
