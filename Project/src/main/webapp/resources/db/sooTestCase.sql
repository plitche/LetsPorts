-- review 테이블 score 디폴트값 설정
ALTER TABLE REVIEW MODIFY SCORE NUMBER DEFAULT 0

-- user 임시용 3개 (트레이너)
INSERT INTO USERS values (10, 'user10@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '머슬맨', '잘부탁드려요', 'profile10', 1992, 01, 01, 0, 0);
INSERT INTO USERS values (11, 'user11@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '근육걸', '잘부탁드려요', 'profile11', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (12, 'user12@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '헬스맨', '잘부탁드려요', 'profile12', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (30, 'user30@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '일반인1', '잘부탁드려요', 'profile30', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (31, 'user31@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '일반인2', '잘부탁드려요', 'profile31', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (32, 'user32@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '일반인3', '잘부탁드려요', 'profile32', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (33, 'user33@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '일반인4', '잘부탁드려요', 'profile33', 2000, 12, 31, 2, 1);

-- 트레이너 상세정보 3개
INSERT INTO TRAINER_INFO values (1, 10, 3, '김철수', '트레이너자격증', '신촌센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (2, 11, 4, '곽영희', '트레이너자격증', '홍대센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (3, 12, 5, '박진희', '트레이너자격증', '합정센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);

-- 임시 모임(meeting) 3개 
INSERT INTO MEETING values (5, 11, 10, 6, 0, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '족구합시다.', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (6, 12, 8, 4, 3, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '볼링합시다.', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (7, 13, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);

-- 임시 모임 참가자 테이블 테스트케이스 
INSERT INTO MEETING_PARTICIPANTS VALUES (1, 1, 30, SYSDATE, 1, null);
INSERT INTO MEETING_PARTICIPANTS VALUES (2, 1, 31, SYSDATE, 1, null);
INSERT INTO MEETING_PARTICIPANTS VALUES (3, 2, 30, SYSDATE, 1, null);
INSERT INTO MEETING_PARTICIPANTS VALUES (4, 2, 31, SYSDATE, 1, null);
INSERT INTO MEETING_PARTICIPANTS VALUES (5, 1, 32, SYSDATE, 1, null);
INSERT INTO MEETING_PARTICIPANTS VALUES (6, 2, 32, SYSDATE, 1, null);
INSERT INTO MEETING_PARTICIPANTS VALUES (7, 1, 33, SYSDATE, 1, null);
INSERT INTO MEETING_PARTICIPANTS VALUES (8, 2, 33, SYSDATE, 1, null);

-- 리뷰 테이블 평가 관련 테스트케이스
INSERT INTO REVIEW values (5, 10, 4.0, 5, '꾀 괜찮았어요', SYSDATE, 0, 11);
INSERT INTO REVIEW values (6, 10, 5.0, 5, '너무 좋았어요', SYSDATE, 0, 12);


select * from meeting
select * from MATERIALS
select * from TRAINER_QNA
SELECT * FROM TRAINER_INFO;
select * from COMMENTS
select * from photo
select * from review

SELECT *
  FROM (SELECT T1.*, ROWNUM RN
        FROM (SELECT *
        	  FROM TRAINER_QNA
        	  WHERE TRAINER_USER_NO = 10
              ORDER BY TRAINER_QNA_NO DESC) T1
       )
 WHERE RN BETWEEN 11 AND 20

SELECT *
FROM (SELECT ROWNUM RN, trainer_qna_title, trainer_qna_content
      FROM TRAINER_QNA 
      WHERE TRAINER_USER_NO = 10 
      ORDER BY TRAINER_QNA_NO DESC) T1 
WHERE T1.RN BETWEEN 3 AND 5




SELECT *
  FROM (SELECT M1.*, ROWNUM RN
        FROM (SELECT *
              FROM MEETING
              WHERE USER_NO = 10
              ORDER BY MEETING_NO DESC) M1
        ) M2 
  	    FULL OUTER JOIN USERS U 
        ON M2.USER_NO = U.USER_NO
        FULL OUTER JOIN EXERCISE E
        ON M2.EXERCISE_NO = E.EXERCISE_NO
        FULL OUTER JOIN PHOTO P
        ON M2.meeting_no = P.photo_referer_no
 WHERE RN = 1



		 