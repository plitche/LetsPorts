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

public class TrainerUserListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int totalRecord = wookiDao.totalTrainerRecord();
		int recordPerPage = 10;
		int page = (int) model.asMap().get("page");
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;

		String paging = Paging.getPaging("fn_trainerUser", totalRecord, recordPerPage, page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Trainer_infoDto> list = wookiDao.trainerUserList(beginRecord, endRecord);
		if(list.size() > 0) {
			map.put("list", list);
			map.put("paging", paging);
			map.put("totalRecord", totalRecord);
			map.put("page", page);
			map.put("recordPerPage", recordPerPage);
		}
		return map;
	}

}
