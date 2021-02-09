package com.koreait.project.wooki.command.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.common.Paging;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.ReviewDto;

public class ReivewListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		String reviewSep = request.getParameter("reviewSep");
		String query = request.getParameter("query");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int totalRecord = 0;
		if(reviewSep.equals("100")) {
			totalRecord = wookiDao.totalReviewRecord();
		} else {
			// reviewSep, query 둘다 넘겨서 리스트 가져옴
			totalRecord = wookiDao.totalReviewRecordFilterQuery(reviewSep, query);
		}
		int recordPerPage = 5;
		int page = Integer.parseInt(request.getParameter("page"));
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
		
		List<ReviewDto> list = null;
		if(reviewSep.equals("100")) {
			list = wookiDao.reviewList(beginRecord, endRecord);
		} else {
			// reviewSep, query 둘다 넘겨서 리스트 가져옴
			list = wookiDao.reviewListFilterQuery(beginRecord, endRecord, reviewSep, query);
		}
		String paging = Paging.getPaging("fn_reviewList", totalRecord, recordPerPage, page);

		map.put("list", list);
		map.put("paging", paging);
		map.put("totalRecord", totalRecord);
		map.put("page", page);
		map.put("recordPerPage", recordPerPage);
		return map;
	}

}
