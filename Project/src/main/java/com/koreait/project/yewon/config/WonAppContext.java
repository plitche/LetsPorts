package com.koreait.project.yewon.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.yewon.command.GoknowHowDetailCommand;
import com.koreait.project.yewon.command.GoknowHowInsertCommand;
import com.koreait.project.yewon.command.GoknowHowListCommand;

@Configurable
public class WonAppContext {

	@Bean
	public GoknowHowListCommand goknowhowListCommand() {
		return new GoknowHowListCommand();
	}
	
	@Bean
	public GoknowHowDetailCommand goknowHowDetailCommand() {
		return new GoknowHowDetailCommand();
	}
	
	@Bean
	public GoknowHowInsertCommand goknowHowInsertCommand() {
		return new GoknowHowInsertCommand();
	}
	
	
	
	
}
