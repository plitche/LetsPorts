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
  FROM (SELECT ROWNUM RN, A.*
          FROM (SELECT U.USER_NO, AVG(M.MEETING_MAX)
				  FROM USERS U FULL OUTER JOIN MEETING M
				    ON M.USER_NO = U.USER_NO
				 WHERE M.USER_NO IN (SELECT USER_NO 
				 					   FROM MEETING 
				 					  GROUP BY USER_NO 
				 					 HAVING COUNT(*) > 1) 
				GROUP BY U.USER_NO
				ORDER BY AVG(M.MEETING_MAX) DESC) A ) B
       FULL OUTER JOIN USERS U
       ON B.USER_NO = U.USER_NO
       WHERE B.USER_NO IS NOT NULL
        AND B.RN < 3
					
		SELECT *
		  FROM (SELECT ROWNUM RN, R1.*
		          FROM (SELECT U.USER_NO, AVG(R.SCORE)
					      FROM USERS U FULL OUTER JOIN REVIEW R
					        ON U.USER_NO = R.TARGET_USER_NO
					     WHERE U.USER_NO IN (SELECT TARGET_USER_NO
					        				   FROM REVIEW
					       				      GROUP BY TARGET_USER_NO
					       				     HAVING COUNT(*) > 4
					       				    )
				  	     GROUP BY U.USER_NO
				  	     ORDER BY AVG(R.SCORE) DESC ) R1 ) R2
		        FULL OUTER JOIN USERS U
		        ON U.USER_NO = R2.TARGET_USER_NO
		        FULL OUTER JOIN TRAINER_INFO T
		        ON T.USER_NO = R2.TARGET_USER_NO
		 WHERE R2.TARGET_USER_NO IS NOT NULL
		   AND U.DISABLE = 0
		   AND R2.RN BETWEEN 1 AND 2
        


		SELECT *
		  FROM (SELECT M1.*, ROWNUM RN
		        FROM (SELECT *
		              FROM MEETING
		              WHERE ON_HIDE = 0
		                AND END_GATHER_DATE > SYSDATE-1/2
		              ORDER BY MEETING_DATE DESC) M1
		        ) M2 
		  	    FULL OUTER JOIN USERS U 
		        ON M2.USER_NO = U.USER_NO
		        FULL OUTER JOIN EXERCISE E
		        ON M2.EXERCISE_NO = E.EXERCISE_NO
		        FULL OUTER JOIN PHOTO P
		        ON M2.meeting_no = P.photo_referer_no
    		    FULL OUTER JOIN LOCATION1 L1
		        ON M2.LOCATION1_NO = L1.LOCATION1_NO
		        FULL OUTER JOIN LOCATION2 L2
		        ON M2.LOCATION2_NO = L2.LOCATION2_NO
		 WHERE RN BETWEEN 1 AND 4
		   AND P.PHOTO_REFERER_SEP = 4
		   AND P.ON_HIDE = 0

		SELECT *
		  FROM (SELECT M1.*, ROWNUM RN
		        FROM (SELECT *
		              FROM MEETING
		              WHERE USER_NO = 10
		                AND ON_HIDE = 0
		              ORDER BY MEETING_DATE DESC) M1
		        ) M2 
		  	    FULL OUTER JOIN USERS U 
		        ON M2.USER_NO = U.USER_NO
		        FULL OUTER JOIN EXERCISE E
		        ON M2.EXERCISE_NO = E.EXERCISE_NO
		        FULL OUTER JOIN PHOTO P
		        ON M2.meeting_no = P.photo_referer_no
    		    FULL OUTER JOIN LOCATION1 L1
		        ON M2.LOCATION1_NO = L1.LOCATION1_NO
		        FULL OUTER JOIN LOCATION2 L2
		        ON M2.LOCATION2_NO = L2.LOCATION2_NO
		 WHERE RN BETWEEN 1 AND 6
		   AND P.PHOTO_REFERER_SEP = 4
		   
  		SELECT *
		  FROM USERS U FULL OUTER JOIN MEETING M 
		    ON M.USER_NO = U.USER_NO
		   FULL OUTER JOIN EXERCISE E
		  	ON M.EXERCISE_NO = E.EXERCISE_NO
		   FULL OUTER JOIN PHOTO P
		    ON M.meeting_no = P.photo_referer_no
  		   FULL OUTER JOIN LOCATION1 L1
		    ON M.LOCATION1_NO = L1.LOCATION1_NO
		   FULL OUTER JOIN LOCATION2 L2
		    ON M.LOCATION2_NO = L2.LOCATION2_NO
 		 WHERE M.USER_NO = 10
		   AND M.MEETING_NO != 2 
		   AND M.ON_HIDE = 0
		   AND P.PHOTO_REFERER_SEP = 4
		   AND M.END_GATHER_DATE > SYSDATE
		 ORDER BY END_GATHER_DATE
		   
		   
   		SELECT *
		  FROM USERS U FULL OUTER JOIN MEETING M 
		    ON M.USER_NO = U.USER_NO
		  FULL OUTER JOIN EXERCISE E
		    ON M.EXERCISE_NO = E.EXERCISE_NO
    	  FULL OUTER JOIN PHOTO P
		    ON M.meeting_no = P.photo_referer_no
		  FULL OUTER JOIN LOCATION1 L1
		    ON M.LOCATION1_NO = L1.LOCATION1_NO
		  FULL OUTER JOIN LOCATION2 L2
		    ON M.LOCATION2_NO = L2.LOCATION2_NO
		 WHERE M.USER_NO != 10
		   AND M.EXERCISE_NO = 2
		   AND M.ON_HIDE = 0
   		   AND P.PHOTO_REFERER_SEP = 4
   		   AND M.END_GATHER_DATE > SYSDATE
		   
		SELECT *
		  FROM MEETING M FULL OUTER JOIN LOCATION1 L1
		    ON M.LOCATION1_NO = L1.LOCATION1_NO
		       FULL OUTER JOIN LOCATION2 L2
		       ON M.LOCATION2_NO = L2.LOCATION2_NO
		         FULL OUTER JOIN PHOTO P
		         ON M.meeting_no = P.photo_referer_no
		 WHERE M.MEETING_NO = 2
		   AND P.PHOTO_REFERER_SEP = 4


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
 

INSERT INTO USERS VALUES (users_seq.nextval, 'trainer1@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '쫑코치', '안녕하세요. 쫑코치입니다.', 'trainer1.png', 1992, 01, 25, 0, 0);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer2@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '뽀쌤', '안녕하세요. 뽀쌤입니다.', 'trainer2.png', 1993, 02, 12, 0, 4);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer3@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  'Eddy코치', '안녕하세요. Eddy입니다.', 'trainer3.jpg', 1994, 06, 23, 0, 7);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer4@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  'NIna', '안녕하세요. Nina입니다.', 'trainer4.png', 1992, 12, 26, 0, 12);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer5@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '천형', '안녕하세요. 천형입니다.', 'trainer5.png', 1995, 01, 20, 0, 14);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer6@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '다이너마이트', '안녕하세요. 다이너입니다.', 'trainer6.png', 1993, 07, 09, 0, 17);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer7@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '핵쌤', '안녕하세요. 핵쌤입니다.', 'trainer7.png', 1990, 08, 29, 1, 25);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer8@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '소연쌤', '안녕하세요. 소연쌤입니다.', 'trainer8.png', 1994, 07, 07, 1, 32);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer9@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '마이쌤', '안녕하세요. 마이쌤입니다.', 'trainer9.png', 1992, 08, 29, 2, 35);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer10@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '범키쌤', '안녕하세요. 범키쌤입니다.', 'trainer10.png', 1989, 12, 29, 2, 38);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer11@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '긴코치', '안녕하세요. 긴코치입니다.', 'trainer11.png', 1988, 03, 21, 2, 44);
INSERT INTO USERS VALUES (users_seq.nextval, 'trainer12@letspots.com', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, '일반회원가입',  '수연쌤', '안녕하세요. 수연쌤입니다.', 'trainer12.png', 1993, 05, 02, 2, 50);

INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 1,  4, '김종석', 'ultimate beastmaster', '강남센터', '안녕하세요 버핏프렌즈 여러분:) 쫑코치입니다! 저는 예전엔 120kg이 나가는 운동의 운자도 모르던 친구였었습니다..! 지금의 모습이 되기까지 미친듯한 다이어트가 도움됐다기보단 운동을 즐기고 꾸준한 생활습관에서의 노력이 제모습들을 만들었다고 생각이 듭니다:) 여러분 또한 버핏서울과 함께하며 운동이란 게 힘들고 어려운 게 아니라 충분히 즐겁고 내 삶의 일부가 될 수가 있다는 것을 느껴보셨으면 좋겠습니다. 우리가 함께 땀 흘리고 즐기다 보면 어느새 내가 꿈꾸던 모습들에 한 발자국 더 다가갈 수 있지 않을까 라는 생각이 듭니다! 저 또한 옆에서 여러분들이 다치지 않고 재밌게 즐기실 수 있도록 최선을 다해 도와드리도록 하겠습니다! LetsPorts 화이팅.!!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 2,  3, '김보현', 'Group training', '관악센터', '안녕하세요 LetsPorts 여러분! LetsPorts 뽀쌤입니다 +_+♥️ 이 글을 읽고 계시는분들은 [버핏서울]이 궁금하고 버핏서울의 트레이너]가 궁금해서, 혹은 앞으로 같이 함께하게 될 트레이너가 궁금해서 이 글을 읽고 계실거에요:) 짧은 글로 저를 표현할 수는 없지만....♥️ 저와 함께하는 운동시간이 우리 버핏프렌즈에게 즐거운 시간이 될 수 있도록! 건강하고 행복한 에너지를 받아가는 시간이 될 수 있도록! 노력하겠습니다! 같이 운동을 하다보면 어느샌가 운동을 즐기고 있는 나를, 점점 더 나아지고 있는 나를 발견할 수있도록 최대한 서포트 하겠습니다. 함께해요 그대여♥️', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 3,  5, '박찬소', 'Equinox Personal Trainer', '금천센터', 'WHAT’S UP!!! LetsPorts 에디코치(박찬소)입니다. 트레이너, 선생님이란 말을 들을 때마다 그것에 맞게 행동하고 경험과 지식을 쌓기 위한 노력으로 지금의 버핏서울 트레이너 자리에 서게 되었습니다. 다년간 체육인, 트레이너로 활동하면서 건강하고 아름다운 바디는 건강한 습관에서 만들어진다는 걸 깨달았습니다. 여러분이 건강한 습관을 가질 수 있도록 좋은 파트너가 되어드리겠습니다. 항상 긍정적인 생각 잊지 마세요! LetsPorts 파이팅! PEACE!!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 4,  4, '김나현', 'Group Training', '신촌센터', '안녕하세요. LetsPorts 여러분! 트레이너 김나현입니다. 언제나 LetsPorts 여러분과 마주하는 시간은 설렘의 연속인 듯합니다. LetsPorts와 함께 반복적인 일상에서 잠깐이나마 벗어나고, 그 속에서 일상의 건강한 습관을 만들어가는 의미 있는 시간을 여러분과 함께하게 되어 정말 감사하게 생각합니다. 언제나 여러분 옆에서 끌어주고 받쳐줄 수 있도록 에너지 넘치는 니나쌤이 될께요!! 짧지만 긴 시간 함께하며 건강도 친구도 모두 챙겨갈 수 있는 시간이 되길 바랍니다 ❤️', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 5,  7, '천현정', 'NABBA sport', '서초센터', '안녕하세요! LetsPorts 트레이너 천현정입니다. 평범한 일상에서 LetsPorts을 통해 여러분의 몸 그리고 마음까지 건강하게 변화하는 모습을 보면 정말 뿌듯합니다! 그래서인지 항상 떨리고 새로운 것 같아요. 우리 LetsPorts의 생활 속에 자연스럽게 운동이 자리 잡길 바라며 그렇게 되도록 최선을 다하겠습니다. 궁금한 점이 생기면 언제든지 물어봐 주시고요. 수업에서 만나요~ 안녕👋🏻', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 6,  5, '이병헌', 'Crossfit', '송파센터', '안녕하세요! LetsPorts 가족들의 심장과 근육을 폭발시켜줄 공덕점의 다이너마이트 병헌트레이너입니다! 평소에 혼자서는 운동하기 힘드셨던 분들! 모두 환영합니다! 다 같이 즐겁고 빡세게 운동해봐요! 따라오는 꿀바디와 자신감은 덤!! 다 같이 뽜이팅~✊️', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 7,  8, '조형동', '데상트', '계양센터', '안녕하세요 LetsPorts님들!! LetsPorts에 합류하게 된 조형동 트레이너입니다! 같이 수업을 할 수 있다는 것에 굉장히 설레네요^^ 회원님들에게 좋은 에너지를 주고 저 또 한 회원님들에게 좋은 에너지를 받을 수 있어서 너무 좋습니다!! 앞으로 같이 하게 될 LetsPorts 회원님들 다치지 않게 같이 몸짱이 되어보아요!!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 8,  5, '김소연', '모던필라테스', '중구센터', '안녕하세요 LetsPorts 여러분^^ 나는 운동이 재미없다! 힘들다! 귀찮다! 라는 분들!!! LetsPorts과 함께 하면서 재밌다! 설렌다! 뿌듯하다! 로 바뀌는 나를 볼 수 있을 거예요. 소연쌤은 여러분의 몸과 마음을 모두 건강하게 만들어주는 강사가 되기 위해 노력하며 늘 가까이에 있겠습니다^^', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 9,  7, '문기정', '교정운동전문가', '일산센터', '안녕하세요? 기정쌤이에요~! 나은 질의 삶을 살아가려고 하다보니 너무나도 많은 일들과 씨름해야하는 우리! 그러다보니 운동을 할 시간은 점점 멀어져가네요. 사실 나은질의 삶을 위해서는 건강관리가 매우 중요한 부분이에요! 평소 운동을 재미없게만 생각하셧던 모든 분들! LetsPorts와 함께 건강하고 멋진 몸을 만드는 과정에서 내 몸안의 미를 찾아봐요~! 만나게되어 반가워요 ^^!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 10,  9, '김기범', '모델아카데미', '광주센터', '안녕하세요!!! LetsPorts 여러분!! 트레이너 범키입니다 =) 운동하려고 마음은 먹었지만 막상 하려니 뭘 해야 할지 잘 모르고, 혼자 가서 하려니 쓸쓸하고 지루하고...! 운동에 습관 붙이기 어려워 매번 포기하신 분들! 가장 나쁜 운동은 아무것도 하지 않는 것이고, 가장 미련한 운동은 잘못된 자세로 하는 것입니다! LetsPorts와 함께하는 시간 동안 많은 걸 배워가실 수 있도록 최선을 다해서 지도하고, 운동은 재미있고 즐겁게 해야 한다는 저의 생각을 여러분들과 공유하겠습니다! =)  만족은 결과가 아닌 과정에서 오는 것이며, 과정에 만족한다면 결과도 좋을 테니까요! IT DOESN’T GET EASIER, 운동이 쉬워지지는 않을 겁니다, YOU JUST GET BETTER! 다만, 여러분이 더 성장할 뿐입니다! 새로운 인연이 기다리고 있는 LetsPorts! 모두 LetsPorts에서 만나요!!🤗', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 11,  11, '서다원', '생활체육지도자', '부천센터', '안녕하세요 ! LetsPorts 여러분! 스탠다드9기부터 함께하게 된 다원쌤입니다! "과거의 후회와 미래의 희망 속엔 현재라는 기회가 있다" 정말 제가 좋아하는 문구인데요~ 여러분의 현재라는 기회에 많은 도움을 드릴 수 있도록 노력하겠습니다!! 제 이름처럼 모두 다~원하는 몸이 되는 그날까지 즐겁게 운동해요!!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 12,  6, '유수연', '생활스포츠지도사 2급', '안양센터', '안녕하세요 LetsPorts 여러분!!?? 저는 LetsPorts 트레이너 유수연 입니다. 운동을 통해 몸과 마음이 건강해지고 변화된 생활을 보여준 사람들을 보는 것이 너무나 행복합니다. 저의 에너지를 통해 변화되는 하루를 기대해주세요💪 여름이건 겨울이건 날씨가 덥던 춥던 우리는 오래오래만나길 바라며(?) 곧 수업에서 만나요🙌', SYSDATE);

