package com.koreait.project.wooki.command.users;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class DeleteUserCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int user_no = (int) model.asMap().get("user_no");
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		String[] deletePhotoList = wookiDao.deleteUserPhotoList(user_no);
		wookiDao.deleteUserAlaram(user_no);
		
		int result = wookiDao.deleteUser(user_no);
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
