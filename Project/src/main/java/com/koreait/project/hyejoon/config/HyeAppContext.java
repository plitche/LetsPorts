package com.koreait.project.hyejoon.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.hyejoon.command.login.SendTempPwCommand;
import com.koreait.project.hyejoon.command.login.UserCheckCommand;
import com.koreait.project.hyejoon.command.login.UsersLoginCommand;
import com.koreait.project.hyejoon.command.myPage.DeletePhotoCommand;
import com.koreait.project.hyejoon.command.myPage.UpdateMsgCommand;
import com.koreait.project.hyejoon.command.myPage.UploadProfilePhotoCommand;
import com.koreait.project.hyejoon.command.myPage.ViewMeetingInfoCommand;
import com.koreait.project.hyejoon.command.signUp.EmailAuthCommand;
import com.koreait.project.hyejoon.command.signUp.EmailCheckCommand;
import com.koreait.project.hyejoon.command.signUp.InsertJoinCommand;
import com.koreait.project.hyejoon.command.signUp.NickCheckCommand;
import com.koreait.project.hyejoon.command.userAccount.DeleteAccountCommand;
import com.koreait.project.hyejoon.command.userAccount.UpdateAccountCommand;
import com.koreait.project.hyejoon.command.userAccount.UserUpdateViewCommand;

@Configurable
public class HyeAppContext {
	
	// 로그인 
	@Bean
	public UsersLoginCommand usersLoginCommand() {
		return new UsersLoginCommand();
	}
	
	@Bean
	public SendTempPwCommand sendTempPwCommand() {
		return new SendTempPwCommand();
	}
	
	// 회원 가입
	@Bean
	public NickCheckCommand nickCheckCommand() {
		return new NickCheckCommand();
	}
	
	@Bean
	public EmailCheckCommand emailCheckCommand() {
		return new EmailCheckCommand();
	}
	
	@Bean
	public EmailAuthCommand emailAuthCommand() {
		return new EmailAuthCommand();
	}
	
	@Bean
	public InsertJoinCommand insertJoinCommand() {
		return new InsertJoinCommand();
	}
	
	@Bean
	public UserCheckCommand userCheckCommand() {
		return new UserCheckCommand();
	}
	
	// 마이페이지
	@Bean
	public UserUpdateViewCommand userUpdateViewCommand() {
		return new UserUpdateViewCommand();
	}
	@Bean
	public UpdateAccountCommand updateAccountCommand() {
		return new UpdateAccountCommand();
	}
	@Bean
	public DeleteAccountCommand deleteAccountCommand() {
		return new DeleteAccountCommand();
	}
	@Bean
	public UploadProfilePhotoCommand uploadProfilePhotoCommand() {
		return new UploadProfilePhotoCommand();
	}
	@Bean
	public DeletePhotoCommand deletePhotoCommand() {
		return new DeletePhotoCommand();
	}
	@Bean
	public UpdateMsgCommand updateMsgCommand() {
		return new UpdateMsgCommand();
	}
	@Bean
	public ViewMeetingInfoCommand viewMeetingInfoCommand() {
		return new ViewMeetingInfoCommand();
	}
	
}