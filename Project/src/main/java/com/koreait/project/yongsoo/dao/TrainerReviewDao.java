package com.koreait.project.yongsoo.dao;

import java.util.List;

import com.koreait.project.dto.MeetingDto;
import com.koreait.project.dto.ReviewDto;
import com.koreait.project.yongsoo.dto.ReviewTemDto;

public interface TrainerReviewDao {

	// 트레이너 디테일 페이지로 이동시 자등으로 리뷰 리스트를 불러오기 위한 메소드
	public List<ReviewTemDto> getTrainerReviewList(int user_no);
	// 트레이너 리스트페이지에서 트레이너 디테일 패이지로 이동 시 해당 트레이너에게 달린 리뷰 개수를 알아내기 위한 메소드
	public int listCount(int user_no);
	
	// 유져가 리뷰 작성하기 버튼을 클릭시 현재 보고있는 트레이너와 함께한 모임리스트를 가져오기 위한 메소드
	public List<MeetingDto> findJoinMeetingList(int target_user_no, int writer_user_no);
	
	// 해당 트레이너에게 작성할 수 있는 리뷰가 없을 때 이미 모든 모임에 대해 다 작성했던건지 판단하기 위한 메소드
	public int findAlreadyRevied(int target_user_no, int writer_user_no);
	
	// 리뷰 작성 완료 버튼 클릭 시 작동할 메소드
	public int wrtieReview(ReviewDto reviewDto);
	// 리뷰 테이블에 insert 즉시 is_reviewed테이블에 작성 상태를 업데이트 해주기위한 메소드
	public void updateIsReviewedStatus(int meeting_no, int target_user_no, int writer_user_no);
	
	// 리뷰 내용 클릭 시 전체 리뷰 내용을 가지고 올 메소드
	public String getAllReviewContent(int review_no);
	
	
}
