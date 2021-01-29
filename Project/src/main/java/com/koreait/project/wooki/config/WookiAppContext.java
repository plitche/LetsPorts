package com.koreait.project.wooki.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.wooki.command.AdminLoginCommand;
import com.koreait.project.wooki.command.UserListCommand;

@Configurable
public class WookiAppContext {
	@Bean
	public AdminLoginCommand adminLoginCommand() {
		return new AdminLoginCommand();
	}
	
	@Bean
	public UserListCommand userListCommand() {
		return new UserListCommand();
	}
}
