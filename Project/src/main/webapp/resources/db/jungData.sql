insert into COMMENTS values (COMMENTS_SEQ.NEXTVAL, 2, 28, 10, '안녕하세염', SYSDATE, 0);


select * from COMMENTS;
select * from MEETING;

delete from comments where user_no = 10;
INSERT INTO MEETING values (1, 12, 10, 6, 0, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '족구합시다.', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (2, 12, 10, 6, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (3, 12, 10, 6, 2, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '농구합시다.', '농구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (4, 12, 10, 6, 3, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '볼링합시다.', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (5, 12, 10, 6, 4, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '크로스핏합시다.', '크로스핏하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);

SELECT * FROM MEETING;
	
SELECT * FROM EXERCISE;

-- user 임시용 3개 (트레이너)
INSERT INTO USERS values (10, 'user10@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '머슬맨', '잘부탁드려요', 'profile10', 1992, 01, 01, 0, 0);
INSERT INTO USERS values (11, 'user11@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '근육걸', '잘부탁드려요', 'profile11', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (12, 'user12@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '헬스맨', '잘부탁드려요', 'profile12', 2000, 12, 31, 2, 1);

SELECT * FROM USERS;