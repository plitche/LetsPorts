package com.koreait.project.wooki.command.comments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.common.Paging;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.CommentsDto;

public class CommentsListCommand implements CommonMapCommand {
	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		int commentSep = Integer.parseInt(request.getParameter("commentSep"));
		String columnName = request.getParameter("columnName");
		String query = request.getParameter("query");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int totalRecord = 0;
		if(commentSep == 100) {
			totalRecord = wookiDao.totalCommentsRecord();
		} else {
			if(columnName.equals("all")) {
				// commentSep 만 넘겨서 리스트 가져옴
				totalRecord = wookiDao.totalCommentsRecordFilterAll(commentSep);
			} else {
				// columnName, query 둘다 넘겨서 리스트 가져옴
				totalRecord = wookiDao.totalCommentsRecordFilterQuery(commentSep, columnName, query);
			}
		}
		int recordPerPage = 5;
		int page = Integer.parseInt(request.getParameter("page"));
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
		
		List<CommentsDto> list = null;
		if(commentSep == 100) {
			list = wookiDao.commentsList(beginRecord, endRecord);
		} else {
			if(columnName.equals("all")) {
				// commentSep 만 넘겨서 리스트 가져옴
				list = wookiDao.commentsListFilterAll(beginRecord, endRecord, commentSep);
			} else {
				// columnName, query 둘다 넘겨서 리스트 가져옴
				list = wookiDao.commentsListFilterQuery(beginRecord, endRecord, commentSep, columnName, query);
			}
		}
		String paging = Paging.getPaging("fn_commentsList", totalRecord, recordPerPage, page);

		map.put("list", list);
		map.put("paging", paging);
		map.put("totalRecord", totalRecord);
		map.put("page", page);
		map.put("recordPerPage", recordPerPage);
		return map;
	}

}
