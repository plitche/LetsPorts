package com.koreait.project.hyejoon.command.signUp;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;

public class EmailAuthCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Map<String, Object> map = model.asMap();
			
			
			JavaMailSender mailSender = (JavaMailSender) map.get("mailSender");
			String email = (String) map.get("email");
			
			
			MimeMessage message = mailSender.createMimeMessage();
			message.setHeader("Content-Type", "text/html; charset=utf-8");
			message.setFrom(new InternetAddress("ziziza93@gmail.com", "LetsPorts"));// 보내는 사람
			
			InternetAddress to = new InternetAddress(email); 	// 받는 사람
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject("LetsPorts 회원가입 인증 메일입니다.");
			
			long authKey = (long)(Math.random() * 10000000000L) + 1234567890; // 코드 랜덤 생성
			System.out.println(authKey);
			
			message.setText("인증코드: " + authKey); // 본문
			
			mailSender.send(message); // 메일 보냄
			
			// 생성한 인증키를 다음으로 넘겨서 비교가 가능하도록 처리
			result.put("authKey", authKey);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
