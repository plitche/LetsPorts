package com.koreait.project.wooki.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.wooki.command.AddTrainerSendEmailCommand;
import com.koreait.project.wooki.command.AdminListCommand;
import com.koreait.project.wooki.command.AdminLoginCommand;
import com.koreait.project.wooki.command.BoardsListCommand;
import com.koreait.project.wooki.command.ChangeEmailCommand;
import com.koreait.project.wooki.command.ChangeEmailIsPossibleCommand;
import com.koreait.project.wooki.command.CheckUserCommand;
import com.koreait.project.wooki.command.DeleteTrainerInfoCommand;
import com.koreait.project.wooki.command.DeleteUserCommand;
import com.koreait.project.wooki.command.FilterTrainerUserListCommand;
import com.koreait.project.wooki.command.UserListCommand;
import com.koreait.project.wooki.command.FilterUserListCommand;
import com.koreait.project.wooki.command.SendTempPassCommand;
import com.koreait.project.wooki.command.TrainerUserListCommand;
import com.koreait.project.wooki.command.UpdateAdminUserCommand;
import com.koreait.project.wooki.command.UpdateNormalUserCommand;

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
}
