
-- user 임시용 3개 (트레이너)
INSERT INTO USERS values (10, 'user10@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '머슬맨', '잘부탁드려요', 'profile10', 1992, 01, 01, 0, 0);
INSERT INTO USERS values (11, 'user11@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '근육걸', '잘부탁드려요', 'profile11', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (12, 'user12@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '헬스맨', '잘부탁드려요', 'profile12', 2000, 12, 31, 2, 1);

INSERT INTO USERS VALUES (1, 'user1@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '나정호', '나랑 운동하자', 'profile1', 1994, 08, 22, 0, 0);
INSERT INTO USERS VALUES (2, 'user2@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '권용수', '나랑 운동하자', 'profile1', 1992, 08, 22, 0, 0);
INSERT INTO USERS VALUES (3, 'user3@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'kakao', '상혜준', '나랑 운동하자', 'profile1', 1993, 08, 22, 0, 0);
INSERT INTO USERS VALUES (4, 'user4@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 4, 4, 0, 'google', '임예원', '나랑 운동하자', 'profile1', 1998, 08, 22, 0, 0);
INSERT INTO USERS VALUES (5, 'user5@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 5, 5, 0, 'kakao', '김영욱', '나랑 운동하자', 'profile1', 1993, 08, 22, 0, 0);


select * from COMMENTS;
select * from MEETING;

INSERT INTO MEETING values (1, 12, 10, 6, 0, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '족구합시다.', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (2, 12, 10, 6, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (3, 12, 10, 6, 2, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '농구합시다.', '농구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (4, 12, 10, 6, 3, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '볼링합시다.', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (5, 12, 10, 6, 4, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '크로스핏합시다.', '크로스핏하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);

SELECT * FROM MEETING;
	
SELECT * FROM EXERCISE;


SELECT * FROM USERS;
SELECT * FROM PHOTO;