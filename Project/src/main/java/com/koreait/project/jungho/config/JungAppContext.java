package com.koreait.project.jungho.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;

import com.koreait.project.jungho.command.TagCommand.Tag0Command;
import com.koreait.project.jungho.command.TagCommand.Tag1Command;
import com.koreait.project.jungho.command.TagCommand.Tag2Command;
import com.koreait.project.jungho.command.TagCommand.Tag3Command;
import com.koreait.project.jungho.command.TagCommand.Tag4Command;
import com.koreait.project.jungho.command.TagCommand.Tag5Command;
import com.koreait.project.jungho.command.TagCommand.Tag6Command;
import com.koreait.project.jungho.command.TagCommand.Tag7Command;
import com.koreait.project.jungho.command.TagCommand.Tag8Command;
import com.koreait.project.jungho.command.TrainerClassCommand.ExerciseMateListCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.RelatedClassCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.SearchClassCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassDeleteCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassInsertCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassListCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassUpdateCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerClassViewCommand;
import com.koreait.project.jungho.command.TrainerClassCommand.TrainerListCommand;

@Configurable
public class JungAppContext {
	
	
	@Bean
	public TrainerClassListCommand trainerClassListCommand() {
		return new TrainerClassListCommand();
	}
	
	@Bean
	public TrainerListCommand trainerListCommand() {
		return new TrainerListCommand();
	}
	
	@Bean
	public ExerciseMateListCommand exerciseMateListCommand() {
		return new ExerciseMateListCommand();
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
	
	@Bean
	public RelatedClassCommand relatedClassCommand() {
		return new RelatedClassCommand();
	}
	
	@Bean
	public SearchClassCommand searchClassCommand() {
		return new SearchClassCommand();
	}
	
	// 태그에 대한 bean
	
	@Bean
	public Tag0Command tag0Command() {
		return new Tag0Command();
	}
	@Bean
	public Tag1Command tag1Command() {
		return new Tag1Command();
	}
	@Bean
	public Tag2Command tag2Command() {
		return new Tag2Command();
	}
	@Bean
	public Tag3Command tag3Command() {
		return new Tag3Command();
	}
	@Bean
	public Tag4Command tag4Command() {
		return new Tag4Command();
	}
	@Bean
	public Tag5Command tag5Command() {
		return new Tag5Command();
	}
	@Bean
	public Tag6Command tag6Command() {
		return new Tag6Command();
	}
	@Bean
	public Tag7Command tag7Command() {
		return new Tag7Command();
	}
	@Bean
	public Tag8Command tag8Command() {
		return new Tag8Command();
	}

}
