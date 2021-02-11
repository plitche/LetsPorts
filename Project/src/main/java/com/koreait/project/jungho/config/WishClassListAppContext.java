package com.koreait.project.jungho.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.jungho.command.WishClassListCommand.WishClassDeleteCommand;
import com.koreait.project.jungho.command.WishClassListCommand.WishClassListInsertCommand;
import com.koreait.project.jungho.command.WishClassListCommand.WishClassListListCommand;
import com.koreait.project.jungho.command.WishClassListCommand.WishClassTotalCommand;

@Configurable
public class WishClassListAppContext {
	

	@Bean
	public WishClassListListCommand wishClassListListCommand() {
		return new WishClassListListCommand();
	}

	@Bean
	public WishClassListInsertCommand wishClassListInsertCommand() {
		return new WishClassListInsertCommand();
	}
	
	@Bean
	public WishClassTotalCommand wishClassTotalCommand() {
		return new WishClassTotalCommand();
	}
	
	@Bean
	public WishClassDeleteCommand wishClassDeleteCommand() {
		return new WishClassDeleteCommand();
	}

	
}
