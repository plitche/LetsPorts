-- review 테이블 score 디폴트값 설정
ALTER TABLE REVIEW MODIFY SCORE NUMBER DEFAULT 0

-- user 임시용 3개 (트레이너)
INSERT INTO USERS values (10, 'user10@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '쫑코치', '잘부탁드려요', 'trainer1', 1992, 01, 01, 0, 0);
INSERT INTO USERS values (11, 'user11@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '뽀쌤', '잘부탁드려요', 'trainer2', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (12, 'user12@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', 'Eddy코치', '잘부탁드려요', 'trainer3', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (13, 'user13@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', 'Nina', '잘부탁드려요', 'trainer4', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (14, 'user14@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '천형', '잘부탁드려요', 'trainer5', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (15, 'user15@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '다이너마이트', '잘부탁드려요', 'trainer6', 2000, 12, 31, 2, 1);

INSERT INTO USERS values (32, 'user32@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '일반인3', '잘부탁드려요', 'profile32', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (33, 'user33@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '일반인4', '잘부탁드려요', 'profile33', 2000, 12, 31, 2, 1);

-- 트레이너 상세정보 3개
INSERT INTO TRAINER_INFO values (1, 10, 3, '김종석', '트레이너자격증', '신촌센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (2, 11, 4, '김보현', '트레이너자격증', '홍대센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (3, 12, 5, '박찬소', '트레이너자격증', '합정센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (4, 13, 6, '김나현', '트레이너자격증', '강남센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (5, 14, 7, '천현정', '트레이너자격증', '고양센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (6, 15, 8, '이병헌', '트레이너자격증', '영등포센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);

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
select * from BOARD_QNA
select * from Meeting_participants

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
 
		 
		 

		 