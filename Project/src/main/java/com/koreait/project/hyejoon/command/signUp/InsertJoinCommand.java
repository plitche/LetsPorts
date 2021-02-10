package com.koreait.project.hyejoon.command.signUp;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.dao.UsersDao;

public class InsertJoinCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String user_nickname = request.getParameter("user_nickname");
		int birth_year = Integer.parseInt(request.getParameter("birth_year"));
		int birth_month = Integer.parseInt(request.getParameter("birth_month"));
		int birth_day = Integer.parseInt(request.getParameter("birth_day"));
		int location1_no = Integer.parseInt(request.getParameter("location1_no"));
		int location2_no = Integer.parseInt(request.getParameter("location2_no"));
		String[] list = request.getParameterValues("exercise_no");
		int[] exerc_list = new int[list.length];
		
		for (int i=0; i<list.length; i++) {
			exerc_list[i] = Integer.parseInt(list[i]);
		}
		
		UsersDto usersDto = new UsersDto();
		usersDto.setEmail(email);
		usersDto.setPassword(password);
		usersDto.setUser_nickname(user_nickname);
		usersDto.setBirth_year(birth_year);
		usersDto.setBirth_month(birth_month);
		usersDto.setBirth_day(birth_day);
		usersDto.setLocation1_no(location1_no);
		usersDto.setLocation2_no(location2_no);
		
		// 데이터 저장
		// users_interest테이블에 insert하기위한 메소드 호출
		int joinResult = usersDao.insertJoin(usersDto);
		
		if(joinResult > 0) {
			// 새로 생성된 관심분야 번호를 가져오기위한 메소드 호출
			int user_no = usersDao.getUserNo(email);
			
			// 새로 생성된 관심분야 번호와 관심분야를 저장하기 위한 메소드 호출
			for (int i=0; i < exerc_list.length; i++) {
				usersDao.insertExerciseList(user_no, exerc_list[i]);
			}
			
		}
		
	}

}
