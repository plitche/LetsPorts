package com.koreait.project.hyejoon.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.hyejoon.command.UsersLoginCommand;
import com.koreait.project.hyejoon.command.myPage.UserInfoUpdatePwCheckCommand;
import com.koreait.project.hyejoon.command.signUp.EmailAuthCommand;
import com.koreait.project.hyejoon.command.signUp.EmailCheckCommand;
import com.koreait.project.hyejoon.command.signUp.ExerciseCheckedCommand;
import com.koreait.project.hyejoon.command.signUp.NickCheckCommand;

@Configurable
public class HyeAppContext {
	
	@Bean
	public UsersLoginCommand usersLoginCommand() {
		return new UsersLoginCommand();
	}
	
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
	public ExerciseCheckedCommand exerciseCheckedCommand() {
		return new ExerciseCheckedCommand();
	}
	
	
	@Bean
	public UserInfoUpdatePwCheckCommand userInfoUpdatePwCheckCommand() {
		return new UserInfoUpdatePwCheckCommand();
	}
}