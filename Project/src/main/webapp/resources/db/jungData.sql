
-- user 임시용 3개 (트레이너)
INSERT INTO USERS values (10, 'user10@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '머슬맨', '잘부탁드려요', 'profile10', 1992, 01, 01, 0, 0);
INSERT INTO USERS values (11, 'user11@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '근육걸', '잘부탁드려요', 'profile11', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (12, 'user12@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '헬스맨', '잘부탁드려요', 'profile12', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (13, 'user13@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '술맨', '잘부탁드려요', 'profile12', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (14, 'user14@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '천형', '잘부탁드려요', 'trainer5', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (15, 'user15@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '다이너마이트', '잘부탁드려요', 'trainer6', 2000, 12, 31, 2, 1);

-- 클래스 생성 
INSERT INTO MEETING values (1, 11, 10, 6, 0, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '족구합시다.', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (2, 12, 8, 4, 3, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '볼링합시다.', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (3, 13, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (5, 12, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (6, 12, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (7, 12, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (8, 13, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (9, 13, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (10, 13, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (11, 13, 12, 10, 2, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (12, 12, 12, 10, 2, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (13, 12, 12, 10, 3, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (14, 13, 12, 10, 2, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (15, 12, 12, 10, 2, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (16, 13, 12, 10, 4, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (17, 12, 12, 10, 5, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 1, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);

-- 트레이너 상세정보 3개
INSERT INTO TRAINER_INFO values (1, 10, 3, '김종석', '트레이너자격증', '신촌센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (2, 11, 4, '김보현', '트레이너자격증', '홍대센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (3, 12, 5, '박찬소', '트레이너자격증', '합정센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (4, 13, 6, '김나현', '트레이너자격증', '강남센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (5, 14, 7, '천현정', '트레이너자격증', '고양센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (6, 15, 8, '이병헌', '트레이너자격증', '영등포센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);


select * from users;
delete from scrap;
delete from users;
insert into scrap values (1, )

insert into scrap values(1, 1, 1, 4, null, SYSDATE);
insert into scrap values(2, 2, 1, 3, null, SYSDATE);
		   
							     
							     


