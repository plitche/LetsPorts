package com.koreait.project.yongsoo.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.yongsoo.command.Scrap.InsertScrapCommand;
import com.koreait.project.yongsoo.command.Scrap.IsInWishListCommand;
import com.koreait.project.yongsoo.command.meetingComment.AddCommentCommand;
import com.koreait.project.yongsoo.command.meetingComment.DeleteCommentCommand;
import com.koreait.project.yongsoo.command.meetingComment.GetCommentListCommand;
import com.koreait.project.yongsoo.command.qna.AddQnACommnetCommand;
import com.koreait.project.yongsoo.command.qna.DeleteQnACommand;
import com.koreait.project.yongsoo.command.qna.DeleteQnACommentCommand;
import com.koreait.project.yongsoo.command.qna.GetQnACommentCommand;
import com.koreait.project.yongsoo.command.qna.GetQnAListCommand;
import com.koreait.project.yongsoo.command.qna.GoQnAViewPageCommand;
import com.koreait.project.yongsoo.command.qna.GoUpdateQnAPageCommand;
import com.koreait.project.yongsoo.command.qna.SolveQnACommend;
import com.koreait.project.yongsoo.command.qna.UpdateQnACommand;
import com.koreait.project.yongsoo.command.qna.UpdateQnACommentContentCommand;
import com.koreait.project.yongsoo.command.qna.WriteQnACommand;

import com.koreait.project.yongsoo.command.trainer.GoTrainerDetailCommand;
import com.koreait.project.yongsoo.command.trainer.GoTrainerListCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.CreateMeetingCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetOtherHostMeetingCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetOtherMeetingCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GetTrainerMeetingListCommand;
import com.koreait.project.yongsoo.command.trainerMeeting.GoMeetingViewCommand;
import com.koreait.project.yongsoo.command.trainerQnA.GetTrainerQnACommand;
import com.koreait.project.yongsoo.command.trainerQnA.ShowQnACommand;
import com.koreait.project.yongsoo.command.trainerQnA.WriteAnswerCommand;
import com.koreait.project.yongsoo.command.trainerQnA.WriteTrainerQnACommand;
import com.koreait.project.yongsoo.command.trainerReview.FindJoinMeetingListCommand;
import com.koreait.project.yongsoo.command.trainerReview.GetAllReviewContentCommand;
import com.koreait.project.yongsoo.command.trainerReview.GetTrainerReviewListCommand;
import com.koreait.project.yongsoo.command.trainerReview.ShortReviewContentCommand;
import com.koreait.project.yongsoo.command.trainerReview.WriteReviewCommand;

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
	
	@Bean
	public ShowQnACommand showQnACommand() {
		return new ShowQnACommand();
	}
	
	@Bean
	public WriteAnswerCommand writeAnswerCommand() {
		return new WriteAnswerCommand();
	}
	
	@Bean
	public GetTrainerReviewListCommand getTrainerReviewListCommand() {
		return new GetTrainerReviewListCommand();
	}
	
	@Bean
	public FindJoinMeetingListCommand findJoinMeetingListCommand() {
		return new FindJoinMeetingListCommand();
	}
	
	@Bean
	public WriteReviewCommand writeReviewCommand() {
		return new WriteReviewCommand();
	}
	
	@Bean
	public GetAllReviewContentCommand getAllReviewContentCommand() {
		return new GetAllReviewContentCommand();
	}
	
	@Bean
	public ShortReviewContentCommand shortReviewContentCommand() {
		return new ShortReviewContentCommand();
	}

	@Bean
	public GetQnAListCommand getQnAListCommand() {
		return new GetQnAListCommand();
	}
	
	@Bean
	public WriteQnACommand writeQnACommand() {
		return new WriteQnACommand();
	}
	
	@Bean
	public GoQnAViewPageCommand goQnAViewPageCommand() {
		return new GoQnAViewPageCommand();
	}
	
	@Bean
	public UpdateQnACommand updateQnACommand() {
		return new UpdateQnACommand();
	}
	
	@Bean
	public DeleteQnACommand deleteQnACommand() {
		return new DeleteQnACommand();
	}

	
	@Bean
	public GetQnACommentCommand getQnACommentCommand() {
		return new GetQnACommentCommand();
	}
	
	@Bean
	public AddQnACommnetCommand addQnACommnetCommand() {
		return new AddQnACommnetCommand();
	}
	
	@Bean
	public DeleteQnACommentCommand deleteQnACommentCommand() {
		return new DeleteQnACommentCommand();
	}
	
	@Bean
	public UpdateQnACommentContentCommand updateQnACommentContentCommand() {
		return new UpdateQnACommentContentCommand();
	}
	
	@Bean
	public SolveQnACommend solveQnACommend() {
		return new SolveQnACommend();
	}
	
	@Bean
	public GoUpdateQnAPageCommand goUpdateQnAPageCommand() {
		return new GoUpdateQnAPageCommand();
	}
	
	@Bean
	public IsInWishListCommand isInWishListCommand() {
		return new IsInWishListCommand();
	}
	
	@Bean
	public InsertScrapCommand insertScrapCommand() {
		return new InsertScrapCommand();
	}
	
}