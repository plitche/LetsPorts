package com.koreait.project.hyejoon.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.hyejoon.command.UsersLoginCommand;

@Configurable
public class HyeAppContext {
	
	@Bean
	public UsersLoginCommand usersLoginCommand() {
		return new UsersLoginCommand();
	}
	
}