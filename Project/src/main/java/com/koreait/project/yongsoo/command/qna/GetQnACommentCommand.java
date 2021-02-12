package com.koreait.project.yongsoo.command.qna;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.CommonQnADao;
import com.koreait.project.yongsoo.dto.CommentTemDto;

public class GetQnACommentCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int qnaNo = (int)map.get("qnaNo");		
		int commentPageNo = (int)map.get("commentPageNo");
		
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		List<CommentTemDto> qnaCommentList = commonQnADao.getQnACommnetList(qnaNo, commentPageNo);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd(E) HH:mm:ss");
		for(int i=0; i<qnaCommentList.size(); i++) {
			qnaCommentList.get(i).setCreated_at2(format.format(qnaCommentList.get(i).getCreated_at()));
		}
		
		int commentCount = commonQnADao.getQnACommentCount(qnaNo);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (qnaCommentList.size()>0) {
			result.put("result", true);
			result.put("qnaCommentList", qnaCommentList);
		} else {
			result.put("result", false);
		}
		result.put("commentCount", commentCount);
		
		return result;
	}

}
