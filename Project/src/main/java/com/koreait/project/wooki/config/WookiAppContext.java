package com.koreait.project.wooki.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.wooki.command.AdminLoginCommand;
import com.koreait.project.wooki.command.CheckUserCommand;
import com.koreait.project.wooki.command.SelectChartDataCommand;
import com.koreait.project.wooki.command.InsertIsReviewedCommand;
import com.koreait.project.wooki.command.admin.AdminListCommand;
import com.koreait.project.wooki.command.admin.UpdateAdminUserCommand;
import com.koreait.project.wooki.command.admin.UpdateNormalUserCommand;
import com.koreait.project.wooki.command.boards.BoardDeleteCommand;
import com.koreait.project.wooki.command.boards.BoardsListCommand;
import com.koreait.project.wooki.command.boards.BoardsOnHideToggleCommand;
import com.koreait.project.wooki.command.comments.CommentDeleteCommand;
import com.koreait.project.wooki.command.comments.CommentsListCommand;
import com.koreait.project.wooki.command.comments.CommentsOnHideToggleCommand;
import com.koreait.project.wooki.command.photo.PhotoListCommand;
import com.koreait.project.wooki.command.photo.PhotoOnHideToggleCommand;
import com.koreait.project.wooki.command.review.ReivewListCommand;
import com.koreait.project.wooki.command.review.ReviewOnHideToggleCommand;
import com.koreait.project.wooki.command.trainer.AddTrainerSendEmailCommand;
import com.koreait.project.wooki.command.trainer.DeleteTrainerInfoCommand;
import com.koreait.project.wooki.command.trainer.FilterTrainerUserListCommand;
import com.koreait.project.wooki.command.trainer.TrainerUserListCommand;
import com.koreait.project.wooki.command.trainerQnA.TAnswerdUpdateCommand;
import com.koreait.project.wooki.command.trainerQnA.TQnAListCommand;
import com.koreait.project.wooki.command.trainerQnA.TQnAOnHideToggleCommand;
import com.koreait.project.wooki.command.users.ChangeEmailCommand;
import com.koreait.project.wooki.command.users.ChangeEmailIsPossibleCommand;
import com.koreait.project.wooki.command.users.DeleteUserCommand;
import com.koreait.project.wooki.command.users.FilterUserListCommand;
import com.koreait.project.wooki.command.users.SendTempPassCommand;
import com.koreait.project.wooki.command.users.UserListCommand;

@Configurable
public class WookiAppContext {
	@Bean
	public AdminLoginCommand adminLoginCommand() {
		return new AdminLoginCommand();
	}
	
	@Bean
	public UserListCommand userListCommand() {
		return new UserListCommand();
	}
	
	@Bean
	public FilterUserListCommand filterUserListCommand() {
		return new FilterUserListCommand();
	}
	
	@Bean
	public ChangeEmailIsPossibleCommand changeEmailIsPossibleCommand() {
		return new ChangeEmailIsPossibleCommand();
	}
	
	@Bean
	public ChangeEmailCommand changeEmailCommand() {
		return new ChangeEmailCommand();
	}
	
	@Bean
	public SendTempPassCommand sendTempPassCommand() {
		return new SendTempPassCommand();
	}
	
	@Bean
	public AdminListCommand adminListCommand() {
		return new AdminListCommand();
	}
	
	@Bean
	public UpdateNormalUserCommand updateNormalUserCommand() {
		return new UpdateNormalUserCommand();
	}
	
	@Bean
	public CheckUserCommand checkUserCommand() {
		return new CheckUserCommand();
	}
	
	@Bean
	public UpdateAdminUserCommand updateAdminUserCommand() {
		return new UpdateAdminUserCommand();
	}
	
	@Bean
	public DeleteUserCommand deleteUserCommand() {
		return new DeleteUserCommand();
	}
	
	@Bean
	public TrainerUserListCommand trainerUserListCommand() {
		return new TrainerUserListCommand();
	}
	
	@Bean
	public FilterTrainerUserListCommand filterTrainerUserListCommand() {
		return new FilterTrainerUserListCommand();
	}
	
	@Bean
	public AddTrainerSendEmailCommand addTrainerSendEmailCommand() {
		return new AddTrainerSendEmailCommand();
	}
	
	@Bean
	public DeleteTrainerInfoCommand deleteTrainerInfoCommand() {
		return new DeleteTrainerInfoCommand();
	}
	
	@Bean
	public BoardsListCommand boardsListCommand() {
		return new BoardsListCommand();
	}
	
	@Bean
	public BoardsOnHideToggleCommand boardsOnHideToggleCommand() {
		return new BoardsOnHideToggleCommand();
	}
	
	@Bean
	public BoardDeleteCommand boardDeleteCommand() {
		return new BoardDeleteCommand();
	}
	
	@Bean
	public CommentsListCommand commentsListCommand() {
		return new CommentsListCommand();
	}
	
	@Bean
	public CommentsOnHideToggleCommand commentsOnHideToggleCommand() {
		return new CommentsOnHideToggleCommand();
	}
	
	@Bean
	public CommentDeleteCommand commentDeleteCommand() {
		return new CommentDeleteCommand();
	}
	
	@Bean
	public ReivewListCommand reivewListCommand() {
		return new ReivewListCommand();
	}
	
	@Bean
	public ReviewOnHideToggleCommand reviewOnHideToggleCommand() {
		return new ReviewOnHideToggleCommand();
	}
	
	@Bean
	public TQnAListCommand tQnAListCommand() {
		return new TQnAListCommand();
	}
	
	@Bean
	public TAnswerdUpdateCommand tAnswerdUpdateCommand() {
		return new TAnswerdUpdateCommand();
	}
	
	@Bean
	public TQnAOnHideToggleCommand tQnAOnHideToggleCommand() {
		return new TQnAOnHideToggleCommand();
	}
	
	@Bean
	public PhotoListCommand photoListCommand() {
		return new PhotoListCommand();
	}
	
	@Bean
	public PhotoOnHideToggleCommand photoOnHideToggleCommand() {
		return new PhotoOnHideToggleCommand();
	}
	
	@Bean
	public InsertIsReviewedCommand insertIsReviewedCommand() {
		return new InsertIsReviewedCommand();
	}
	
	@Bean
	public SelectChartDataCommand selectChartDataCommand() {
		return new SelectChartDataCommand();
	}
}
