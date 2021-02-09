package com.koreait.project.yewon.command;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import com.koreait.project.dto.Board_knowhowDto;
import com.koreait.project.yewon.dao.KnowHowDao;

public class GoknowHowUpdatePageCommand {

	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		KnowHowDao knowHowDao = sqlSession.getMapper(KnowHowDao.class);
		
		int knowhow_no = (int)map.get("knowhow_no");

		Board_knowhowDto board_knowhowDto = knowHowDao.knowHowView(knowhow_no);
		
		model.addAttribute("board_knowhowDto", board_knowhowDto);
		
		
		
	}

}
