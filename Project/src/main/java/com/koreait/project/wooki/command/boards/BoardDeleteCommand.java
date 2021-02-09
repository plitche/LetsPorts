package com.koreait.project.wooki.command.boards;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class BoardDeleteCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int board_sep = (int) model.asMap().get("board_sep");
		int board_no = (int) model.asMap().get("board_no");
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		// 게시글 삭제 선행 삭제테이블
		if(board_sep == 0 || board_sep == 2) {
			wookiDao.boardDeleteBeforeScrap(board_sep, board_no);
		}
		wookiDao.boardDeleteBeforeComments(board_sep, board_no);
		String[] deletePhotoList = wookiDao.boardDeleteBeforePhotoList(board_sep, board_no);
		wookiDao.boardDeleteBeforePhoto(board_sep, board_no);
		if(board_sep == 2) {
			wookiDao.boardDeleteBeforeAlarm(board_no);
		}
		
		
		// 게시글 삭제 메소드
		int result = wookiDao.boardDelete(board_sep, board_no);
		Map<String, Object> map = new HashMap<String, Object>();
		if(result > 0) {
			map.put("result", true);
			for(int i = 0; i < deletePhotoList.length; i++) {
				String filename = deletePhotoList[i];
				String realPath = request.getServletContext().getRealPath("resources/storage");
				File file = new File(realPath, filename);
				if(file.exists()) {
					file.delete();
				}
			}
		} else {
			map.put("result", false);
		}
		
		return map;
	}

}
