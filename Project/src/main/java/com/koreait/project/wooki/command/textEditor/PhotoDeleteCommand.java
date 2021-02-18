package com.koreait.project.wooki.command.textEditor;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.EditorDao;

public class PhotoDeleteCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// 파일이름들 받아오기
		String filesname = (String) model.asMap().get("filesname");
		
		// 파일 리스트 배열화
		String[] list = filesname.split(",");
		
		// 파일 저장 경로 확인
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		String realPath = request.getServletContext().getRealPath("resources/storage");
		filesname = "";
		
		// 서버에 등록된 파일 삭제
		for(int i = 0; i < list.length; i++) {
			File file = new File(realPath, list[i]);
			if(file.exists()) {
				file.delete();
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		// photo테이블 내 파일관련 데이터 삭제.
		int result = sqlSession.getMapper(EditorDao.class).deleteTempPhoto(list);
		if(result > 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

}
