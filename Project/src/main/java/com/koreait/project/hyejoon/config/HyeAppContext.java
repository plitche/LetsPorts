package com.koreait.project.hyejoon.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.hyejoon.command.EmailAuthCommand;
import com.koreait.project.hyejoon.command.EmailCheckCommand;
import com.koreait.project.hyejoon.command.NickCheckCommand;
import com.koreait.project.hyejoon.command.UsersLoginCommand;

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
}