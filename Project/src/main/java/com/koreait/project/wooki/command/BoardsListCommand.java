package com.koreait.project.wooki.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.common.Paging;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.BoardsDto;

public class BoardsListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int totalRecord = wookiDao.totalBoardsRecord();
		int recordPerPage = 5;
		int page = (int) model.asMap().get("page");
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
		List<BoardsDto> list = wookiDao.boardsList(beginRecord, endRecord);
		String paging = Paging.getPaging("fn_boardsList", totalRecord, recordPerPage, page);

		map.put("list", list);
		map.put("paging", paging);
		map.put("totalRecord", totalRecord);
		map.put("page", page);
		map.put("recordPerPage", recordPerPage);
		return map;
	}
}
