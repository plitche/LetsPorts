package com.koreait.project.yongsoo.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.project.dto.Trainer_qnaDto;
import com.koreait.project.yongsoo.command.trainerQnA.GetTrainerQnACommand;
import com.koreait.project.yongsoo.command.trainerQnA.ShowQnACommand;
import com.koreait.project.yongsoo.command.trainerQnA.WriteAnswerCommand;
import com.koreait.project.yongsoo.command.trainerQnA.WriteTrainerQnACommand;
import com.koreait.project.yongsoo.config.SooAppContext;

@Controller
public class TrainerQnAController {

	@Autowired
	SqlSession sqlSession;
	AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(SooAppContext.class);
	
	// 트레이너 View 페이지로 이동 시 자동으로 작동할 ajax처리를 위한 메소드
	@RequestMapping(value="getTrainerQnAList.plitche/{user_no}/qnaPageNo/{qnaPageNo}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")		
	@ResponseBody
	public Map<String, Object> getTrainerQnAList(@PathVariable("user_no") int user_no, 
												 @PathVariable("qnaPageNo") int qnaPageNo,
												 Model model) {
		model.addAttribute("user_no", user_no);
		model.addAttribute("qnaPageNo", qnaPageNo);
		GetTrainerQnACommand getTrainerQnACommand = ctx.getBean("getTrainerQnACommand", GetTrainerQnACommand.class);
		return getTrainerQnACommand.execute(sqlSession, model);
	}
	
	// 질문 작성 후 작성완료 버튼 클릭시 ajax처리를 위한 메소드
	@RequestMapping(value="writeQnA.plitche", method=RequestMethod.POST, 
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> writeQnA(@RequestBody Trainer_qnaDto trainer_qnaDto, Model model) {
		model.addAttribute("trainer_qnaDto", trainer_qnaDto);
		WriteTrainerQnACommand writeTrainerQnACommand = ctx.getBean("writeTrainerQnACommand", WriteTrainerQnACommand.class);
		return writeTrainerQnACommand.execute(sqlSession, model);
	}
	
	// 질문의 제목이나 내용 클릭시 ajax처리를 위한 메소드
	@RequestMapping(value="showQnA.plitche/{trainer_qna_no}", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> showQnA(@PathVariable("trainer_qna_no") int trainer_qna_no, Model model) {
		model.addAttribute("trainer_qna_no", trainer_qna_no);
		ShowQnACommand showQnACommand = ctx.getBean("showQnACommand", ShowQnACommand.class);
		return showQnACommand.execute(sqlSession, model);
	}
	
	// 질문 답변 완료 시 ajax처리를 위한 메소드
	@RequestMapping(value="writeAnswer.plitche", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> writeAnswer(@RequestBody Trainer_qnaDto trainer_qnaDto, Model model) {
		model.addAttribute("trainer_qnaDto", trainer_qnaDto);
		WriteAnswerCommand writeAnswerCommand = ctx.getBean("writeAnswerCommand", WriteAnswerCommand.class);
		return writeAnswerCommand.execute(sqlSession, model);
	}
	
}
