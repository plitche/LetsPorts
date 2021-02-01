package com.koreait.project.jungho.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.jungho.command.TrainerClassCommentCommand.CommentInsertCommand;
import com.koreait.project.jungho.command.TrainerClassCommentCommand.CommentListCommand;

@Configurable
public class commentAppContext {

	@Bean
	public CommentListCommand commentListCommand() {
		return new CommentListCommand();
	}
	
	@Bean
	public CommentInsertCommand commentInsertCommand() {
		return new CommentInsertCommand();
	}
	
}
