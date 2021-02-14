package com.koreait.project.hyejoon.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.koreait.project.hyejoon.command.InsertTrainerCommand;
import com.koreait.project.hyejoon.command.myPage.MyQnAListCommand;
import com.koreait.project.hyejoon.command.myPage.PastMeetingListCommand;
import com.koreait.project.hyejoon.command.myPage.PreparingMeetingListCommand;
import com.koreait.project.hyejoon.command.userAccount.UserUpdateCommand;

@Configuration
public class WookiClientAppContext {

	@Bean
	public PreparingMeetingListCommand preparingMeetingListCommand() {
		return new PreparingMeetingListCommand();
	}
	
	@Bean
	public PastMeetingListCommand pastMeetingListCommand() {
		return new PastMeetingListCommand();
	}
	
	@Bean
	public MyQnAListCommand myQnAListCommand() {
		return new MyQnAListCommand();
	}
	
	@Bean
	public UserUpdateCommand userUpdateCommand() {
		return new UserUpdateCommand();
	}
	
	@Bean
	public InsertTrainerCommand insertTrainerCommand() {
		return new InsertTrainerCommand();
	}
	
}
