package com.koreait.project.hyejoon.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.koreait.project.hyejoon.command.myPage.PreparingMeetingListCommand;
import com.koreait.project.hyejoon.command.userAccount.UserUpdateCommand;

@Configuration
public class WookiClientAppContext {

	@Bean
	public PreparingMeetingListCommand preparingMeetingListCommand() {
		return new PreparingMeetingListCommand();
	}
	
	@Bean
	public UserUpdateCommand userUpdateCommand() {
		return new UserUpdateCommand();
	}
	
}
