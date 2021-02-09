package com.koreait.project.yewon.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.yewon.command.KnowhowCommentCommand.CommentDeleteCommand;
import com.koreait.project.yewon.command.KnowhowCommentCommand.CommentInsertCommand;
import com.koreait.project.yewon.command.KnowhowCommentCommand.CommentListCommand;
import com.koreait.project.yewon.command.KnowhowCommentCommand.CommentUpdateCommand;

@Configurable
public class KnowhowCommentAppContext {

	@Bean
	public CommentListCommand commentListCommand() {
		return new CommentListCommand();
	}
	
	@Bean
	public CommentInsertCommand commentInsertCommand() {
		return new CommentInsertCommand();
	}
	
	@Bean
	public CommentDeleteCommand commentDeleteCommand() {
		return new CommentDeleteCommand();
	}
	
	@Bean
	public CommentUpdateCommand commentUpdateCommand() {
		return new CommentUpdateCommand();
	}

}
