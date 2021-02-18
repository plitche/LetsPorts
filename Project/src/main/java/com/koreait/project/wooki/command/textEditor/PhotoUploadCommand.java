package com.koreait.project.wooki.command.textEditor;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.EditorDao;

public class PhotoUploadCommand implements CommonMapCommand {
	
	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) model.asMap().get("multipartRequest");
		
		// 파일 및 테이블 업로드 정보 파라미터 받아오기
		MultipartFile file = multipartRequest.getFile("uploadFile");
		int user_no = Integer.parseInt(multipartRequest.getParameter("user_no"));
		int temp_no = Integer.parseInt(multipartRequest.getParameter("temp_no"));
		
		Map<String, Object> map = new HashMap<>();

		// 파일 실 첨부여부 검사
		if(file != null && !file.isEmpty()) {
			// 실제 업로드 파일명
			String originalFilename = file.getOriginalFilename();

			// 업로드할 파일명
			int pos = originalFilename.lastIndexOf(".");
			String extension = originalFilename.substring(pos + 1);
			String uploadFilename = System.currentTimeMillis() + "." + extension;
			
			// 업로드 경로
			String realPath = multipartRequest.getServletContext().getRealPath("/resources/storage");
			
			File dir = new File(realPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			File uploadFile = new File(realPath, uploadFilename);
			
			// 파일업로드 진행
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 업로드 파일 photo table 저장
			sqlSession.getMapper(EditorDao.class).insertTempPhoto(temp_no, user_no, uploadFilename);
			
			// 업로드 파일명 반환
			map.put("filename", uploadFilename);
		}
		
		return map;
	}
}
