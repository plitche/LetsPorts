package com.koreait.project.jungho.command.TagCommand;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;
import com.koreait.project.jungho.paging.Paging;

public class Tag7Command implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String , Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String 요가 = request.getParameter("요가");
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String paging = null;
		
		int totalRecord = 0;
		int recordPerPage = 11;
		int beginRecord = (page -1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		totalRecord = trainerClassDao.요가TagCount();
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;
		paging = Paging.getPaging("Tag7.leo?요가=" + 요가, totalRecord, recordPerPage, page);
		// 모든 클래스목록들을 뿌려주기 위한 작업
		model.addAttribute("ClassTags", trainerClassDao.classTag());		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("paging", paging);
		model.addAttribute("page", page);
		model.addAttribute("recordPerPage", recordPerPage);
		model.addAttribute("MeetingList", trainerClassDao.Tag0(beginRecord, endRecord, 요가));
		model.addAttribute("Lists", 17);
		model.addAttribute("Tag7", "#" + 요가);


	}

}
