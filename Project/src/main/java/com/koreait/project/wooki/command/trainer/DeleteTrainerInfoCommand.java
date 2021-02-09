package com.koreait.project.wooki.command.trainer;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class DeleteTrainerInfoCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int user_no = (int) model.asMap().get("user_no");
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		Map<String, Object> map = new HashMap<String, Object>();
		//삭제파일명 불러오기
		String filename = wookiDao.deleteTrainerCertificateFilename(user_no);
		//유저 구분 업데이트
		if(wookiDao.deleteTrainerUserSeparatorUpdate(user_no) > 0) {
			//스크랩 테이블의 유저넘버가 삭제할유저넘버
			wookiDao.deleteTrainerScrap(user_no);
			//트레이너큐앤에이 트레이너 유저넘버가 삭제할 유저넘보인 게시글들에 관려된 알럿 삭제
			wookiDao.deleteTrainerQNAAlarm(user_no);
			//트레이너정보 삭제
			if(wookiDao.deleteTrainer(user_no) > 0) {
				//정보 삭제성공시 트루값 반환 + 파일실제삭제
				map.put("result", true);
				String realPath = request.getServletContext().getRealPath("resources/storage");
				File file = new File(realPath, filename);
				if(file.exists()) {
					file.delete();
				}
			} else {
				map.put("result", false);
			}
		} else {
			map.put("result", false);
		}
		
		return map;
	}
}
