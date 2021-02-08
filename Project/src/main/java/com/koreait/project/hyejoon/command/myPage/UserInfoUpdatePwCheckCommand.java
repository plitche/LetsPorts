package com.koreait.project.hyejoon.command.myPage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.UsersDao;

public class UserInfoUpdatePwCheckCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String password = request.getParameter("password");
		
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		int updateUser = usersDao.infoUdatePwCheck(password);
		
		System.out.println("password : " + password);
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(updateUser > 0) {
			result.put("result", 1);
		} else {
			result.put("result", 0);
		}
		
		// false:0, true:1 -> controller에도 연관되는 부분이므로 참고!
		return result;
	}

}
