package com.koreait.project.wooki.command.trainer;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class AddTrainerSendEmailCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> resultMap = null;
		try {
			Map<String, Object> map = model.asMap();
			int user_no = (int) map.get("user_no");
			JavaMailSender mailSender = (JavaMailSender) map.get("mailSender");
			
			WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
			
			MimeMessage message = mailSender.createMimeMessage();
			message.setHeader("Content-Type", "text/html; charset=utf-8");
			message.setFrom(new InternetAddress("ziziza93@gmail.com", "LetsPorts"));
			
			InternetAddress to = new InternetAddress(wookiDao.getEmail(user_no));
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject("트레이너 회원가입 페이지 링크입니다.");
			
			message.setContent("회원가입 링크는 <a href='http://localhost:9090/project/trainerSignUp.hey?user_no=" + user_no + "'>여기</a>를 클릭해주세요.", "text/html; charset=utf-8");
			
			resultMap = new HashMap<String, Object>();
			mailSender.send(message);
			resultMap.put("result", true);
		} catch (Exception e) {
			resultMap.put("result", false);
			e.printStackTrace();
		}
		return resultMap;
	}

}
