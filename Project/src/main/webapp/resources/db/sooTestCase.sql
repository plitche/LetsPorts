-- review 테이블 score 디폴트값 설정
ALTER TABLE REVIEW MODIFY SCORE NUMBER DEFAULT 0

-- user 임시용 3개 (트레이너)
INSERT INTO USERS values (10, 'user10@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '쫑코치', '잘부탁드려요', 'trainer1.png', 1992, 01, 01, 0, 0);
INSERT INTO USERS values (11, 'user11@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '뽀쌤', '잘부탁드려요', 'trainer2.png', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (12, 'user12@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', 'Eddy코치', '잘부탁드려요', 'trainer3.jpg', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (13, 'user13@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', 'Nina', '잘부탁드려요', 'trainer4.png', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (14, 'user14@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '천형', '잘부탁드려요', 'trainer5.png', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (15, 'user15@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '다이너마이트', '잘부탁드려요', 'trainer6.png', 2000, 12, 31, 2, 1);

INSERT INTO USERS values (30, 'user30@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '일반인1', '잘부탁드려요', 'profile30', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (31, 'user31@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '일반인2', '잘부탁드려요', 'profile31', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (32, 'user32@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '일반인3', '잘부탁드려요', 'profile32', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (33, 'user33@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '일반인4', '잘부탁드려요', 'profile33', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (34, 'user34@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '일반인5', '잘부탁드려요', 'profile34', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (35, 'user35@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '일반인6', '잘부탁드려요', 'profile35', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (36, 'user36@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '일반인7', '잘부탁드려요', 'profile36', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (37, 'user37@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '일반인8', '잘부탁드려요', 'profile37', 2000, 12, 31, 2, 1);

INSERT INTO USERS values (38, 'trainer1@letsports.com', 1111, 1, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '쫑트', '잘부탁드려요', 'trainer1.png', null, null, null, 0, 0);
INSERT INTO USERS values (39, 'trainer2@letsports.com', 1111, 1, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '킹트', '잘부탁드려요', 'trainer1.png', null, null, null, 0, 0);
INSERT INTO USERS values (40, 'trainer3@letsports.com', 1111, 1, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '홍트', '잘부탁드려요', 'trainer1.png', null, null, null, 0, 0);

-- 유저 관심 운동 종목 3개
INSERT INTO USER_INTEREST values (USER_INTEREST_SEQ.NEXTVAL, 10, 1);
INSERT INTO USER_INTEREST values (USER_INTEREST_SEQ.NEXTVAL, 10, 2);
INSERT INTO USER_INTEREST values (USER_INTEREST_SEQ.NEXTVAL, 10, 3);

-- 트레이너 상세정보
INSERT INTO TRAINER_INFO values (1, 10, 3, '김종석', '트레이너자격증', '신촌센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (2, 11, 4, '김보현', '트레이너자격증', '홍대센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (3, 12, 5, '박찬소', '트레이너자격증', '합정센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (4, 13, 6, '김나현', '트레이너자격증', '강남센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (5, 14, 7, '천현정', '트레이너자격증', '고양센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (6, 15, 8, '이병헌', '트레이너자격증', '영등포센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);

INSERT INTO trainer_info values (7, 38, 1, '강철종', '트레이너자격증', '신촌센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO trainer_info values (8, 39, 7, '김갑수', '트레이너자격증', '영등포센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO trainer_info values (9, 40, 10, '홍백현', '트레이너자격증', '강남센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);

-- 임시 모임(meeting)
INSERT INTO meeting VALUES (10, 39, 6, 3, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-09', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 0, NULL, 0, NULL, 0);
INSERT INTO meeting VALUES (11, 40, 4, 3, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-10', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 0, NULL, 0, NULL, 0);
INSERT INTO meeting VALUES (12, 38, 4, 4, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-14', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 0, NULL, 0, NULL, 0);
INSERT INTO meeting VALUES (13, 39, 6, 5, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-08', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 0, NULL, 0, NULL, 0);
INSERT INTO meeting VALUES (14, 40, 8, 4, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-20', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 0, NULL, 0, NULL, 0);
INSERT INTO meeting VALUES (15, 38, 8, 6, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-06', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 3, '개인사유취소', 0, NULL, 0);
INSERT INTO meeting VALUES (16, 39, 8, 6, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-08', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 0, NULL, 0, NULL, 0);
INSERT INTO meeting VALUES (17, 40, 8, 4, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-17', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 0, NULL, 0, NULL, 0);
INSERT INTO meeting VALUES (18, 38, 5, 5, 0, TO_DATE('2021-02-03 18:24:30', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-08', 'yyyy-mm-dd'), 0, 0, '테스트', '테스트', 0, NULL, 0, NULL, 0);

-- 임시 모임 참가자 테이블 테스트케이스 
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 39, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 30, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 31, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 32, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 33, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 34, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 35, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 36, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 10, 37, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 11, 40, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 11, 30, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 11, 31, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 12, 38, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 12, 32, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 12, 33, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 12, 34, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 13, 39, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 14, 40, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 14, 30, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 14, 31, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 15, 38, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 15, 32, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 39, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 33, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 34, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 35, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 36, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 38, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 40, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 30, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 38, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 31, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 32, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 33, SYSDATE, 1, NULL);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 34, SYSDATE, 1, NULL);

-- 리뷰 테이블 평가 관련 테스트케이스
INSERT INTO REVIEW values (5, 10, 4.0, 5, '꾀 괜찮았어요', SYSDATE, 0, 11);
INSERT INTO REVIEW values (6, 10, 5.0, 5, '너무 좋았어요', SYSDATE, 0, 12);

select * from users;
select * from meeting
select * from MATERIALS
select * from TRAINER_QNA
SELECT * FROM TRAINER_INFO;
select * from COMMENTS
select * from photo
select * from review
select * from BOARD_QNA
select * from Meeting_participants
select * from temp_board


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


SELECT *
  FROM (SELECT C1.*, ROWNUM RN
 	    FROM (SELECT *
 		      FROM COMMENTS
 		      WHERE COMMENT_REFERER_NO = 2
 		      ORDER BY COMMENT_NO DESC) C1 
 	   ) C2
       FULL OUTER JOIN USERS U
 	   ON C2.USER_NO = U.USER_NO
 WHERE RN BETWEEN 3 AND 5
 		
 		SELECT *
		  FROM (SELECT ROWNUM RN, B1.*
		          FROM (SELECT *
		                  FROM BOARD_QNA
		                 WHERE BOARD_QNA_NO IS NOT NULL
		                 ORDER BY BOARD_QNA_NO DESC) B1) B2 
      		   FULL OUTER JOIN USERS U
		       ON B2.USER_NO = U.USER_NO
		 WHERE B2.RN BETWEEN 3 AND 10 
           AND B2.BOARD_QNA_CONTENT LIKE '%'||'궁'||'%'
 
		SELECT *
		  FROM BOARD_QNA B JOIN USERS U
		    ON B.USER_NO = U.USER_NO
		 WHERE U.USER_NICKNAME LIKE '%'||'근'||'%' 

 		SELECT *
		  FROM BOARD_QNA B FULL OUTER JOIN USERS U
		    ON B.USER_NO = U.USER_NO
		 WHERE U.USER_NICKNAME LIKE '%'||'근'||'%' 
		 
		SELECT *
		  FROM (SELECT ROWNUM RN, B1.*
		          FROM (SELECT *
		                  FROM BOARD_QNA
		                 WHERE BOARD_QNA_NO IS NOT NULL
		                 ORDER BY BOARD_QNA_NO DESC) B1) B2 
      		   FULL OUTER JOIN USERS U
		       ON B2.USER_NO = U.USER_NO
		 WHERE RN BETWEEN 2 AND 12
		   AND (BOARD_QNA_TITLE LIKE '%'||'궁'||'%'
            OR BOARD_QNA_CONTENT LIKE '%'||'궁'||'%')
 
		 
		 

		 