package com.koreait.project.wooki.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.koreait.project.wooki.command.textEditor.BoardUpdatePageCommand;
import com.koreait.project.wooki.command.textEditor.InsertBoardTestCommand;
import com.koreait.project.wooki.command.textEditor.IsnertTempBoardCommand;
import com.koreait.project.wooki.command.textEditor.PhotoDeleteCommand;
import com.koreait.project.wooki.command.textEditor.PhotoUploadCommand;
import com.koreait.project.wooki.command.textEditor.TestViewCommand;

@Configuration
public class EditorAppContext {
	
	@Bean
	public IsnertTempBoardCommand isnertTempBoardCommand() {
		return new IsnertTempBoardCommand();
	}

	@Bean
	public PhotoUploadCommand photoUploadCommand() {
		return new PhotoUploadCommand();
	}
	
	@Bean
	public PhotoDeleteCommand photoDeleteCommand() {
		return new PhotoDeleteCommand();
	}
	
	
	// 테스트케이스들
	@Bean
	public InsertBoardTestCommand insertBoardTestCommand() {
		return new InsertBoardTestCommand();
	}
	
	@Bean
	public TestViewCommand testViewCommand() {
		return new TestViewCommand();
	}
	
	@Bean
	public BoardUpdatePageCommand boardUpdatePageCommand() {
		return new BoardUpdatePageCommand();
	}
}
