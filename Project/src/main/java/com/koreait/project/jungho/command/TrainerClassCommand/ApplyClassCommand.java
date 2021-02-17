package com.koreait.project.jungho.command.TrainerClassCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;

public class ApplyClassCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object>map = model.asMap();
		
		int meeting_no = (int)map.get("meeting_no");
		int meeting_max = (int)map.get("meeting_max");
		int user_no = (int)map.get("user_no");
		
		System.out.println(meeting_no + "a");
		System.out.println(meeting_max + "b");
		System.out.println(user_no + "c");
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		// 로직 파악
		// 1. 그게 아니라 최대인원숫자보다 작으면 신청할 수 있다.
			// 1. 만약 (모임에 나랑 같은 이름이 존재하면) 내가 이미 신청한 모임이라면 신청할 수 없다 ( 이미 신청한 모임입니다. )
			// 2. 신청한 모임이 아니라면 삽입한다. ( 신청되었습니다. )
		
		// 2. 만약 신청하기 눌러서 디비에 갔다왔는데 최대인원보다 숫자가 크면 신청할 수 없다( 인원이 가득찼습니다. )
		
		
		 int nowApplyNum = trainerClassDao.nowApplyNum(meeting_no);
		 
		Map<String , Object> result = new HashMap<String, Object>();
		
		if (nowApplyNum < meeting_max) { // 아직 신청인원이 마감되지않았으면
			
			result.put("isMax", false); // result = 신청되었으면 1, 신청 못했으면 0 
			int isApply = trainerClassDao.isApply(meeting_no, user_no);
			
			if (isApply > 0) { // 내가 신청을 했으면
				result.put("isAlreadyApply", true); // 이미 신청했으니까 (이미신청했습니다.)
				
			} else if (isApply == 0) { // 내가 아직 신청을 안했으면
				result.put("isAlreadyApply", false); // 신청 하지않은 상태 
				int goApply = trainerClassDao.applyClass(meeting_no, user_no); // 신청해라
				if (goApply > 0) { // 신청됐으면 1
					result.put("goApply", true); // 신청이 되었습니다.
				} else { // 신청 안됐으면 0
					result.put("goApply", false); // 신청이 되지 않았습니다.
				}
			}
		} else { // 신청인원이 가득찼으면,
			result.put("isMax", true);
		}
		
		return result;
	}
	

}
