package com.koreait.project.hyejoon.command.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.dao.UsersDao;



public class UserCheckCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		UsersDto usersDto = (UsersDto) map.get("usersDto");

		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		int emailResult = usersDao.userCheck(usersDto.getEmail());
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(emailResult > 0) {
			result.put("result", 1);
		} else {
			result.put("result", 0);
		}
		System.out.println("emailResult "+ emailResult);
		
		return result;
	}

}
