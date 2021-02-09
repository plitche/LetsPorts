package com.koreait.project.wooki.command.users;

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
import com.koreait.project.wooki.dto.UsersDto;

public class SendTempPassCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> resultMap = null;
		try {
			Map<String, Object> map = model.asMap();
			JavaMailSender mailSender = (JavaMailSender) map.get("mailSender");
			UsersDto usersDto = (UsersDto) map.get("usersDto");
			
			MimeMessage message = mailSender.createMimeMessage();
			message.setHeader("Content-Type", "text/plain; charset=utf-8");
			message.setFrom(new InternetAddress("ziziza93@gmail.com", "LetsPorts"));
			
			InternetAddress to = new InternetAddress(usersDto.getEmail());
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject("임시 비밀번호 입니다.");
			
			String text = "";
			for(int i = 0; i < 3; i++) {
				text += Character.toString((char)((int)(Math.random() * 26) + 65));
			}
			int num = (int)(Math.random() * 9) + 1;
			String tempPass = text + num;	// 랜덤하게 마음대로 만듭니다.
			message.setText("임시비밀번호는 " + tempPass + "입니다. 로그인 후 꼭 비밀번호를 변경해주세요.");
			
			WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
			usersDto.setPassword(tempPass);
			int updateResult = wookiDao.updateTempPass(usersDto);
			
			resultMap = new HashMap<String, Object>();
			if(updateResult > 0) {
				mailSender.send(message);
				resultMap.put("result", true);
			} else {
				resultMap.put("result", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

}
