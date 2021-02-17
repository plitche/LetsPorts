
-- user 임시용 3개 (트레이너)
INSERT INTO USERS values (10, 'user10@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 1, 1, 0, 'naver', '머슬맨', '잘부탁드려요', 'profile10', 1992, 01, 01, 0, 0);
INSERT INTO USERS values (11, 'user11@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 2, 2, 0, 'naver', '근육걸', '잘부탁드려요', 'profile11', 2000, 12, 31, 1, 1);
INSERT INTO USERS values (12, 'user12@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '헬스맨', '잘부탁드려요', 'profile12', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (13, 'user13@xxx.xxx', '1111', 2, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '술맨', '잘부탁드려요', 'profile12', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (14, 'user14@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '천형', '잘부탁드려요', 'trainer5', 2000, 12, 31, 2, 1);
INSERT INTO USERS values (15, 'user15@xxx.xxx', '1111', 1, SYSDATE, SYSDATE, 3, 3, 0, 'naver', '다이너마이트', '잘부탁드려요', 'trainer6', 2000, 12, 31, 2, 1);


-- *** 모임 생성 *** 
INSERT INTO MEETING values (meeting_seq.nextval, 1, 21, 2, 0, SYSDATE, 2021-02-11 00:00:00.0, 2021-02-14 00:00:00.0, 2021-02-16 00:00:00.0, 0, 23, '동네 족구하실분~', '족구 한번 합시다!', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 2, 18, 3, 1, SYSDATE, 2021-02-10 00:00:00.0, 2021-02-13 00:00:00.0, 2021-02-14 00:00:00.0, 0, 22, '6 대 6 풋살 배틀신청합니다.', '축구선수 6명으로 구성되어있습니다. 자신있으면 신청하세요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 3, 12, 5, 2, SYSDATE, 2021-02-12 00:00:00.0, 2021-02-18 00:00:00.0, 2021-02-30 00:00:00.0, 0, 24, '농구초보자, 한 수 배우겠습니다.', '재밌게 농구하실 분 구합니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 4, 14, 7, 3, SYSDATE, 2021-02-03 00:00:00.0, 2021-02-18 00:00:00.0, 2021-02-29 00:00:00.0, 0, 21, '볼링 같이 하실 1분 구해요.', '볼링 초보자입니다. 함께해요!.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 5, 16, 1, 4, SYSDATE, 2021-02-01 00:00:00.0, 2021-03-01 00:00:00.0, 2021-03-02 00:00:00.0, 0, 20, '크로스핏 같이 시작하실 분.', '같이 만나서 크로스핏 시작하실 도전매니아 구합니다..', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 6, 11, 1, 5, SYSDATE, 2021-02-05 00:00:00.0, 2021-02-18 00:00:00.0, 2021-02-25 00:00:00.0, 0, 19, '스피닝 조집시다.', '다 필요없고 스피닝할 사람 드루와.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 7, 14, 2, 6, SYSDATE, 2021-02-01 00:00:00.0, 2021-02-19 00:00:00.0, 2021-02-27 00:00:00.0, 0, 18, '팝핀 댄스 같이 시작하실분~', '우연히 시작한 댄스가 제 인생을 바꿔놨던 것처럼 우연한 만남으로 삶의 전환점이 되고 싶은 이쁜이입니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 1, 11, 4, 7, SYSDATE, 2021-01-12 00:00:00.0, 2021-02-29 00:00:00.0, 2021-03-04 00:00:00.0, 0, 23, '요가의 신', '요가의 신이 되고 싶으신 분들은 저와 함께해요~.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 2, 15, 5, 8, SYSDATE, 2021-02-15 00:00:00.0, 2021-02-19 00:00:00.0, 2021-02-25 00:00:00.0, 0, 22, '명상하면서 서로의 삶을 공유해요.', '명상과 함께 서로의 안식처가 되어줘요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 3, 6, 2, 1, SYSDATE, 2021-02-03 00:00:00.0, 2021-02-20 00:00:00.0, 2021-02-24 00:00:00.0, 0, 21, '월드컵경기장에서 축구할 사람?', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 4, 9, 7, 2, SYSDATE, 2021-02-02 00:00:00.0, 2021-02-25 00:00:00.0, 2021-02-29 00:00:00.0, 0, 20, '서울대 vs 고려대 농구배틀할 인원 구한다.', '결판을 내자. 잘한다고 생각하는 놈만 신청해라.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 5, 14, 2, 3, SYSDATE, 2021-02-15 00:00:00.0, 2021-02-23 00:00:00.0, 2021-02-25 00:00:00.0, 0, 19, '볼링으로 스트레스 날려버릴 사람~', '볼링으로 스트레스 날리자', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 6, 16, 6, 4, SYSDATE, 2021-02-16 00:00:00.0, 2021-02-22 00:00:00.0, 2021-03-05 00:00:00.0, 0, 18, '혼자시작하기 두려운 크로스핏도전자 구함.', '혼자 시작하기 무서워.. 같이 시작해..난 겁쟁이야..', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 7, 18, 7, 5, SYSDATE, 2021-02-13 00:00:00.0, 2021-02-29 00:00:00.0, 2021-03-22 00:00:00.0, 0, 17, '열정적인 스피닝인들이여', '열정적인 사람만 같이할 맛나니까 열정적인 사람만 들어와.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 17, 5, 2, 6, SYSDATE, 2021-02-12 00:00:00.0, 2021-03-18 00:00:00.0, 2021-03-21 00:00:00.0, 0, 16, '유행하는 틱톡 춤 강의합니다', '애브리바디 틱톡커~!~!여러분들도 틱톡커가 될 수 있습니다!.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 26, 5, 1, 7, SYSDATE, 2021-02-11 00:00:00.0, 2021-02-23 00:00:00.0, 2021-02-24 00:00:00.0, 0, 15, '황아영의 요가 클럽', '등이 굽으신분들, 거북목이신 분들 모두 제가 맡겨주세요! 1달이면 눈에 띄게 좋아지실 겁니다!', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 33, 8, 6, 8, SYSDATE, 2021-02-02 00:00:00.0, 2021-02-25 00:00:00.0, 2021-02-26 00:00:00.0, 0, 14, '명상의 신.', '명상방법을 모르시고 하시는 분들이 생각보다 많습니다. 저에게 배워 명상의 신이 되어보세요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 38, 9, 2, 0, SYSDATE, 2021-02-10 00:00:00.0, 2021-02-24 00:00:00.0, 2021-02-28 00:00:00.0, 0, 13, '족구 1 대 1 강습', '족구대회에서 5번 우승한 족구 챔피언입니다. 족구계의 호날두로 만들어드리겠습니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 41, 10, 3, 1, SYSDATE, 2021-02-05 00:00:00.0, 2021-02-24 00:00:00.0, 2021-02-26 00:00:00.0, 0, 12, '안녕하세요. 안정환입니다.', '축구를 관두고 새로운 시작을 letsport에서 하려고 합니다. 많은 참여바랍니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 51, 12, 2, 2, SYSDATE, 2021-02-09 00:00:00.0, 2021-02-25 00:00:00.0, 2021-02-27 00:00:00.0, 0, 11, '안녕하세요. 서장훈입니다..', '농구를 관두고 새로운 시작을 letsport에서 하려고 합니다. 많은 참여바랍니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 60, 12, 2, 3, SYSDATE, 2021-02-11 00:00:00.0, 2021-02-24 00:00:00.0, 2021-02-28 00:00:00.0, 0, 10, '볼링 강습.', '볼링 1대1 강습입니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 66, 12, 2, 4, SYSDATE, 2021-02-13 00:00:00.0, 2021-02-28 00:00:00.0, 2021-02-30 00:00:00.0, 0, 9, '고투헬스장에서 크로스핏 10명 강습합니다.', '크로스핏의 대가 나정호와 함께하세요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 74, 12, 2, 5, SYSDATE, 2021-02-10 00:00:00.0, 2021-02-23 00:00:00.0, 2021-02-25 00:00:00.0, 0, 8, '스피닝선수 권용수입니다.', '함께 스피닝을 즐겨요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 79, 12, 2, 6, SYSDATE, 2021-02-12 00:00:00.0, 2021-02-25 00:00:00.0, 2021-02-27 00:00:00.0, 0, 7, '클럽팝핀댄서 권용수입니다.', '클럽춤의 모든 것을 알려드릴게요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 89, 12, 2, 7, SYSDATE, 2021-02-03 00:00:00.0, 2021-02-24 00:00:00.0, 2021-02-28 00:00:00.0, 0, 6, '이보희의 요가클럽.', '자세교정, 허리디스크를 앓던 저는 요가를 통해 새로운 삶을 찾았습니다. 여러분도 시작해보세요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 93, 12, 2, 8, SYSDATE, 2021-02-05 00:00:00.0, 2021-02-25 00:00:00.0, 2021-02-29 00:00:00.0, 0, 5, '명상 강습', '명상하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 17, 12, 2, 0, SYSDATE, 2021-02-12 00:00:00.0, 2021-02-23 00:00:00.0, 2021-02-25 00:00:00.0, 0, 4, '족구 강습', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 26, 12, 2, 1, SYSDATE, 2021-02-11 00:00:00.0, 2021-02-22 00:00:00.0, 2021-02-24 00:00:00.0, 0, 3, '축구 강습', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 33, 12, 2, 2, SYSDATE, 2021-02-15 00:00:00.0, 2021-02-23 00:00:00.0, 2021-02-26 00:00:00.0, 0, 2, '농구 강습', '농구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 41, 12, 2, 3, SYSDATE, 2021-02-16 00:00:00.0, 2021-02-26 00:00:00.0, 2021-02-28 00:00:00.0, 0, 1, '볼링 강습', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);

-- 모임 준비물
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 1, '운동화', SYSDATE);
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 1, '헤어밴드', SYSDATE);
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 1, '든든한 겉옷', SYSDATE);
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 2, '축구공', SYSDATE);
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 2, '축구화', SYSDATE);
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 2, '이온음료', SYSDATE);
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 3, '농구공', SYSDATE);
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 3, '양말', SYSDATE);
INSERT INTO MATERIALS values (MATERIALS_SEQ.NEXTVAL, 3, '모자', SYSDATE);



-- *** 모임대표사진 생성 *** 
-- 1. 유저
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 1, 1, 'volleyball1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 2, 2, 'football1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 3, 3, 'basketball1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 4, 4, 'bowling1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 5, 5, 'crossfit1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 6, 6, 'spinning1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 7, 7, 'dance1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 8, 1, 'yoga1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 9, 2, 'meditation1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 10, 3, 'soccer2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 11, 4, 'basketball2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 12, 5, 'bowling2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 13, 6, 'crossfit2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 14, 7, 'spinning2.jpg', SYSDATE, 0);
-- 2. 트레이너
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 15, 17, 'dance2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 16, 26, 'yoga2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 17, 33, 'meditation2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 18, 38, 'volleyball1.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 19, 41, 'soccer3.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 20, 51, 'basketball4.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 21, 60, 'bowling3.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 22, 66, 'crossfit3.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 23, 74, 'spinning3.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 24, 79, 'dance3.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 25, 89, 'yoga3.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 26, 93, 'meditation3.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 27, 17, 'volleyball2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 28, 26, 'soccer7.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 29, 33, 'basketball2.jpg', SYSDATE, 0);
INSERT INTO PHOTO values (PHOTO_SEQ.NEXTVAL, 4, 30, 38, 'bowling4.jpg', SYSDATE, 0);

-- 모임 스크랩
INSERT INTO scrap VALUES (scrap_seq.nextval, 2, 2, 1, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 3, 2, 2, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 3, 2, 1, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 3, 2, 4, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 3, 2, 5, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 7, 2, 6, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 8, 2, 7, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 9, 2, 1, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 9, 2, 2, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 9, 2, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 9, 2, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 13, 2, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 14, 2, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 15, 2, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 16, 2, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 16, 2, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 16, 2, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 16, 2, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 21, 2, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 22, 2, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 23, 2, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 23, 2, 79, null, sysdate);



-- 트레이너 상세정보 3개
INSERT INTO TRAINER_INFO values (1, 10, 3, '김종석', '트레이너자격증', '신촌센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (2, 11, 4, '김보현', '트레이너자격증', '홍대센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (3, 12, 5, '박찬소', '트레이너자격증', '합정센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (4, 13, 6, '김나현', '트레이너자격증', '강남센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (5, 14, 7, '천현정', '트레이너자격증', '고양센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO TRAINER_INFO values (6, 15, 8, '이병헌', '트레이너자격증', '영등포센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);

select * from SCRAP;
select * from TRAINER_INFO;
select * from temp_board;
select * from photo;
select * from MEETING;
select * from users;
delete from scrap;
delete from users;
insert into scrap values (1, )
DELETE FROM MEETING WHERE MEETING_NO BETWEEN 1 AND 15;
insert into scrap values(1, 1, 1, 4, null, SYSDATE);
insert into scrap values(2, 2, 1, 3, null, SYSDATE);
		   
				DELETE FROM MEETING	;		     
							     
SELECT *
		FROM MEETING M
		   JOIN LOCATION1 L1
		    	 ON M.LOCATION1_NO = L1.LOCATION1_NO
			JOIN LOCATION2 L2
				 ON M.LOCATION2_NO = L2.LOCATION2_NO
			JOIN EXERCISE E
			 	 ON M.EXERCISE_NO = E.EXERCISE_NO
			JOIN USERS U
				 ON M.USER_NO = U.USER_NO
			JOIN PHOTO P
				 ON M.MEETING_NO = P.PHOTO_REFERER_NO
		WHERE M.MEETING_NO = 10
	    AND P.PHOTO_REFERER_SEP = 4
	    
	    
	    SELECT * 
		FROM (SELECT ROWNUM RN, B1.*
			FROM (SELECT * FROM
						MEETING M1
					FULL OUTER JOIN EXERCISE E1
						ON E1.EXERCISE_NO = M1.EXERCISE_NO
					FULL OUTER JOIN USERS U
						ON M1.USER_NO = U.USER_NO
					FULL OUTER JOIN LOCATION1 L1
						ON M1.LOCATION1_NO = L1.LOCATION1_NO
					FULL OUTER JOIN LOCATION2 L2
						ON M1.LOCATION2_NO = L2.LOCATION2_NO
					FULL OUTER JOIN PHOTO P
						ON M1.MEETING_NO = P.PHOTO_REFERER_NO
						WHERE MEETING_NO IS NOT NULL) B1 ) B2
		WHERE B2.RN BETWEEN 1 AND 100
		AND PHOTO_REFERER_SEP = 4;
		
		
		
		
		SELECT *
        FROM (SELECT M1.*, ROWNUM RN
              FROM (SELECT *
                    FROM MEETING
                      WHERE ON_HIDE = 0
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
       WHERE RN BETWEEN 1 AND 100
         AND P.PHOTO_REFERER_SEP = 4
         
         SELECT *
		FROM SCRAP S1
			FULL OUTER JOIN USERS U 
				ON S1.USER_NO = U.USER_NO
			FULL OUTER JOIN MEETING M
				ON S1.SCRAP_REFERER_NO = M.MEETING_NO
			FULL OUTER JOIN PHOTO P
				ON M.MEETING_NO = P.PHOTO_REFERER_NO
			FULL OUTER JOIN LOCATION1 L1
				ON M.LOCATION1_NO = L1.LOCATION1_NO
			FULL OUTER JOIN LOCATION2 L2
				ON M.LOCATION2_NO = L2.LOCATION2_NO
			FULL OUTER JOIN EXERCISE E
				ON M.EXERCISE_NO = E.EXERCISE_NO
		WHERE S1.USER_NO = 11
		AND S1.SCRAP_SEPARATOR = 2
         
         
         
         
         
         
         
         
         
         

