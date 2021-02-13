package com.koreait.project.wooki.command.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.common.Paging;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.UsersDto;

public class FilterUserListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String text_filter = request.getParameter("text_filter");
		String search = request.getParameter("search");
		String user_separator = request.getParameter("user_separator");
		
		int totalRecord = wookiDao.filterTotalRecord(text_filter, search, user_separator);
		int recordPerPage = 10;
		int page = (int) map.get("page");
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
	
		String paging = Paging.getPaging("fn_filterUserList", totalRecord, recordPerPage, page);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<UsersDto> list = wookiDao.filterUserList(beginRecord, endRecord, text_filter, search, user_separator);
		resultMap.put("list", list);
		resultMap.put("result", true);
		resultMap.put("paging", paging);
		resultMap.put("totalRecord", totalRecord);
		resultMap.put("page", page);
		resultMap.put("recordPerPage", recordPerPage);
		resultMap.put("text_filter", text_filter);
		resultMap.put("search", search);
		resultMap.put("user_separator", user_separator);
		
		return resultMap;
	}

	
}