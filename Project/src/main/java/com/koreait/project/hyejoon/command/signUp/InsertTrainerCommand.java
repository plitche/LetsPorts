package com.koreait.project.hyejoon.command.signUp;

import java.io.File;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.Trainer_infoDto;
import com.koreait.project.hyejoon.dao.WookiClientDao;

public class InsertTrainerCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) model.asMap().get("multipartRequest");
		
		MultipartFile file = multipartRequest.getFile("certificate_filename");
		int user_no = Integer.parseInt(multipartRequest.getParameter("user_no"));
		int career = Integer.parseInt(multipartRequest.getParameter("career"));
		String trainer_name = multipartRequest.getParameter("trainer_name");
		String employment = multipartRequest.getParameter("employment");
		String profile = multipartRequest.getParameter("profile");
		Trainer_infoDto trainer_infoDto = new Trainer_infoDto();
		trainer_infoDto.setUser_no(user_no);
		trainer_infoDto.setCareer(career);
		trainer_infoDto.setTrainer_name(trainer_name);
		trainer_infoDto.setEmployment(employment);
		trainer_infoDto.setProfile(profile);
		
		if(file != null && !file.isEmpty()) {
			String originalFilename = file.getOriginalFilename();
			int pos = originalFilename.lastIndexOf(".");
			String extension = originalFilename.substring(pos + 1);
			String uploadFilename = System.currentTimeMillis() + "." + extension;
			
			String realPath = multipartRequest.getServletContext().getRealPath("/resources/storage/certificate");
			
			File dir = new File(realPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			File uploadFile = new File(realPath, uploadFilename);
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			trainer_infoDto.setCertificate_filename(uploadFilename);
		}
		sqlSession.getMapper(WookiClientDao.class).updateTrainerUser(user_no);
		sqlSession.getMapper(WookiClientDao.class).insertTrainer(trainer_infoDto);
	}

}
