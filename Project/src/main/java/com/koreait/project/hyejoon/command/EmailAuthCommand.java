package com.koreait.project.hyejoon.command;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.UsersDao;

public class EmailAuthCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		JavaMailSender mailSender = (JavaMailSender)map.get("mailSender");
		
		String email = (String)map.get("email");
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		int authResult = usersDao.nickCheck(email);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(authResult > 0) {
			result.put("result", 1);
		} else {
			result.put("result", 0);
			// 이메일을 보내는 작업은 예외 처리가 필요
			try {
			
				// MimeMessage 클래스가 이메일의 내용을 작성합니다.
				MimeMessage message = mailSender.createMimeMessage();
				message.setHeader("Content-Type", "text/plain; charset=utf-8");
				message.setFrom(new InternetAddress("ziziza93@gmail.com", "LetsPorts!"));  // 보내는 사람
				
				InternetAddress to = new InternetAddress(request.getParameter("email"));  // 받는 사람
				message.setRecipient(Message.RecipientType.TO, to);  //한명에게 보냅니다.
				
				message.setSubject("인증 요청 메일입니다.");  // 제목
				long authKey = (long)(Math.random() * 10000000000L) + 1234567890;  // 랜덤하게 마음대로 만듭니다.
				message.setText("인증코드: " + authKey);  // 본문
				mailSender.send(message);  // 메일을 보냅니다.
				
				// 생성한 인증키를 다음으로 넘겨서 비교가 가능하도록 처리합니다.
				model.addAttribute("authKey", authKey);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
		
	}

}
