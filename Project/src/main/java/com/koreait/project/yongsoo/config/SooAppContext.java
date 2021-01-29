package com.koreait.project.yongsoo.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.yongsoo.command.GoTrainerDetailCommand;
import com.koreait.project.yongsoo.command.GoTrainerListCommand;

import com.koreait.project.yongsoo.command.InsertMeetingCommand;


@Configurable
public class SooAppContext {

	@Bean
	public GoTrainerListCommand goTrainerListCommand() {
		return new GoTrainerListCommand();
	}
	
	@Bean
	public GoTrainerDetailCommand goTrainerDetailCommand() {
		return new GoTrainerDetailCommand();
	}
	

	@Bean
	public InsertMeetingCommand insertMeetingCommand() {
		return new InsertMeetingCommand();
	}

}
