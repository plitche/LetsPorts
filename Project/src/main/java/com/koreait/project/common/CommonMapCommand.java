package com.koreait.project.common;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface CommonMapCommand {

	public Map<String, Object> execute(SqlSession sqlSession, Model model);
	
<<<<<<< HEAD
}
=======
}
>>>>>>> 4c0b0756820e75aa7ef483e873bf49898aaa49fd
