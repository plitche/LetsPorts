package com.koreait.project.jungho.command.TrainerClassCommentCommand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.jungho.dao.TrainerClassCommentDao;

public class CommentListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int meeting_no = (int)map.get("meeting_no"); 			// command에 받는다
		int commentPage = (int)map.get("commentPage");	// command에 받는다.
		
		TrainerClassCommentDao trainerClassCommentDao = sqlSession.getMapper(TrainerClassCommentDao.class);
		
		int totalRecord = trainerClassCommentDao.commentCount(meeting_no);  // 전체 댓글 개수를 가져온다
		int commentPerPage = 10;	// 페이지마다 가져올 댓글 갯수
		int beginRecord = (commentPage - 1) * commentPerPage + 1;
		int endRecord = beginRecord + commentPerPage - 1;
		endRecord = (endRecord < totalRecord) ? endRecord : totalRecord;
		int totalPage = totalRecord / commentPerPage; // 전체 페이지의 개수
		if (totalPage % commentPerPage != 0) {
			totalPage++;
		}
		totalPage = (totalPage >= commentPage) ? totalPage : commentPage;
		int pagePerBlock = 5;
		int beginPage = ((commentPage - 1) / pagePerBlock) * pagePerBlock + 1;
		int endPage = beginPage + pagePerBlock -1;
		endPage = endPage < totalPage ? endPage : totalPage;
		
		Map<String, Object> paging = new HashMap<>();
		paging.put("totalRecord", totalRecord);				// 전체 데이터 개수
		paging.put("commentPage", commentPage);		// 현 페이지
		paging.put("totalPage", totalPage);						// 전체 페이지의 개수
		paging.put("pagePerBlock", pagePerBlock);		// 블록 당 존재하는 페이지 수
		paging.put("beginPage", beginPage);					// 블록당 시작하는 페이지
		paging.put("endPage", endPage);						// 블록당 끝나는 페이지
		
		
		Map<String, Object> resultMap = new HashMap<>();
		List<CommentsDto> commentList = trainerClassCommentDao.commentList(beginRecord, endRecord, meeting_no);
		resultMap.put("commentList", commentList);
		resultMap.put("paging", paging);
		
		if (commentList.size() > 0) {
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}
		
		return resultMap;
	}

}
