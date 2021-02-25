# introduction

* Korea It Academy final Project (코리아IT아카데미 최종 프로젝트)
* 주제 : Let'sPort - 사용자를 위한 운동 모임 커뮤니티
* 개발기간 : 2021.01.25 ~ 2021.02.19(약 4주)
* 개발인원 : 5명
* 저의 상세 코드를 보길 희망하시면 아래의 경로를 확인해주세요.
### LetsPorts/Project/src/main/java/com/koreait/project/yongsoo/
### LetsPorts/Project/src/main/webapp/WEB-INF/views/yongPage/

# Demo
![캡처](https://user-images.githubusercontent.com/70326085/109097682-23bd2c80-7763-11eb-98a8-7fa5a59c3f3a.PNG)


# Model
> _빨간 박스 : 제가 주로 사용했던 테이블입니다._
![tables](https://user-images.githubusercontent.com/70326085/108591854-34118800-73ae-11eb-91c5-f1a7eb456ef8.jpg)

# Technologies

* Java
* HTML/CSS
* Oracle
* Apache Tomcat
* Spring
* MyBatis

# Features
![캡처](https://user-images.githubusercontent.com/70326085/109098123-0fc5fa80-7764-11eb-8b34-d7b890ac4b89.PNG)

* mainPage (전체 ajax통신을 이용)
   - 모임 마감시간이 임박한 list
     - 모집 마감 시간이 현재시간기준 12시간 전인 모임 중 짧게 남은 순서
   - 최근에 작성된 질의응답 게시글 list
   - 평가 점수가 높은 순서 trainer list
     - 최소 작성된 리뷰 개수가 5개 이상인 트레이너 중 평균 score가 높은 순서

* trainer
   - 트레이너 List 페이지 구현
     - hover시 트레이너 정보 표기
   - 트레이너 상세정보 페이지 구현 (전체 ajax통신을 이용)
     - 모임, 리뷰, 질문 탭으로 구성(페이지 이동X)
     - 해당 트레이너로 로그인 시 '새 모임 개설' 가능
     - 모집 마감일 기준 모집중/모집마감 분기

     - 함께한 모임이 있을 경우에만 리뷰 작성 가능(modal)
     - 1개의 모임에 1개의 리뷰만 작성하도록 제한
     - 리뷰내용은 특정 길이 초과시 기준으로... 표시
     - 리뷰 내용 클릭시 전체 리뷰 내용 표기
     - 리뷰 내용 다시 클릭시 다시 ...표시
     
     - 질문 list table형식 (ajax paging)
     - 질문작성시 동적 게시글 생성
     - 질문작성시 비밀글 처리 가능(modal)
     - 질문작성자, 해당트레이너 이외에 비밀글 view 불가
     - 해당트레이너 로그인시 질문에 답변 작성 가능(modal)

* meeting(모임)
   - 모임 개설 페이지 구현
     - 지도 마커 기능 (kakao map api)
   - 모임 상세정보 페이지 구현
     - 마커가 표시된 지도 image (kakao map api)
     - 동일 운동 다른 유져의 모임 list
     - 동일 유져의 다른 운동 모임 list
     - 모임 작성자에게 질문하기(modal)
     - 댓글 기능 (작성, 수정, 삭제 - ajax)

* Q&A
   - 질의응답 table형식 list 구현
     - 질문 해결완료/미해결에 따른 필터링 기능
     - 검색 기능('제목+내용', '제목만', '작성자')
   - 질문 작성 페이지 구현
   - 질의응답 상세정보 페이지 구현
     - 질문작성자가 로그인시 해결완료/수정/삭제 기능
     - 질문 해결완료시 수정/삭제/댓글 작성 불가능(ajax)
     - 댓글 기능 (작성, 수정, 삭제 - ajax)
   - 질문 수정 페이지 구현

# Detail Code
### 제가 구현한 주요 핵심 코드입니다.
![1](https://user-images.githubusercontent.com/70326085/109098073-f4f38600-7763-11eb-80d6-fedf8cefaf4f.PNG)
![2](https://user-images.githubusercontent.com/70326085/109098081-f755e000-7763-11eb-8830-e56ccea7196c.PNG)
![3](https://user-images.githubusercontent.com/70326085/109098085-f8870d00-7763-11eb-9f0e-1ada24e3cddd.PNG)
![4](https://user-images.githubusercontent.com/70326085/109098089-f91fa380-7763-11eb-83d2-a78d48c6226d.PNG)
![5](https://user-images.githubusercontent.com/70326085/109098092-f9b83a00-7763-11eb-8b0a-58d03f9b77cf.PNG)

