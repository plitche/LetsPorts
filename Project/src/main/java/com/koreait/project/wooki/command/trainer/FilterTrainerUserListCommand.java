package com.koreait.project.wooki.command.trainer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.common.Paging;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.Trainer_infoDto;

public class FilterTrainerUserListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		
		
		int search = (int) model.asMap().get("search");
		
		int totalRecord = wookiDao.filterTotalTrainerRecord(search);
		int recordPerPage = 10;
		int page = (int) model.asMap().get("page");
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
	
		String paging = Paging.getPaging("fn_filterTrainerUserList", totalRecord, recordPerPage, page);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Trainer_infoDto> list = wookiDao.filterTrainerUserList(beginRecord, endRecord, search);
		resultMap.put("list", list);
		resultMap.put("paging", paging);
		resultMap.put("totalRecord", totalRecord);
		resultMap.put("page", page);
		resultMap.put("recordPerPage", recordPerPage);
		resultMap.put("search", search);
		
		return resultMap;
	}

}
