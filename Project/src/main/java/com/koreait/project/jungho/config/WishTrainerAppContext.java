package com.koreait.project.jungho.config;

import org.springframework.context.annotation.Bean;

import com.koreait.project.jungho.command.WishTrainerCommand.WishTrainerDeleteCommand;
import com.koreait.project.jungho.command.WishTrainerCommand.WishTrainerInsertCommand;
import com.koreait.project.jungho.command.WishTrainerCommand.WishTrainerListCommand;
import com.koreait.project.jungho.command.WishTrainerCommand.WishTrainerTotalCommand;

public class WishTrainerAppContext {
	
	@Bean
	public WishTrainerListCommand wishTrainerListCommand() {
		return new WishTrainerListCommand();
	}
	
	@Bean
	public WishTrainerTotalCommand wishTrainerTotalCommand() {
		return new WishTrainerTotalCommand();
	}
	
	@Bean
	public WishTrainerInsertCommand wishTrainerInsertCommand() {
		return new WishTrainerInsertCommand();
	}
	
	@Bean
	public WishTrainerDeleteCommand wishTrainerDeleteCommand() {
		return new WishTrainerDeleteCommand();
	}

}
