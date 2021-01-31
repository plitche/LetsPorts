package com.koreait.project.jungho.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.jungho.command.TrainerClassDeleteCommand;
import com.koreait.project.jungho.command.TrainerClassInsertCommand;
import com.koreait.project.jungho.command.TrainerClassListCommand;
import com.koreait.project.jungho.command.TrainerClassUpdateCommand;
import com.koreait.project.jungho.command.TrainerClassViewCommand;

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
	
	@Bean
	public TrainerClassViewCommand trainerClassViewCommand() {
		return new TrainerClassViewCommand();
	}
	
	@Bean
	public TrainerClassDeleteCommand trainerClassDeleteCommand() {
		return new TrainerClassDeleteCommand();
	}
	
	@Bean
	public TrainerClassUpdateCommand trainerClassUpdateCommand() {
		return new TrainerClassUpdateCommand();
	}

}
