package com.koreait.project.jungho.command.TagCommand;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;

public class Tag8Command implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String , Object> map = model.asMap();
		String 명상 = (String)map.get("명상");
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		model.addAttribute("MeetingList", trainerClassDao.Tag0(명상));
		model.addAttribute("ClassTags", trainerClassDao.classTag());

	}

}
