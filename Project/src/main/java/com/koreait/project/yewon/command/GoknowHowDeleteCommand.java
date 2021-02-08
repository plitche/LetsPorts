package com.koreait.project.yewon.command;

import java.util.Map;
<<<<<<< HEAD

=======
>>>>>>> 4ce050066912fe962a1939ec8c8c8e8227b89dbb
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yewon.dao.KnowHowDao;

public class GoknowHowDeleteCommand implements CommonVoidCommand {

	@Override
<<<<<<< HEAD

		public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
			
		// 데이터 삭제
		int knowhow_no = (int)map.get("knowhow_no");
		KnowHowDao knowHowDao = sqlSession.getMapper(KnowHowDao.class);
=======
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		// 데이터 삭제
		int knowhow_no = (int)map.get("knowhow_no");
		KnowHowDao knowHowDao = sqlSession.getMapper(KnowHowDao.class);

		
		
>>>>>>> 4ce050066912fe962a1939ec8c8c8e8227b89dbb
		
	}

}
