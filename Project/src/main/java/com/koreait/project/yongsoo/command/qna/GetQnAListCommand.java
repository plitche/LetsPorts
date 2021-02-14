package com.koreait.project.yongsoo.command.qna;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.command.paging.Paging;
import com.koreait.project.yongsoo.dao.CommonQnADao;
import com.koreait.project.yongsoo.dto.BoardQnATemDto;

public class GetQnAListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		// 필터관련 클릭을 한 경우에 대한 처리
		int filter_no = 2;
		if (request.getParameter("filter_no") != null) {
			filter_no = Integer.parseInt(request.getParameter("filter_no"));
		}
		
		// 검색관련 name null이 아닐 때만 가져오기
		int searchCategory = 0;
		if (request.getParameter("searchCategory") != null) {
			searchCategory = Integer.parseInt(request.getParameter("searchCategory"));
		}
		String searchKeyword = null;
		if (request.getParameter("searchKeyword") != null) {
			searchKeyword = request.getParameter("searchKeyword");
		}
		
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		
		// 페이징
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int totalRecord = 0;
		int recordPerPage = 10;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		List<BoardQnATemDto> qnaList = null;
		String paging = null;
		
		if (searchCategory==0 || searchKeyword==null) {
			if (filter_no == 2) {
				totalRecord = commonQnADao.getQnACount();
				endRecord = endRecord < totalRecord ? endRecord : totalRecord;
				qnaList = commonQnADao.getQnAList(beginRecord, endRecord);
				paging = Paging.getPaging("goQnAPage.plitche", totalRecord, recordPerPage, page);
			} else {
				totalRecord = commonQnADao.getIsSolvedQnACount(filter_no);
				endRecord = endRecord < totalRecord ? endRecord : totalRecord;
				qnaList = commonQnADao.getIsSolvedQnAList(filter_no, beginRecord, endRecord);
				paging = Paging.getPaging("goQnAPage.plitche?filter_no="+filter_no, totalRecord, recordPerPage, page);
			}
		} else {
			switch(searchCategory) {
			case 1 : totalRecord = commonQnADao.getQnACount1(searchKeyword); 
			endRecord = endRecord < totalRecord ? endRecord : totalRecord; 
			qnaList = commonQnADao.getQnAListByKeyword1(beginRecord, endRecord, searchKeyword); 
			break;
			
			case 2 : totalRecord = commonQnADao.getQnACount2(searchKeyword); 
			endRecord = endRecord < totalRecord ? endRecord : totalRecord; 
			qnaList = commonQnADao.getQnAListByKeyword2(beginRecord, endRecord, searchKeyword); 
			break;
			
			case 3 : totalRecord = commonQnADao.getQnACount3(searchKeyword); 
			endRecord = endRecord < totalRecord ? endRecord : totalRecord; 
			qnaList = commonQnADao.getQnAListByKeyword3(beginRecord, endRecord, searchKeyword); 
			break;
			}
			paging = Paging.getPaging("goQnAPage.plitche?searchCategory="+searchCategory+"&searchKeyword="+searchKeyword, totalRecord, recordPerPage, page);
		}
		
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		SimpleDateFormat day = new SimpleDateFormat("dd");
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		
		for(int i=0; i<qnaList.size(); i++) {
			if(Integer.parseInt(year.format(qnaList.get(i).getCreated_at())) == Integer.parseInt(year.format(now)) &&
			   Integer.parseInt(month.format(qnaList.get(i).getCreated_at())) == Integer.parseInt(month.format(now)) && 
			   Integer.parseInt(day.format(qnaList.get(i).getCreated_at())) == Integer.parseInt(day.format(now))) {
				SimpleDateFormat format = new SimpleDateFormat("HH:mm");
				qnaList.get(i).setCreated_at2(format.format(qnaList.get(i).getCreated_at()));
			} else {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				qnaList.get(i).setCreated_at2(format.format(qnaList.get(i).getCreated_at()));
			}
		}
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("paging", paging);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("page", page);
		model.addAttribute("recordPerPage", recordPerPage);
	}

}
