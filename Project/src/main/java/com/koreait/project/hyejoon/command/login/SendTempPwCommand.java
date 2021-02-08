package com.koreait.project.hyejoon.command.login;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.UsersDao;

public class SendTempPwCommand implements CommonMapCommand {

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
			
			System.out.println("email: " + email);
			InternetAddress to = new InternetAddress(email); 	// 받는 사람
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject("LetsPorts 임시 비밀번호 발송 메일입니다.");
			
			String text = "";
			for(int i = 0; i < 3; i++) {
				text += Character.toString((char)((int)(Math.random() * 26) + 65));
			}
			int num = (int)(Math.random() * 9) + 1;
			String tempPw = text + num;	// 랜덤하게 마음대로 만듭니다.
			
			System.out.println(tempPw);
			
			message.setText("임시비밀번호는 " + tempPw + "입니다. 로그인 후 꼭 비밀번호를 변경해주세요."); // 본문
			
			
			
			mailSender.send(message); // 메일 보냄
			result.put("tempPw", tempPw); //
			
			UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
			usersDao.updateTempPw(email, tempPw);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
