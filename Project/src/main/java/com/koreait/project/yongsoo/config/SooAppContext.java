package com.koreait.project.yongsoo.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.yongsoo.command.comment.AddCommentCommand;
import com.koreait.project.yongsoo.command.comment.DeleteCommentCommand;
import com.koreait.project.yongsoo.command.comment.GetCommentListCommand;
import com.koreait.project.yongsoo.command.commonTrainer.GoTrainerDetailCommand;
import com.koreait.project.yongsoo.command.commonTrainer.GoTrainerListCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetTrainerMeetingListCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GoMeetingViewCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.CreateMeetingCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetOtherHostMeetingCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetOtherMeetingCommand;
import com.koreait.project.yongsoo.command.trainerQnA.GetTrainerQnACommand;
import com.koreait.project.yongsoo.command.trainerQnA.WriteTrainerQnACommand;

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
	public CreateMeetingCommand createMeetingCommand() {
		return new CreateMeetingCommand();
	}

	@Bean
	public GoMeetingViewCommand goMeetingViewCommand() {
		return new GoMeetingViewCommand();
	}
	
	@Bean
	public WriteTrainerQnACommand writeTrainerQnACommand() {
		return new WriteTrainerQnACommand();
	}

	@Bean
	public AddCommentCommand addCommentCommand() {
		return new AddCommentCommand();
	}
	
	@Bean
	public GetTrainerMeetingListCommand getTrainerMeetingListCommand() {
		return new GetTrainerMeetingListCommand();
	}
	
	@Bean
	public GetOtherMeetingCommand getOtherMeetingCommand() {
		return new GetOtherMeetingCommand();
	}
	
	@Bean
	public GetCommentListCommand getCommentListCommand() {
		return new GetCommentListCommand();
	}
	
	@Bean
	public GetOtherHostMeetingCommand getOtherHostMeetingCommand() {
		return new GetOtherHostMeetingCommand();
	}
	
	@Bean
	public DeleteCommentCommand deleteCommentCommand() {
		return new DeleteCommentCommand();
	}
	
	@Bean
	public GetTrainerQnACommand getTrainerQnACommand() {
		return new GetTrainerQnACommand();
	}
}