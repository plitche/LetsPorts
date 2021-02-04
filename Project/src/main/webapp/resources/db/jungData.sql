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
	