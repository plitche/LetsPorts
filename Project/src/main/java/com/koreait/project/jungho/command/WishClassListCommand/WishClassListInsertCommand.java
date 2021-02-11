package com.koreait.project.jungho.command.WishClassListCommand;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.WishClassListDao;
import com.koreait.project.jungho.dto.WishClassListDto;

public class WishClassListInsertCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		WishClassListDao wishClassListDao = sqlSession.getMapper(WishClassListDao.class);
		
		int meeting_no = Integer.parseInt(request.getParameter("meeting_no"));
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		int scrap_user_no = Integer.parseInt(request.getParameter("scrap_user_no"));
		Date end_gather_date = Date.valueOf(request.getParameter("end_gather_date"));
		WishClassListDto wishClassListDto = new WishClassListDto();
		wishClassListDto.setMeeting_no(meeting_no);
		wishClassListDto.setUser_no(user_no);
		wishClassListDto.setEnd_gather_date(end_gather_date);
		wishClassListDto.setScrap_user_no(scrap_user_no);
		
		wishClassListDao.WishClassInsert(wishClassListDto);
		
	}

}
