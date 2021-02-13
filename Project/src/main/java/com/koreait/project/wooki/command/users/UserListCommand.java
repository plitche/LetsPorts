package com.koreait.project.wooki.command.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.common.Paging;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.UsersDto;

public class UserListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		
		Map<String, Object> map = model.asMap();
		
		int totalRecord = wookiDao.totalRecord();
		int recordPerPage = 10;
		int page = (int) map.get("page");
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
	
		String paging = Paging.getPaging("fn_user", totalRecord, recordPerPage, page);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<UsersDto> list = wookiDao.userList(beginRecord, endRecord);
		if(list.size() > 0) {
			resultMap.put("list", list);
			resultMap.put("result", true);
			resultMap.put("paging", paging);
			resultMap.put("totalRecord", totalRecord);
			resultMap.put("page", page);
			resultMap.put("recordPerPage", recordPerPage);
		} else {
			resultMap.put("result", false);
		}
		return resultMap;
	}

}
