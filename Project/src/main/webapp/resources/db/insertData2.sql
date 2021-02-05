-- user 임시용 3개 (트레이너)
INSERT INTO USERS values (10, 'user10@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '머슬맨', '잘부탁드려요', 'profile10', 1992, 01, 01, 0, 0);
INSERT INTO USERS values (11, 'user11@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '근육걸', '잘부탁드려요', 'profile11', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (12, 'user12@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '헬스맨', '잘부탁드려요', 'profile12', 2000, 12, 31, 2, 1);

-- 트레이너 상세정보 3개
INSERT INTO TRAINER_INFO values (3, 10, 3, '김철수', '트레이너자격증', '신촌센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (4, 11, 4, '곽영희', '트레이너자격증', '홍대센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (5, 12, 5, '박진희', '트레이너자격증', '합정센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);

-- 트레이너 클래스 정보 5개
-- 임시 모임(meeting) 3개 
INSERT INTO MEETING values (5, 11, 10, 6, 0, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '족구합시다.', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (6, 12, 8, 4, 3, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '볼링합시다.', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (7, 13, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (1, 14, 4, 2, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 3,'축구교실', '운동은 다같이', 1, '', 1, '903동 1101호', 1);
INSERT INTO MATERIALS values (1, 1, '운동복', SYSDATE);

-- 임시 모임(meeting) 3개 
INSERT INTO MEETING values (2, 10, 10, 6, 0, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '족구합시다.', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (3, 10, 8, 4, 3, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '볼링합시다.', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (4, 10, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);

-- 임시 모임 참가자 테이블 테스트케이스 
INSERT INTO MEETING_PARTICIPANTS VALUES (1, 5, 11, SYSDATE, 1, null);
INSERT INTO MEETING_PARTICIPANTS VALUES (2, 5, 12, SYSDATE, 1, null);

-- 리뷰 테이블 평가 관련 테스트케이스
INSERT INTO REVIEW values (5, 10, 4.0, 5, '꾀 괜찮았어요', SYSDATE, 0, 11);
INSERT INTO REVIEW values (6, 10, 5.0, 5, '너무 좋았어요', SYSDATE, 0, 12);

-- 트레이너에게 질문하는 테스트케이스
INSERT INTO TRAINER_QNA values (20, 11, 10, '질문있어요1', '이거 좋아요?', SYSDATE, 1, 0, null, null, 0);
INSERT INTO TRAINER_QNA values (21, 12, 10, '질문있어요2', '이거 별로져?', SYSDATE, 1, 0, null, null, 0);



select * from MEETING;

select * from MATERIALS;
select * from comments;

