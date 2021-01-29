package com.koreait.project.jungho.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.jungho.command.TrainerClassInsertCommand;
import com.koreait.project.jungho.command.TrainerClassListCommand;

@Configurable
public class JungAppContext {
	
	
	@Bean
	public TrainerClassListCommand trainerClassListCommand() {
		return new TrainerClassListCommand();
	}
	
	@Bean
	public TrainerClassInsertCommand trainerClassInsertCommand() {
		return new TrainerClassInsertCommand();
	}

}
