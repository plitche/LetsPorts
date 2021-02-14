package com.koreait.project.wooki.command.boards;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		int boardSep = Integer.parseInt(request.getParameter("boardSep"));
		String columnName = request.getParameter("columnName");
		String query = request.getParameter("query");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int totalRecord = 0;
		if(boardSep == 100) {
			totalRecord = wookiDao.totalBoardsRecord();
		} else {
			if(columnName.equals("all")) {
				// boardSep 만 넘겨서 리스트 가져옴
				totalRecord = wookiDao.totalBoardsRecordFilterAll(boardSep);
			} else {
				// columnName, query 둘다 넘겨서 리스트 가져
				totalRecord = wookiDao.totalBoardsRecordFilterQuery(boardSep, columnName, query);
			}
		}
		int recordPerPage = 10;
		int page = Integer.parseInt(request.getParameter("page"));
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
		
		List<BoardsDto> list = null;
		if(boardSep == 100) {
			list = wookiDao.boardsList(beginRecord, endRecord);
		} else {
			if(columnName.equals("all")) {
				// boardSep 만 넘겨서 리스트 가져옴
				list = wookiDao.boardsListFilterAll(beginRecord, endRecord, boardSep);
			} else {
				// columnName, query 둘다 넘겨서 리스트 가져
				list = wookiDao.boardsListFilterQuery(beginRecord, endRecord, boardSep, columnName, query);
			}
		}
		String paging = Paging.getPaging("fn_boardsList", totalRecord, recordPerPage, page);

		map.put("list", list);
		map.put("paging", paging);
		map.put("totalRecord", totalRecord);
		map.put("page", page);
		map.put("recordPerPage", recordPerPage);
		return map;
	}
}
