package com.koreait.project.yewon.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.yewon.command.GoknowHowDeleteCommand;
import com.koreait.project.yewon.command.GoknowHowDetailCommand;
import com.koreait.project.yewon.command.GoknowHowInsertCommand;
import com.koreait.project.yewon.command.GoknowHowListCommand;
import com.koreait.project.yewon.command.GoknowHowUpdateCommand;
import com.koreait.project.yewon.command.GoknowHowUpdatePageCommand;
import com.koreait.project.yewon.command.GoknowHowViewCommand;

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
	
	@Bean
	public GoknowHowViewCommand goknowHowViewCommand() {
		return new GoknowHowViewCommand();
	}
	
	@Bean
	public GoknowHowUpdateCommand goknowHowUpdateCommand() {
		return new GoknowHowUpdateCommand();
	}
	
	@Bean
	public GoknowHowUpdatePageCommand goknowHowUpdatePageCommand() {
		return new GoknowHowUpdatePageCommand();
	}
	
	// viewPage에서 삭제 Command
	@Bean
	public GoknowHowDeleteCommand goknowHowDeleteCommand() {
		return new GoknowHowDeleteCommand();
	}
	
}
