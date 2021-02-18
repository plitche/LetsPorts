DROP TABLE temp_board;
DROP TABLE is_reviewed;
DROP TABLE materials;
DROP TABLE user_interest;
DROP TABLE alarm;
DROP TABLE photo;
DROP TABLE review;
DROP TABLE board_qna;
DROP TABLE board_knowhow_tag;
DROP TABLE comments;
DROP TABLE trainer_qna;
DROP TABLE trainer_info;
DROP TABLE scrap;
DROP TABLE tags;
DROP TABLE board_knowhow;
DROP TABLE meeting_participants;
DROP TABLE meeting;
DROP TABLE exercise;
DROP TABLE users;
DROP TABLE location2;
DROP TABLE location1;

DROP SEQUENCE users_seq;
DROP SEQUENCE meeting_seq;
DROP SEQUENCE meeting_participants_seq;
DROP SEQUENCE board_knowhow_seq;
DROP SEQUENCE scrap_seq;
DROP SEQUENCE trainer_qna_seq;
DROP SEQUENCE comments_seq;
DROP SEQUENCE board_knowhow_tag_seq;
DROP SEQUENCE board_qna_seq;
DROP SEQUENCE review_seq;
DROP SEQUENCE trainer_info_seq;
DROP SEQUENCE photo_seq;
DROP SEQUENCE alarm_seq;
DROP SEQUENCE user_interest_seq;
DROP SEQUENCE materials_seq;
DROP SEQUENCE is_reviewed_seq;
DROP SEQUENCE temp_board_seq;

-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
-- SEQUENCE들
CREATE SEQUENCE users_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE meeting_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE meeting_participants_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE board_knowhow_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE scrap_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE trainer_qna_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE comments_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE board_knowhow_tag_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE board_qna_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE review_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE trainer_info_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE photo_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE alarm_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE user_interest_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE materials_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE is_reviewed_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE temp_board_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

-- location1 Table Create SQL
CREATE TABLE location1 (
    location1_no      NUMBER          PRIMARY KEY, 
    location1_name    VARCHAR2(30)    NOT NULL
);

-- location2 Table Create SQL
CREATE TABLE location2 (
    location2_no      NUMBER          PRIMARY KEY, 
    location2_name    VARCHAR2(30)    NOT NULL
);

-- users Table Create SQL
CREATE TABLE users (
    user_no            NUMBER           PRIMARY KEY, 
    email              VARCHAR2(50)     UNIQUE NOT NULL, 
    password           VARCHAR2(50)     NOT NULL, 
    user_separator     NUMBER           NOT NULL, 
    created_at         DATE             NOT NULL, 
    last_login         DATE             NULL, 
    login_count        NUMBER           NOT NULL, 
    login_attempt      NUMBER           NOT NULL, 
    disable            NUMBER           NOT NULL, 
    user_reg_method    VARCHAR2(30)     NOT NULL, 
    user_nickname      VARCHAR2(30)     UNIQUE NOT NULL, 
    user_message       VARCHAR2(40)     NULL, 
    profile_photo      VARCHAR2(100)    NULL, 
    birth_year         NUMBER           NULL, 
    birth_month        NUMBER           NULL, 
    birth_day          NUMBER           NULL, 
    location1_no       NUMBER           REFERENCES location1(location1_no) NOT NULL, 
    location2_no       NUMBER           REFERENCES location2(location2_no) NOT NULL
);

-- exercise Table Create SQL
CREATE TABLE exercise (
    exercise_no      NUMBER          PRIMARY KEY, 
    exercise_name    VARCHAR2(30)    UNIQUE NOT NULL
);

-- meeting Table Create SQL
CREATE TABLE meeting (
    meeting_no           NUMBER            PRIMARY KEY, 
    user_no              NUMBER            REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    meeting_max          NUMBER            NOT NULL, 
    meeting_min          NUMBER            NOT NULL, 
    exercise_no          NUMBER            REFERENCES exercise(exercise_no) NOT NULL, 
    created_at           DATE              NOT NULL, 
    start_gather_date    DATE              NOT NULL, 
    end_gather_date      DATE              NOT NULL, 
    meeting_date         DATE              NOT NULL, 
    location1_no         NUMBER            REFERENCES location1(location1_no) NOT NULL, 
    location2_no         NUMBER            REFERENCES location2(location2_no) NOT NULL, 
    meeting_title        VARCHAR2(100)     NOT NULL, 
    meeting_content      VARCHAR2(4000)    NOT NULL, 
    is_progress          NUMBER            NOT NULL, 
    cancel_reason        VARCHAR2(100)     NULL, 
    on_hide              NUMBER            NOT NULL, 
    detail_location      VARCHAR2(100)     NULL, 
    meeting_hit          NUMBER            NOT NULL
);

-- meeting_participants Table Create SQL
CREATE TABLE meeting_participants (
    participants_no    NUMBER           PRIMARY KEY, 
    meeting_no         NUMBER           REFERENCES meeting(meeting_no) ON DELETE CASCADE NOT NULL, 
    user_no            NUMBER           REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    created_at         DATE             NOT NULL, 
    status             NUMBER           NOT NULL, 
    reject_reason      VARCHAR2(100)    NULL
);

-- board_knowhow Table Create SQL
CREATE TABLE board_knowhow (
    knowhow_no         NUMBER            PRIMARY KEY, 
    knowhow_title      VARCHAR2(100)     NOT NULL, 
    knowhow_content    VARCHAR2(4000)    NOT NULL, 
    created_at         DATE              NOT NULL, 
    user_no            NUMBER            REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    user_separator     NUMBER            NOT NULL, 
    on_hide            NUMBER            NOT NULL, 
    knowhow_hit        NUMBER            NOT NULL
);

-- tags Table Create SQL
CREATE TABLE tags (
    tag_no      NUMBER          PRIMARY KEY, 
    tag_name    VARCHAR2(30)    UNIQUE NOT NULL
);

-- scrap Table Create SQL
CREATE TABLE scrap (
    scrap_no            NUMBER  PRIMARY KEY, 
    user_no             NUMBER  REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    scrap_separator     NUMBER  NOT NULL, 
    scrap_referer_no    NUMBER  NOT NULL, 
    end_gather_date     DATE    NULL, 
    created_at          DATE    NOT NULL
);

-- trainer_info Table Create SQL
CREATE TABLE trainer_info (
    trainer_no              NUMBER            PRIMARY KEY, 
    user_no                 NUMBER            REFERENCES users(user_no) ON DELETE CASCADE UNIQUE NOT NULL, 
    career                  NUMBER            NOT NULL, 
    trainer_name            VARCHAR2(30)      NOT NULL, 
    certificate_filename    VARCHAR2(50)      NOT NULL, 
    employment              VARCHAR2(100)     NOT NULL, 
    profile                 VARCHAR2(2000)    NOT NULL, 
    created_at              DATE              NOT NULL
);

-- trainer_qna Table Create SQL
CREATE TABLE trainer_qna (
    trainer_qna_no          NUMBER            PRIMARY KEY, 
    question_user_no        NUMBER            REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    trainer_user_no         NUMBER            REFERENCES trainer_info(user_no) ON DELETE CASCADE NOT NULL, 
    trainer_qna_title       VARCHAR2(100)     NOT NULL, 
    trainer_qna_content     VARCHAR2(2000)    NOT NULL, 
    created_at              DATE              NOT NULL, 
    is_published            NUMBER            NOT NULL, 
    is_answered             NUMBER            NOT NULL, 
    trainer_qna_answered    varchar2(2000)    NULL, 
    answered_date           DATE              NULL, 
    on_hide                 NUMBER            NOT NULL
);

-- comment Table Create SQL
CREATE TABLE comments (
    comment_no             NUMBER            PRIMARY KEY, 
    comment_referer_sep    NUMBER            NOT NULL, 
    comment_referer_no     NUMBER            NOT NULL,
    board_user_no		   NUMBER			 REFERENCES users(user_no) ON DELETE CASCADE NOT NULL,
    user_no                NUMBER            REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    comment_content        varchar2(1000)    NOT NULL, 
    created_at             DATE              NOT NULL, 
    on_hide                NUMBER            NOT NULL
);

-- board_knowhow_tag Table Create SQL
CREATE TABLE board_knowhow_tag (
    knowhow_tag_no    NUMBER    PRIMARY KEY, 
    knowhow_no        NUMBER    REFERENCES board_knowhow(knowhow_no) ON DELETE CASCADE NOT NULL, 
    tag_no            NUMBER    REFERENCES tags(tag_no) NOT NULL
);

-- board_qna Table Create SQL
CREATE TABLE board_qna (
    board_qna_no         NUMBER            PRIMARY KEY, 
    board_qna_title      VARCHAR2(100)     NOT NULL, 
    board_qna_content    VARCHAR2(4000)    NOT NULL, 
    user_no              NUMBER            REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    created_at           DATE              NOT NULL, 
    is_resolved          NUMBER            NOT NULL, 
    resolved_date        DATE              NULL, 
    on_hide              NUMBER            NOT NULL
);

-- review Table Create SQL
CREATE TABLE review (
    review_no         NUMBER            PRIMARY KEY, 
    target_user_no    NUMBER            REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    score             NUMBER            NOT NULL, 
    meeting_no        NUMBER            REFERENCES meeting(meeting_no) ON DELETE CASCADE NOT NULL, 
    content           VARCHAR2(1000)    NOT NULL, 
    created_at        DATE              NOT NULL, 
    on_hide           NUMBER            NOT NULL, 
    writer_user_no    NUMBER            REFERENCES users(user_no) ON DELETE CASCADE NOT NULL
);

-- photo Table Create SQL
CREATE TABLE photo (
    photo_no             NUMBER           PRIMARY KEY, 
    photo_referer_sep    NUMBER           NOT NULL, 
    photo_referer_no     NUMBER           NOT NULL, 
    user_no				 NUMBER			  REFERENCES users(user_no) ON DELETE CASCADE NOT NULL,
    photo_filename       VARCHAR2(100)    NOT NULL, 
    created_at           DATE             NOT NULL, 
    on_hide              NUMBER           NOT NULL
);

-- alarm Table Create SQL
CREATE TABLE alarm (
    alarm_no            NUMBER           PRIMARY KEY, 
    alarm_separator     NUMBER           NOT NULL, 
    alarm_referer_no    NUMBER           NOT NULL, 
    alarm_content       VARCHAR2(500)    NOT NULL, 
    status              NUMBER           NOT NULL, 
    created_at          DATE             NOT NULL,
    user_no				NUMBER			 REFERENCES users(user_no) ON DELETE CASCADE NOT NULL
);

-- user_interest Table Create SQL
CREATE TABLE user_interest (
    user_interest_no    NUMBER    PRIMARY KEY, 
    user_no             NUMBER    REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    exercise_no         NUMBER    REFERENCES exercise(exercise_no) NOT NULL
);

-- materials Table Create SQL
CREATE TABLE materials (
    materials_no      NUMBER          PRIMARY KEY, 
    meeting_no        NUMBER          REFERENCES meeting(meeting_no) ON DELETE CASCADE NOT NULL, 
    materials_name    VARCHAR2(30)    NOT NULL, 
    created_at        DATE            NOT NULL
);

-- is_reviewed Table Create SQL
CREATE TABLE is_reviewed (
    is_reviewed_no    NUMBER    PRIMARY KEY, 
    meeting_no        NUMBER    REFERENCES meeting(meeting_no) ON DELETE CASCADE NOT NULL, 
    target_user_no    NUMBER    REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    writer_user_no    NUMBER    REFERENCES users(user_no) ON DELETE CASCADE NOT NULL, 
    status            NUMBER    NOT NULL
);

-- 임시 게시글 번호 테이블
CREATE TABLE temp_board (
	temp_no		NUMBER		PRIMARY KEY,
	user_no		NUMBER		REFERENCES users(user_no) ON DELETE CASCADE NOT NULL,
	created_at	DATE		NOT NULL
);

INSERT ALL
-- 태그인덱스
INTO tags (tag_no, tag_name) VALUES (0, '족구')
INTO tags (tag_no, tag_name) VALUES (1, '축구')
INTO tags (tag_no, tag_name) VALUES (2, '농구')
INTO tags (tag_no, tag_name) VALUES (3, '볼링')
INTO tags (tag_no, tag_name) VALUES (4, '크로스핏')
INTO tags (tag_no, tag_name) VALUES (5, '스피닝')
INTO tags (tag_no, tag_name) VALUES (6, '댄스')
INTO tags (tag_no, tag_name) VALUES (7, '요가')
INTO tags (tag_no, tag_name) VALUES (8, '명상')
INTO tags (tag_no, tag_name) VALUES (9, '다이어트정보')
INTO tags (tag_no, tag_name) VALUES (10, '건강정보')
INTO tags (tag_no, tag_name) VALUES (11, '식단정보')
-- 운동인덱스
INTO exercise (exercise_no, exercise_name) VALUES (0, '족구')
INTO exercise (exercise_no, exercise_name) VALUES (1, '축구')
INTO exercise (exercise_no, exercise_name) VALUES (2, '농구')
INTO exercise (exercise_no, exercise_name) VALUES (3, '볼링')
INTO exercise (exercise_no, exercise_name) VALUES (4, '크로스핏')
INTO exercise (exercise_no, exercise_name) VALUES (5, '스피닝')
INTO exercise (exercise_no, exercise_name) VALUES (6, '댄스')
INTO exercise (exercise_no, exercise_name) VALUES (7, '요가')
INTO exercise (exercise_no, exercise_name) VALUES (8, '명상')
-- 지역(시,도) 인덱스
INTO location1 (location1_no, location1_name) VALUES (0, '서울특별시')
INTO location1 (location1_no, location1_name) VALUES (1, '인천광역시')
INTO location1 (location1_no, location1_name) VALUES (2, '경기도')
-- 지역(시,군,구) 인덱스
INTO location2 (location2_no, location2_name) VALUES (0, '강남구')
INTO location2 (location2_no, location2_name) VALUES (1, '강동구')
INTO location2 (location2_no, location2_name) VALUES (2, '강북구')
INTO location2 (location2_no, location2_name) VALUES (3, '강서구')
INTO location2 (location2_no, location2_name) VALUES (4, '관악구')
INTO location2 (location2_no, location2_name) VALUES (5, '광진구')
INTO location2 (location2_no, location2_name) VALUES (6, '구로구')
INTO location2 (location2_no, location2_name) VALUES (7, '금천구')
INTO location2 (location2_no, location2_name) VALUES (8, '노원구')
INTO location2 (location2_no, location2_name) VALUES (9, '도봉구')
INTO location2 (location2_no, location2_name) VALUES (10, '동대문구')
INTO location2 (location2_no, location2_name) VALUES (11, '동작구')
INTO location2 (location2_no, location2_name) VALUES (12, '마포구')
INTO location2 (location2_no, location2_name) VALUES (13, '서대문구')
INTO location2 (location2_no, location2_name) VALUES (14, '서초구')
INTO location2 (location2_no, location2_name) VALUES (15, '성동구')
INTO location2 (location2_no, location2_name) VALUES (16, '성북구')
INTO location2 (location2_no, location2_name) VALUES (17, '송파구')
INTO location2 (location2_no, location2_name) VALUES (18, '양천구')
INTO location2 (location2_no, location2_name) VALUES (19, '영등포구')
INTO location2 (location2_no, location2_name) VALUES (20, '용산구')
INTO location2 (location2_no, location2_name) VALUES (21, '은평구')
INTO location2 (location2_no, location2_name) VALUES (22, '종로구')
INTO location2 (location2_no, location2_name) VALUES (23, '중구')
INTO location2 (location2_no, location2_name) VALUES (24, '중랑구')
INTO location2 (location2_no, location2_name) VALUES (25, '계양구')
INTO location2 (location2_no, location2_name) VALUES (26, '남구')
INTO location2 (location2_no, location2_name) VALUES (27, '남동구')
INTO location2 (location2_no, location2_name) VALUES (28, '동구')
INTO location2 (location2_no, location2_name) VALUES (29, '부평구')
INTO location2 (location2_no, location2_name) VALUES (30, '서구')
INTO location2 (location2_no, location2_name) VALUES (31, '연수구')
INTO location2 (location2_no, location2_name) VALUES (32, '중구')
INTO location2 (location2_no, location2_name) VALUES (33, '강화군')
INTO location2 (location2_no, location2_name) VALUES (34, '옹진군')
INTO location2 (location2_no, location2_name) VALUES (35, '고양시')
INTO location2 (location2_no, location2_name) VALUES (36, '과천시')
INTO location2 (location2_no, location2_name) VALUES (37, '광명시')
INTO location2 (location2_no, location2_name) VALUES (38, '광주시')
INTO location2 (location2_no, location2_name) VALUES (39, '구리시')
INTO location2 (location2_no, location2_name) VALUES (40, '군포시')
INTO location2 (location2_no, location2_name) VALUES (41, '김포시')
INTO location2 (location2_no, location2_name) VALUES (42, '남양주시')
INTO location2 (location2_no, location2_name) VALUES (43, '동두천시')
INTO location2 (location2_no, location2_name) VALUES (44, '부천시')
INTO location2 (location2_no, location2_name) VALUES (45, '성남시')
INTO location2 (location2_no, location2_name) VALUES (46, '수원시')
INTO location2 (location2_no, location2_name) VALUES (47, '시흥시')
INTO location2 (location2_no, location2_name) VALUES (48, '안산시')
INTO location2 (location2_no, location2_name) VALUES (49, '안성시')
INTO location2 (location2_no, location2_name) VALUES (50, '안양시')
INTO location2 (location2_no, location2_name) VALUES (51, '양주시')
INTO location2 (location2_no, location2_name) VALUES (52, '오산시')
INTO location2 (location2_no, location2_name) VALUES (53, '용인시')
INTO location2 (location2_no, location2_name) VALUES (54, '의왕시')
INTO location2 (location2_no, location2_name) VALUES (55, '의정부시')
INTO location2 (location2_no, location2_name) VALUES (56, '이천시')
INTO location2 (location2_no, location2_name) VALUES (57, '파주시')
INTO location2 (location2_no, location2_name) VALUES (58, '평택시')
INTO location2 (location2_no, location2_name) VALUES (59, '포천시')
INTO location2 (location2_no, location2_name) VALUES (60, '하남시')
INTO location2 (location2_no, location2_name) VALUES (61, '화성시')
INTO location2 (location2_no, location2_name) VALUES (62, '가평군')
INTO location2 (location2_no, location2_name) VALUES (63, '양평군')
INTO location2 (location2_no, location2_name) VALUES (64, '여주군')
INTO location2 (location2_no, location2_name) VALUES (65, '연천군')
SELECT * FROM DUAL;

-- 유저
INSERT INTO users VALUES (users_seq.nextval, 'admin@letsports.com', '1111', 0, TO_DATE('2021-01-02 0:56:28', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '관리자우기', '세계통일 피이이스', 'admin.jpg', 1993, 1, 13, 2, 48);
INSERT INTO users VALUES (users_seq.nextval, 'user1@letsports.com', '1111', 2, TO_DATE('2021-01-03 1:17:55', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가자미', '평화통일정책의 수립...', null, null, null, null, 1, 32);
INSERT INTO users VALUES (users_seq.nextval, 'user2@letsports.com', '1111', 2, TO_DATE('2021-01-04 2:12:43', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노사미', '제1항의 탄핵소추는 ...', null, 2000, 12, 8, 1, 34);
INSERT INTO users VALUES (users_seq.nextval, 'user3@letsports.com', '1111', 2, TO_DATE('2021-01-04 3:57:27', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가부장제', '정부는 회계연도마다 ...', null, 1990, 8, 4, 2, 56);
INSERT INTO users VALUES (users_seq.nextval, 'user4@letsports.com', '1111', 2, TO_DATE('2021-01-04 4:29:36', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민간신앙', '재의의 요구가 있을 ...', 'user_profile16.jpg', 1995, 5, 12, 2, 54);
INSERT INTO users VALUES (users_seq.nextval, 'user5@letsports.com', '1111', 2, TO_DATE('2021-01-07 5:35:52', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민본주의', '연소자의 근로는 특별...', 'user_profile38.jpg', 1999, 6, 20, 0, 1);
INSERT INTO users VALUES (users_seq.nextval, 'user6@letsports.com', '1111', 2, TO_DATE('2021-01-08 6:28:06', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가대인', '외국인은 국제법과 조...', 'user_profile30.jpg', null, null, null, 2, 44);
INSERT INTO users VALUES (users_seq.nextval, 'user7@letsports.com', '1111', 2, TO_DATE('2021-01-08 7:30:48', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가마니', '비상계엄하의 군사재...', null, 1997, 9, 10, 0, 19);
INSERT INTO users VALUES (users_seq.nextval, 'user8@letsports.com', '1111', 2, TO_DATE('2021-01-10 8:51:16', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민방공', '모든 국민은 법 앞에 ...', null, 2001, 2, 10, 1, 26);
INSERT INTO users VALUES (users_seq.nextval, 'user9@letsports.com', '1111', 2, TO_DATE('2021-01-11 9:24:11', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가입순', '국채를 모집하거나 예...', null, null, null, null, 2, 50);
INSERT INTO users VALUES (users_seq.nextval, 'user10@letsports.com', '1111', 2, TO_DATE('2021-01-11 10:08:54', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마이컴', '원장은 국회의 동의를...', null, 1988, 12, 22, 0, 5);
INSERT INTO users VALUES (users_seq.nextval, 'user11@letsports.com', '1111', 2, TO_DATE('2021-01-13 11:46:59', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가입서', '행정각부의 설치·조...', null, 2002, 12, 27, 0, 21);
INSERT INTO users VALUES (users_seq.nextval, 'user12@letsports.com', '1111', 2, TO_DATE('2021-01-14 12:22:10', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노자', '헌법재판소는 법률에 ...', 'user_profile24.jpg', 2000, 4, 21, 0, 9);
INSERT INTO users VALUES (users_seq.nextval, 'user13@letsports.com', '1111', 2, TO_DATE('2021-01-14 13:26:16', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민법', '모든 국민은 자기의 ...', 'user_profile20.jpg', 1999, 8, 18, 2, 48);
INSERT INTO users VALUES (users_seq.nextval, 'user14@letsports.com', '1111', 2, TO_DATE('2021-01-16 14:21:09', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민방위', '이 헌법시행 당시의 ...', null, null, null, null, 2, 35);
INSERT INTO users VALUES (users_seq.nextval, 'user15@letsports.com', '1111', 2, TO_DATE('2021-01-17 15:44:10', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만능선수', '대법관은 대법원장의 ...', null, 1984, 4, 10, 2, 48);
INSERT INTO users VALUES (users_seq.nextval, 'trainer1@letsports.com', '1111', 1, TO_DATE('2021-01-17 15:44:13', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '쫑코치', '안녕하세요. 쫑코치입니다.', 'trainer1.png', 1992, 1, 25, 0, 0);
INSERT INTO users VALUES (users_seq.nextval, 'user16@letsports.com', '1111', 2, TO_DATE('2021-01-18 16:05:23', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '녹두', '대통령은 헌법과 법률...', null, 1989, 12, 10, 0, 17);
INSERT INTO users VALUES (users_seq.nextval, 'user17@letsports.com', '1111', 2, TO_DATE('2021-01-18 17:19:33', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만고', '모든 국민은 건강하고...', null, 1996, 12, 5, 2, 54);
INSERT INTO users VALUES (users_seq.nextval, 'user18@letsports.com', '1111', 2, TO_DATE('2021-01-18 18:44:39', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민권확장', '대통령은 국무회의의 ...', null, 1992, 9, 17, 0, 18);
INSERT INTO users VALUES (users_seq.nextval, 'user19@letsports.com', '1111', 2, TO_DATE('2021-01-18 19:38:19', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '류큐인', '대법관은 대법원장의 ...', 'user_profile53.jpg', 1996, 10, 14, 1, 32);
INSERT INTO users VALUES (users_seq.nextval, 'user20@letsports.com', '1111', 2, TO_DATE('2021-01-19 20:23:38', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가짓말', '전직대통령의 신분과 ...', null, 1989, 1, 24, 2, 46);
INSERT INTO users VALUES (users_seq.nextval, 'user21@letsports.com', '1111', 2, TO_DATE('2021-01-19 21:33:00', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노랭이', '대한민국의 주권은 국...', null, 2000, 5, 7, 1, 31);
INSERT INTO users VALUES (users_seq.nextval, 'user22@letsports.com', '1111', 2, TO_DATE('2021-01-20 22:54:32', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가주소', '모든 국민은 종교의 ...', 'user_profile25.jpg', 1993, 3, 22, 1, 25);
INSERT INTO users VALUES (users_seq.nextval, 'user23@letsports.com', '1111', 2, TO_DATE('2021-01-21 23:58:20', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '리을기역', '모든 국민은 자기의 ...', null, 1986, 8, 9, 0, 12);
INSERT INTO users VALUES (users_seq.nextval, 'trainer2@letsports.com', '1111', 1, TO_DATE('2021-01-21 23:58:22', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '뽀쌤', '안녕하세요. 뽀쌤입니다.', 'trainer2.png', 1993, 2, 12, 0, 4);
INSERT INTO users VALUES (users_seq.nextval, 'user24@letsports.com', '1111', 2, TO_DATE('2021-01-22 0:37:51', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마음가짐', '국가안전보장회의는 ...', 'user_profile52.jpg', 1991, 4, 17, 0, 6);
INSERT INTO users VALUES (users_seq.nextval, 'user25@letsports.com', '1111', 2, TO_DATE('2021-01-24 1:16:56', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민가', '원장은 국회의 동의를...', null, null, null, null, 2, 39);
INSERT INTO users VALUES (users_seq.nextval, 'user26@letsports.com', '1111', 2, TO_DATE('2021-01-25 2:45:23', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가량', '대통령은 조국의 평화...', 'user_profile51.jpg', 2000, 2, 21, 0, 1);
INSERT INTO users VALUES (users_seq.nextval, 'user27@letsports.com', '1111', 2, TO_DATE('2021-01-25 3:19:01', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가입비', '국민경제자문회의의 ...', 'user_profile47.jpg', null, null, null, 0, 21);
INSERT INTO users VALUES (users_seq.nextval, 'user28@letsports.com', '1111', 2, TO_DATE('2021-01-26 4:49:30', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만근', '국가는 과학기술의 혁...', 'user_profile46.jpg', 1985, 11, 5, 2, 35);
INSERT INTO users VALUES (users_seq.nextval, 'user29@letsports.com', '1111', 2, TO_DATE('2021-01-26 5:48:37', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노랑벤자리', '대통령이 궐위된 때 ...', 'user_profile39.jpg', null, null, null, 1, 34);
INSERT INTO users VALUES (users_seq.nextval, 'trainer3@letsports.com', '1111', 1, TO_DATE('2021-01-26 5:48:39', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', 'Eddy코치', '안녕하세요. Eddy입니다.', 'trainer3.jpg', 1994, 6, 23, 0, 7);
INSERT INTO users VALUES (users_seq.nextval, 'user30@letsports.com', '1111', 2, TO_DATE('2021-01-26 6:07:22', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '녹두죽', '국회가 재적의원 과반...', 'user_profile12.jpg', 1987, 1, 14, 0, 4);
INSERT INTO users VALUES (users_seq.nextval, 'user31@letsports.com', '1111', 2, TO_DATE('2021-01-27 7:35:41', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '리을미음', '국회는 국가의 예산안...', 'user_profile55.jpg', 1995, 10, 9, 0, 0);
INSERT INTO users VALUES (users_seq.nextval, 'user32@letsports.com', '1111', 2, TO_DATE('2021-01-28 8:45:07', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노동법', '대한민국은 국제평화...', 'user_profile60.jpg', 1995, 6, 8, 0, 5);
INSERT INTO users VALUES (users_seq.nextval, 'user33@letsports.com', '1111', 2, TO_DATE('2021-01-29 9:55:01', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민사범', '국회는 헌법개정안이 ...', 'user_profile58.jpg', 2002, 3, 24, 2, 54);
INSERT INTO users VALUES (users_seq.nextval, 'trainer4@letsports.com', '1111', 1, TO_DATE('2021-01-29 9:55:03', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', 'NIna', '안녕하세요. Nina입니다.', 'trainer4.png', 1992, 12, 26, 0, 12);
INSERT INTO users VALUES (users_seq.nextval, 'user34@letsports.com', '1111', 2, TO_DATE('2021-01-30 10:53:03', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노장', '헌법재판소에서 법률...', null, 1989, 2, 8, 2, 52);
INSERT INTO users VALUES (users_seq.nextval, 'user35@letsports.com', '1111', 2, TO_DATE('2021-01-31 11:25:07', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가라국', '헌법개정은 국회재적...', 'user_profile11.jpg', 1991, 10, 16, 1, 29);
INSERT INTO users VALUES (users_seq.nextval, 'trainer5@letsports.com', '1111', 1, TO_DATE('2021-01-31 11:25:08', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '천형', '안녕하세요. 천형입니다.', 'trainer5.png', 1995, 1, 20, 0, 14);
INSERT INTO users VALUES (users_seq.nextval, 'user36@letsports.com', '1111', 2, TO_DATE('2021-01-31 12:09:09', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '리', '헌법개정은 국회재적...', 'user_profile45.jpg', 1985, 4, 5, 0, 11);
INSERT INTO users VALUES (users_seq.nextval, 'user37@letsports.com', '1111', 2, TO_DATE('2021-01-31 13:32:19', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '리을시옷', '국가는 농지에 관하여...', 'user_profile27.jpg', 1999, 3, 7, 0, 6);
INSERT INTO users VALUES (users_seq.nextval, 'user38@letsports.com', '1111', 2, TO_DATE('2021-02-01 14:52:21', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민사부', '제2항의 재판관중 3인...', 'user_profile31.jpg', 1994, 3, 20, 0, 10);
INSERT INTO users VALUES (users_seq.nextval, 'user39@letsports.com', '1111', 2, TO_DATE('2021-02-01 15:24:42', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민사', '국회의원은 국가이익...', 'user_profile2.jpg', 1998, 2, 27, 2, 55);
INSERT INTO users VALUES (users_seq.nextval, 'user40@letsports.com', '1111', 2, TO_DATE('2021-02-01 16:21:39', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가무연', '국가는 법률이 정하는...', null, 1990, 5, 17, 2, 55);
INSERT INTO users VALUES (users_seq.nextval, 'user41@letsports.com', '1111', 2, TO_DATE('2021-02-01 17:32:12', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만등회', '국회는 정부의 동의없...', null, 1985, 10, 18, 0, 9);
INSERT INTO users VALUES (users_seq.nextval, 'user42@letsports.com', '1111', 2, TO_DATE('2021-02-01 18:20:34', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '미혹', '대통령은 국민의 보통...', null, 1997, 5, 5, 1, 34);
INSERT INTO users VALUES (users_seq.nextval, 'user43@letsports.com', '1111', 2, TO_DATE('2021-02-01 19:26:03', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만듦새', '모든 국민은 사생활의...', 'user_profile17.jpg', 1999, 7, 7, 2, 45);
INSERT INTO users VALUES (users_seq.nextval, 'user44@letsports.com', '1111', 2, TO_DATE('2021-02-01 20:31:11', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가로줄눈', '위원은 탄핵 또는 금...', 'user_profile36.jpg', null, null, null, 0, 5);
INSERT INTO users VALUES (users_seq.nextval, 'trainer6@letsports.com', '1111', 1, TO_DATE('2021-02-01 20:31:13', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '다이너마이트', '안녕하세요. 다이너입니다.', 'trainer6.png', 1993, 7, 9, 0, 17);
INSERT INTO users VALUES (users_seq.nextval, 'user45@letsports.com', '1111', 2, TO_DATE('2021-02-02 21:50:13', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마적단', '제1항의 탄핵소추는 ...', 'user_profile1.jpg', null, null, null, 1, 27);
INSERT INTO users VALUES (users_seq.nextval, 'user46@letsports.com', '1111', 2, TO_DATE('2021-02-02 22:38:47', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가일층', '국회는 의장 1인과 부...', null, null, null, null, 2, 45);
INSERT INTO users VALUES (users_seq.nextval, 'user47@letsports.com', '1111', 2, TO_DATE('2021-02-02 23:40:41', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마이크로', '훈장등의 영전은 이를...', 'user_profile18.jpg', null, null, null, 2, 51);
INSERT INTO users VALUES (users_seq.nextval, 'user48@letsports.com', '1111', 2, TO_DATE('2021-02-03 0:11:27', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만기제대', '국가는 여자의 복지와...', 'user_profile19.jpg', 1986, 7, 8, 2, 44);
INSERT INTO users VALUES (users_seq.nextval, 'user49@letsports.com', '1111', 2, TO_DATE('2021-02-03 1:25:36', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '링거액', '국회의 회의는 공개한...', 'user_profile6.jpg', 1996, 1, 27, 1, 34);
INSERT INTO users VALUES (users_seq.nextval, 'user50@letsports.com', '1111', 2, TO_DATE('2021-02-03 2:01:34', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노면', '정당의 설립은 자유이...', 'user_profile48.jpg', null, null, null, 0, 0);
INSERT INTO users VALUES (users_seq.nextval, 'user51@letsports.com', '1111', 2, TO_DATE('2021-02-04 3:31:06', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가라지', '모든 국민은 헌법과 ...', 'user_profile14.jpg', 1990, 6, 23, 1, 31);
INSERT INTO users VALUES (users_seq.nextval, 'user52@letsports.com', '1111', 2, TO_DATE('2021-02-04 4:39:32', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노임', '대통령으로 선거될 수...', null, 1988, 8, 21, 1, 31);
INSERT INTO users VALUES (users_seq.nextval, 'trainer7@letsports.com', '1111', 1, TO_DATE('2021-02-04 4:39:33', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '핵쌤', '안녕하세요. 핵쌤입니다.', 'trainer7.png', 1990, 8, 29, 1, 25);
INSERT INTO users VALUES (users_seq.nextval, 'user53@letsports.com', '1111', 2, TO_DATE('2021-02-05 5:48:42', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '널뛰기', '법원은 최고법원인 대...', null, 1998, 3, 4, 2, 39);
INSERT INTO users VALUES (users_seq.nextval, 'user54@letsports.com', '1111', 2, TO_DATE('2021-02-05 6:46:00', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민둥산', '국무총리는 대통령을 ...', null, 1987, 8, 14, 2, 40);
INSERT INTO users VALUES (users_seq.nextval, 'user55@letsports.com', '1111', 2, TO_DATE('2021-02-05 7:16:49', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만국기', '대통령·국무총리·국...', 'user_profile56.jpg', null, null, null, 0, 5);
INSERT INTO users VALUES (users_seq.nextval, 'user56@letsports.com', '1111', 2, TO_DATE('2021-02-05 8:49:14', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마음고생', '국무위원은 국무총리...', 'user_profile41.jpg', 1984, 8, 27, 2, 51);
INSERT INTO users VALUES (users_seq.nextval, 'user57@letsports.com', '1111', 2, TO_DATE('2021-02-05 9:51:35', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민간약', '국민의 자유와 권리는...', 'user_profile43.jpg', null, null, null, 2, 37);
INSERT INTO users VALUES (users_seq.nextval, 'trainer8@letsports.com', '1111', 1, TO_DATE('2021-02-05 9:51:35', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '소연쌤', '안녕하세요. 소연쌤입니다.', 'trainer8.png', 1994, 7, 7, 1, 32);
INSERT INTO users VALUES (users_seq.nextval, 'user58@letsports.com', '1111', 2, TO_DATE('2021-02-06 10:18:29', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마이크로칩', '체포·구속·압수 또...', 'user_profile22.jpg', 2000, 1, 24, 2, 42);
INSERT INTO users VALUES (users_seq.nextval, 'user59@letsports.com', '1111', 2, TO_DATE('2021-02-06 11:04:04', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가로변', '대법원은 법률에 저촉...', null, 1986, 3, 12, 2, 36);
INSERT INTO users VALUES (users_seq.nextval, 'user60@letsports.com', '1111', 2, TO_DATE('2021-02-06 12:27:24', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만개', '국교는 인정되지 아니...', 'user_profile4.jpg', 2002, 9, 20, 2, 53);
INSERT INTO users VALUES (users_seq.nextval, 'user61@letsports.com', '1111', 2, TO_DATE('2021-02-07 13:52:31', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만두피', '국회가 재적의원 과반...', null, 1995, 6, 16, 2, 48);
INSERT INTO users VALUES (users_seq.nextval, 'user62@letsports.com', '1111', 2, TO_DATE('2021-02-08 14:59:47', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노화', '의원을 제명하려면 국...', 'user_profile5.jpg', null, null, null, 1, 32);
INSERT INTO users VALUES (users_seq.nextval, 'user63@letsports.com', '1111', 2, TO_DATE('2021-02-08 15:41:24', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가위표', '대통령은 법률이 정하...', 'user_profile42.jpg', null, null, null, 2, 52);
INSERT INTO users VALUES (users_seq.nextval, 'user64@letsports.com', '1111', 2, TO_DATE('2021-02-08 16:53:04', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노서아', '국회의 회의는 공개한...', null, null, null, null, 2, 36);
INSERT INTO users VALUES (users_seq.nextval, 'trainer9@letsports.com', '1111', 1, TO_DATE('2021-02-08 16:53:04', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마이쌤', '안녕하세요. 마이쌤입니다.', 'trainer9.png', 1992, 8, 29, 2, 35);
INSERT INTO users VALUES (users_seq.nextval, 'user65@letsports.com', '1111', 2, TO_DATE('2021-02-08 17:42:18', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가독성', '이 헌법은 1988년 2월...', 'user_profile54.jpg', null, null, null, 0, 18);
INSERT INTO users VALUES (users_seq.nextval, 'user66@letsports.com', '1111', 2, TO_DATE('2021-02-09 18:29:17', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가로쓰기', '이 헌법중 공무원의 ...', 'user_profile10.jpg', null, null, null, 1, 32);
INSERT INTO users VALUES (users_seq.nextval, 'user67@letsports.com', '1111', 2, TO_DATE('2021-02-09 19:10:57', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '뢴트게늄', '대통령의 임기는 5년...', 'user_profile59.jpg', 2001, 6, 18, 2, 52);
INSERT INTO users VALUES (users_seq.nextval, 'user68@letsports.com', '1111', 2, TO_DATE('2021-02-09 20:34:12', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가로띠', '재판의 전심절차로서 ...', 'user_profile26.jpg', 1988, 11, 22, 2, 37);
INSERT INTO users VALUES (users_seq.nextval, 'trainer10@letsports.com', '1111', 1, TO_DATE('2021-02-09 20:34:12', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '범키쌤', '안녕하세요. 범키쌤입니다.', 'trainer10.png', 1989, 12, 29, 2, 38);
INSERT INTO users VALUES (users_seq.nextval, 'user69@letsports.com', '1111', 2, TO_DATE('2021-02-09 21:47:31', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노계', '대통령은 헌법과 법률...', 'user_profile21.jpg', null, null, null, 2, 46);
INSERT INTO users VALUES (users_seq.nextval, 'user70@letsports.com', '1111', 2, TO_DATE('2021-02-09 22:02:59', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마호병', '군인 또는 군무원이 ...', 'user_profile28.jpg', null, null, null, 0, 16);
INSERT INTO users VALUES (users_seq.nextval, 'user71@letsports.com', '1111', 2, TO_DATE('2021-02-09 23:04:50', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가관절', '지방의회의 조직·권...', 'user_profile35.jpg', 1984, 12, 9, 2, 38);
INSERT INTO users VALUES (users_seq.nextval, 'user72@letsports.com', '1111', 2, TO_DATE('2021-02-10 0:42:54', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민군', '대통령이 궐위되거나 ...', 'user_profile8.jpg', null, null, null, 1, 33);
INSERT INTO users VALUES (users_seq.nextval, 'user73@letsports.com', '1111', 2, TO_DATE('2021-02-10 1:13:56', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노른어', '탄핵결정은 공직으로...', null, 1987, 9, 4, 2, 53);
INSERT INTO users VALUES (users_seq.nextval, 'user74@letsports.com', '1111', 2, TO_DATE('2021-02-10 2:10:51', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가름대', '언론·출판에 대한 허...', null, 1997, 4, 20, 0, 22);
INSERT INTO users VALUES (users_seq.nextval, 'user75@letsports.com', '1111', 2, TO_DATE('2021-02-10 3:01:25', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만고풍상', '국토와 자원은 국가의...', null, null, null, null, 1, 33);
INSERT INTO users VALUES (users_seq.nextval, 'user76@letsports.com', '1111', 2, TO_DATE('2021-02-10 4:23:55', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가까이', '행정권은 대통령을 수...', null, 1990, 11, 9, 2, 43);
INSERT INTO users VALUES (users_seq.nextval, 'user77@letsports.com', '1111', 2, TO_DATE('2021-02-10 5:27:44', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가도', '국가는 국민 모두의 ...', 'user_profile9.jpg', 1984, 11, 21, 0, 23);
INSERT INTO users VALUES (users_seq.nextval, 'trainer11@letsports.com', '1111', 1, TO_DATE('2021-02-10 5:27:44', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '긴코치', '안녕하세요. 긴코치입니다.', 'trainer11.png', 1988, 3, 21, 2, 44);
INSERT INTO users VALUES (users_seq.nextval, 'user78@letsports.com', '1111', 2, TO_DATE('2021-02-11 6:57:30', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민렴', '법률이 정하는 주요방...', null, 1992, 1, 24, 1, 31);
INSERT INTO users VALUES (users_seq.nextval, 'user79@letsports.com', '1111', 2, TO_DATE('2021-02-11 7:00:45', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민권', '대통령은 조약을 체결...', 'user_profile33.jpg', 1986, 2, 27, 1, 30);
INSERT INTO users VALUES (users_seq.nextval, 'user80@letsports.com', '1111', 2, TO_DATE('2021-02-11 8:09:18', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노른자위', '대통령은 법률안의 일...', 'user_profile3.jpg', 1984, 2, 12, 1, 25);
INSERT INTO users VALUES (users_seq.nextval, 'trainer12@letsports.com', '1111', 1, TO_DATE('2021-02-11 8:09:18', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '수연쌤', '안녕하세요. 수연쌤입니다.', 'trainer12.png', 1993, 5, 2, 2, 50);
INSERT INTO users VALUES (users_seq.nextval, 'user81@letsports.com', '1111', 2, TO_DATE('2021-02-12 9:50:48', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '넓적다리뼈', '명령·규칙 또는 처분...', null, null, null, null, 0, 12);
INSERT INTO users VALUES (users_seq.nextval, 'user82@letsports.com', '1111', 2, TO_DATE('2021-02-12 10:54:26', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가명제', '새로운 회계연도가 개...', null, 1997, 11, 14, 2, 38);
INSERT INTO users VALUES (users_seq.nextval, 'user83@letsports.com', '1111', 2, TO_DATE('2021-02-12 11:20:35', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민간외교', '언론·출판은 타인의 ...', 'user_profile29.jpg', 1995, 7, 21, 0, 24);
INSERT INTO users VALUES (users_seq.nextval, 'user84@letsports.com', '1111', 2, TO_DATE('2021-02-12 12:40:37', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '미혼자', '새로운 회계연도가 개...', 'user_profile49.jpg', 2001, 9, 18, 2, 43);
INSERT INTO users VALUES (users_seq.nextval, 'user85@letsports.com', '1111', 2, TO_DATE('2021-02-12 13:47:45', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가정학', '명령·규칙 또는 처분...', 'user_profile57.jpg', 1997, 5, 24, 1, 30);
INSERT INTO users VALUES (users_seq.nextval, 'user86@letsports.com', '1111', 2, TO_DATE('2021-02-13 14:06:50', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가성', '모든 국민은 언론·출...', 'user_profile34.jpg', 1998, 10, 23, 0, 18);
INSERT INTO users VALUES (users_seq.nextval, 'user87@letsports.com', '1111', 2, TO_DATE('2021-02-13 15:22:52', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '리드', '법원은 최고법원인 대...', 'user_profile32.jpg', 1988, 10, 23, 2, 35);
INSERT INTO users VALUES (users_seq.nextval, 'user88@letsports.com', '1111', 2, TO_DATE('2021-02-13 16:14:28', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가법', '대통령·국무총리·국...', null, 1994, 1, 7, 0, 1);
INSERT INTO users VALUES (users_seq.nextval, 'user89@letsports.com', '1111', 2, TO_DATE('2021-02-13 17:11:13', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가마니틀', '대통령의 임기는 5년...', null, 1993, 4, 16, 0, 3);
INSERT INTO users VALUES (users_seq.nextval, 'user90@letsports.com', '1111', 2, TO_DATE('2021-02-13 18:36:58', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '마포', '군인은 현역을 면한 ...', null, null, null, null, 2, 37);
INSERT INTO users VALUES (users_seq.nextval, 'user91@letsports.com', '1111', 2, TO_DATE('2021-02-13 19:37:20', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가산점', '국가는 전통문화의 계...', 'user_profile50.jpg', 1991, 7, 20, 1, 32);
INSERT INTO users VALUES (users_seq.nextval, 'user92@letsports.com', '1111', 2, TO_DATE('2021-02-13 20:28:08', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '만군', '대통령이 궐위된 때 ...', 'user_profile13.jpg', 1998, 7, 16, 0, 2);
INSERT INTO users VALUES (users_seq.nextval, 'user93@letsports.com', '1111', 2, TO_DATE('2021-02-13 21:43:14', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '널판지', '모든 국민은 근로의 ...', 'user_profile23.jpg', null, null, null, 2, 46);
INSERT INTO users VALUES (users_seq.nextval, 'user94@letsports.com', '1111', 2, TO_DATE('2021-02-14 22:08:33', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '노모', '제1항의 탄핵소추는 ...', null, 1994, 11, 23, 2, 57);
INSERT INTO users VALUES (users_seq.nextval, 'user95@letsports.com', '1111', 2, TO_DATE('2021-02-14 23:41:49', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '민력', '모든 국민은 법률이 ...', 'user_profile40.jpg', 1985, 9, 4, 2, 38);
INSERT INTO users VALUES (users_seq.nextval, 'user96@letsports.com', '1111', 2, TO_DATE('2021-02-14 0:36:43', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가윗날', '대통령의 선거에 관한...', 'user_profile15.jpg', 1984, 1, 23, 2, 44);
INSERT INTO users VALUES (users_seq.nextval, 'user97@letsports.com', '1111', 2, TO_DATE('2021-02-14 1:34:44', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가변성', '대통령의 선거에 관한...', 'user_profile44.jpg', 1988, 7, 12, 0, 0);
INSERT INTO users VALUES (users_seq.nextval, 'user98@letsports.com', '1111', 2, TO_DATE('2021-02-14 2:43:57', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가정의례', '국군의 조직과 편성은...', null, 2001, 2, 22, 1, 26);
INSERT INTO users VALUES (users_seq.nextval, 'user99@letsports.com', '1111', 2, TO_DATE('2021-02-14 3:55:02', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '가부동수', '군인은 현역을 면한 ...', 'user_profile37.jpg', 2001, 6, 17, 0, 3);
INSERT INTO users VALUES (users_seq.nextval, 'user100@letsports.com', '1111', 2, TO_DATE('2021-02-15 4:15:05', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '로타리', '감사원은 원장을 포함...', 'user_profile7.jpg', 1989, 5, 22, 1, 26);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 17,  4, '김종석', '건강운동관리사.PNG', '강남센터', '안녕하세요 버핏프렌즈 여러분:) 쫑코치입니다!'||CHR(10)||CHR(13)||'저는 예전엔 120kg이 나가는 운동의 운자도 모르던 친구였었습니다..!'||CHR(10)||CHR(13)||'지금의 모습이 되기까지 미친듯한 다이어트가 도움됐다기보단 운동을 즐기고 꾸준한 생활습관에서의 노력이 제모습들을 만들었다고 생각이 듭니다:)'||CHR(10)||CHR(13)||'여러분 또한 LetsPorts와 함께하며 운동이란 게 힘들고 어려운 게 아니라 충분히 즐겁고 내 삶의 일부가 될 수가 있다는 것을 느껴보셨으면 좋겠습니다.'||CHR(10)||CHR(13)||'우리가 함께 땀 흘리고 즐기다 보면 어느새 내가 꿈꾸던 모습들에 한 발자국 더 다가갈 수 있지 않을까 라는 생각이 듭니다!'||CHR(10)||CHR(13)||'저 또한 옆에서 여러분들이 다치지 않고 재밌게 즐기실 수 있도록 최선을 다해 도와드리도록 하겠습니다!'||CHR(10)||CHR(13)||'LetsPorts 화이팅.!!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 26,  3, '김보현', '교정운동전문가.PNG', '관악센터', '안녕하세요 LetsPorts 여러분! LetsPorts 뽀쌤입니다 +_+♥️'||CHR(10)||CHR(13)||'이 글을 읽고 계시는분들은 [LetsPorts] 궁금해서, 혹은 앞으로 같이 함께하게 될 트레이너가 궁금해서 이 글을 읽고 계실거에요:)'||CHR(10)||CHR(13)||'짧은 글로 저를 표현할 수는 없지만....♥'||CHR(10)||CHR(13)||'저와 함께하는 운동시간이 우리 프렌즈에게 즐거운 시간이 될 수 있도록!'||CHR(10)||CHR(13)||'건강하고 행복한 에너지를 받아가는 시간이 될 수 있도록!'||CHR(10)||CHR(13)||'노력하겠습니다!'||CHR(10)||CHR(13)||'같이 운동을 하다보면 어느샌가 운동을 즐기고 있는 나를, 점점 더 나아지고 있는 나를 발견할 수있도록 최대한 서포트 하겠습니다.'||CHR(10)||CHR(13)||'함께해요 그대여♥️', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 33,  5, '박찬소', '국제응급처치자격증.PNG', '금천센터', 'WHAT’S UP!!! LetsPorts 에디코치(박찬소)입니다.'||CHR(10)||CHR(13)||'트레이너, 선생님이란 말을 들을 때마다 그것에 맞게 행동하고 경험과 지식을 쌓기 위한 노력으로 지금의 LetsPorts 트레이너 자리에 서게 되었습니다.'||CHR(10)||CHR(13)||'다년간 체육인, 트레이너로 활동하면서 건강하고 아름다운 바디는 건강한 습관에서 만들어진다는 걸 깨달았습니다.'||CHR(10)||CHR(13)||'여러분이 건강한 습관을 가질 수 있도록 좋은 파트너가 되어드리겠습니다.'||CHR(10)||CHR(13)||'항상 긍정적인 생각 잊지 마세요!'||CHR(10)||CHR(13)||'LetsPorts 파이팅! PEACE!!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 38,  4, '김나현', '펄스널트레이닝지도자.PNG', '신촌센터', '안녕하세요. LetsPorts 여러분! 트레이너 김나현입니다.'||CHR(10)||CHR(13)||'언제나 LetsPorts 여러분과 마주하는 시간은 설렘의 연속인 듯합니다.'||CHR(10)||CHR(13)||'LetsPorts와 함께 반복적인 일상에서 잠깐이나마 벗어나고, 그 속에서 일상의 건강한 습관을 만들어가는 의미 있는 시간을 여러분과 함께하게 되어 정말 감사하게 생각합니다.'||CHR(10)||CHR(13)||'언제나 여러분 옆에서 끌어주고 받쳐줄 수 있도록 에너지 넘치는 니나쌤이 될께요!!'||CHR(10)||CHR(13)||'짧지만 긴 시간 함께하며 건강도 친구도 모두 챙겨갈 수 있는 시간이 되길 바랍니다 ❤️', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 41,  7, '천현정', '생활스포츠지도사.PNG', '서초센터', '안녕하세요! LetsPorts 트레이너 천현정입니다.'||CHR(10)||CHR(13)||'평범한 일상에서 LetsPorts를 통해 여러분의 몸 그리고 마음까지 건강하게 변화하는 모습을 보면 정말 뿌듯합니다!'||CHR(10)||CHR(13)||'그래서인지 항상 떨리고 새로운 것 같아요.'||CHR(10)||CHR(13)||'우리 LetsPorts의 생활 속에 자연스럽게 운동이 자리 잡길 바라며 그렇게 되도록 최선을 다하겠습니다.'||CHR(10)||CHR(13)||'궁금한 점이 생기면 언제든지 물어봐 주시고요. 수업에서 만나요~ 안녕👋🏻', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 51,  5, '이병헌', '생활체육지도자자격증1.PNG', '송파센터', '안녕하세요! LetsPorts 가족들의 심장과 근육을 폭발시켜줄 공덕점의 다이너마이트 병헌트레이너입니다!'||CHR(10)||CHR(13)||'평소에 혼자서는 운동하기 힘드셨던 분들! 모두 환영합니다!'||CHR(10)||CHR(13)||'다 같이 즐겁고 빡세게 운동해봐요!'||CHR(10)||CHR(13)||'따라오는 꿀바디와 자신감은 덤!!'||CHR(10)||CHR(13)||'다 같이 뽜이팅~✊️', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 60,  8, '조형동', '운동처방사1.PNG', '계양센터', '안녕하세요 LetsPorts님들!!'||CHR(10)||CHR(13)||'LetsPorts에 합류하게 된 조형동 트레이너입니다!'||CHR(10)||CHR(13)||'같이 수업을 할 수 있다는 것에 굉장히 설레네요^^'||CHR(10)||CHR(13)||'회원님들에게 좋은 에너지를 주고 저 또 한 회원님들에게 좋은 에너지를 받을 수 있어서 너무 좋습니다!!'||CHR(10)||CHR(13)||'앞으로 같이 하게 될 LetsPorts 회원님들 다치지 않게 같이 몸짱이 되어보아요!!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 66,  5, '김소연', '체력평가사.PNG', '중구센터', '안녕하세요 LetsPorts 여러분^^'||CHR(10)||CHR(13)||'나는 운동이 재미없다! 힘들다! 귀찮다! 라는 분들!!!'||CHR(10)||CHR(13)||'LetsPorts과 함께 하면서 재밌다! 설렌다! 뿌듯하다! 로 바뀌는 나를 볼 수 있을 거예요.'||CHR(10)||CHR(13)||'소연쌤은 여러분의 몸과 마음을 모두 건강하게 만들어주는 강사가 되기 위해 노력하며 늘 가까이에 있겠습니다^^', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 74,  7, '문기정', '생활스포츠지도사2.PNG', '일산센터', '안녕하세요? 기정쌤이에요~!'||CHR(10)||CHR(13)||'나은 질의 삶을 살아가려고 하다보니 너무나도 많은 일들과 씨름해야하는 우리!'||CHR(10)||CHR(13)||'그러다보니 운동을 할 시간은 점점 멀어져가네요.'||CHR(10)||CHR(13)||'사실 나은질의 삶을 위해서는 건강관리가 매우 중요한 부분이에요!'||CHR(10)||CHR(13)||'평소 운동을 재미없게만 생각하셧던 모든 분들!'||CHR(10)||CHR(13)||'LetsPorts와 함께 건강하고 멋진 몸을 만드는 과정에서 내 몸안의 미를 찾아봐요~!'||CHR(10)||CHR(13)||'만나게되어 반가워요 ^^!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 79,  9, '김기범', '생활체육지도자자격증2.PNG', '광주센터', '안녕하세요!!! LetsPorts 여러분!!'||CHR(10)||CHR(13)||'트레이너 범키입니다 =)'||CHR(10)||CHR(13)||'운동하려고 마음은 먹었지만 막상 하려니 뭘 해야 할지 잘 모르고, 혼자 가서 하려니 쓸쓸하고 지루하고...!'||CHR(10)||CHR(13)||'운동에 습관 붙이기 어려워 매번 포기하신 분들!'||CHR(10)||CHR(13)||'가장 나쁜 운동은 아무것도 하지 않는 것이고, 가장 미련한 운동은 잘못된 자세로 하는 것입니다!'||CHR(10)||CHR(13)||'LetsPorts와 함께하는 시간 동안 많은 걸 배워가실 수 있도록 최선을 다해서 지도하고, 운동은 재미있고 즐겁게 해야 한다는 저의 생각을 여러분들과 공유하겠습니다! =)'||CHR(10)||CHR(13)||'만족은 결과가 아닌 과정에서 오는 것이며, 과정에 만족한다면 결과도 좋을 테니까요!'||CHR(10)||CHR(13)||'IT DOESN’T GET EASIER, 운동이 쉬워지지는 않을 겁니다, YOU JUST GET BETTER! 다만, 여러분이 더 성장할 뿐입니다!'||CHR(10)||CHR(13)||'새로운 인연이 기다리고 있는 LetsPorts! 모두 LetsPorts에서 만나요!!🤗', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 89,  11, '서다원', '운동처방사2.PNG', '부천센터', '안녕하세요 ! LetsPorts 여러분!'||CHR(10)||CHR(13)||'1기부터 함께하게 된 다원쌤입니다!'||CHR(10)||CHR(13)||'"과거의 후회와 미래의 희망 속엔 현재라는 기회가 있다"'||CHR(10)||CHR(13)||'정말 제가 좋아하는 문구인데요~ 여러분의 현재라는 기회에 많은 도움을 드릴 수 있도록 노력하겠습니다!!'||CHR(10)||CHR(13)||'제 이름처럼 모두 다~원하는 몸이 되는 그날까지 즐겁게 운동해요!!', SYSDATE);
INSERT INTO TRAINER_INFO VALUES (trainer_info_seq.nextval, 93,  6, '유수연', '펄스널트레이닝지도자.PNG', '안양센터', '안녕하세요 LetsPorts 여러분!!??'||CHR(10)||CHR(13)||'저는 LetsPorts 트레이너 유수연 입니다.'||CHR(10)||CHR(13)||'운동을 통해 몸과 마음이 건강해지고 변화된 생활을 보여준 사람들을 보는 것이 너무나 행복합니다.'||CHR(10)||CHR(13)||'저의 에너지를 통해 변화되는 하루를 기대해주세요'||CHR(10)||CHR(13)||'💪 여름이건 겨울이건 날씨가 덥던 춥던 우리는 오래오래만나길 바라며(?) 곧 수업에서 만나요🙌', SYSDATE);
INSERT INTO users VALUES (users_seq.nextval, 'user101@letsports.com', '1111', 2, TO_DATE('2021-02-16 8:15:05', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '느타리묵', '감사원은 원장을 포함...', null, 1997, 2, 18, 0, 2);
INSERT INTO users VALUES (users_seq.nextval, 'user102@letsports.com', '1111', 2, TO_DATE('2021-02-16 10:18:24', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '도토리묵', '감사원은 원장을 포함...', null, 1994, 1, 20, 0, 4);
INSERT INTO users VALUES (users_seq.nextval, 'user103@letsports.com', '1111', 2, TO_DATE('2021-02-16 12:25:35', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '또또리묵', '감사원은 원장을 포함...', null, 1993, 12, 27, 1, 26);
INSERT INTO users VALUES (users_seq.nextval, 'user104@letsports.com', '1111', 2, TO_DATE('2021-02-17 11:13:55', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '호히', '감사원은 원장을 포함...', null, 1996, 1, 7, 1, 26);
INSERT INTO users VALUES (users_seq.nextval, 'user105@letsports.com', '1111', 2, TO_DATE('2021-02-17 19:22:11', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '또묵', '감사원은 원장을 포함...', null, 1991, 2, 2, 1, 26);
INSERT INTO users VALUES (users_seq.nextval, 'user106@letsports.com', '1111', 2, TO_DATE('2021-02-18 10:13:32', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '또리', '감사원은 원장을 포함...', null, 1990, 1, 4, 1, 26);
INSERT INTO users VALUES (users_seq.nextval, 'user107@letsports.com', '1111', 2, TO_DATE('2021-02-18 13:32:27', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '또리묵', '감사원은 원장을 포함...', null, 1995, 3, 24, 1, 26);
INSERT INTO users VALUES (users_seq.nextval, 'user108@letsports.com', '1111', 2, TO_DATE('2021-02-18 15:54:51', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '리묵', '감사원은 원장을 포함...', null, 1983, 10, 17, 1, 26);
INSERT INTO users VALUES (users_seq.nextval, 'user109@letsports.com', '1111', 2, TO_DATE('2021-02-18 18:33:24', 'yyyy-mm-dd hh24:mi:ss'), sysdate, 1, 0, 0, '일반회원가입', '묵미이', '감사원은 원장을 포함...', null, 1986, 11, 23, 1, 26);

-- 유저 관심분야 146건
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 1, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 1, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 2, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 3, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 3, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 4, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 5, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 6, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 7, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 8, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 8, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 8, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 8, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 9, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 10, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 11, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 12, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 12, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 12, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 12, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 13, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 14, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 15, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 15, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 16, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 17, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 18, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 18, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 19, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 20, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 21, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 22, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 23, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 24, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 25, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 25, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 25, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 26, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 27, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 28, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 29, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 29, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 30, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 31, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 32, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 32, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 32, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 33, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 34, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 35, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 36, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 37, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 38, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 39, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 40, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 41, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 42, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 43, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 44, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 45, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 46, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 47, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 48, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 49, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 50, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 51, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 52, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 53, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 54, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 54, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 55, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 56, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 57, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 58, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 59, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 60, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 61, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 62, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 63, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 64, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 65, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 66, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 67, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 68, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 69, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 70, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 71, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 72, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 73, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 73, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 74, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 75, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 76, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 77, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 78, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 78, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 78, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 78, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 79, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 80, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 81, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 82, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 83, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 83, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 83, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 84, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 85, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 86, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 87, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 88, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 89, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 90, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 91, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 92, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 93, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 93, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 93, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 93, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 94, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 95, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 96, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 97, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 98, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 99, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 100, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 100, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 100, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 101, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 102, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 103, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 103, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 104, 4);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 105, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 106, 6);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 107, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 108, 8);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 108, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 108, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 108, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 109, 0);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 110, 1);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 111, 2);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 111, 5);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 111, 7);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 112, 3);
INSERT INTO user_interest VALUES (user_interest_seq.nextval, 113, 4);

-- 클래스 생성 
INSERT INTO MEETING values (meeting_seq.nextval, 1, 21, 2, 0, SYSDATE, TO_DATE('2021-02-11', 'yyyy-mm-dd'), TO_DATE('2021-02-14', 'yyyy-mm-dd'), TO_DATE('2021-02-16', 'yyyy-mm-dd'), 0, 23, '동네 족구하실분~', '족구 한번 합시다!', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 2, 18, 3, 1, SYSDATE, TO_DATE('2021-02-10', 'yyyy-mm-dd'), TO_DATE('2021-02-13', 'yyyy-mm-dd'), TO_DATE('2021-02-14', 'yyyy-mm-dd'), 0, 22, '6 대 6 풋살 배틀신청합니다.', '축구선수 6명으로 구성되어있습니다. 자신있으면 신청하세요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 3, 12, 5, 2, SYSDATE, TO_DATE('2021-02-12', 'yyyy-mm-dd'), TO_DATE('2021-02-18', 'yyyy-mm-dd'), TO_DATE('2021-03-01', 'yyyy-mm-dd'), 0, 24, '농구초보자, 한 수 배우겠습니다.', '재밌게 농구하실 분 구합니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 4, 14, 7, 3, SYSDATE, TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-18', 'yyyy-mm-dd'), TO_DATE('2021-02-27', 'yyyy-mm-dd'), 0, 21, '볼링 같이 하실 1분 구해요.', '볼링 초보자입니다. 함께해요!.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 5, 16, 1, 4, SYSDATE, TO_DATE('2021-02-01', 'yyyy-mm-dd'), TO_DATE('2021-03-01', 'yyyy-mm-dd'), TO_DATE('2021-03-02', 'yyyy-mm-dd'), 0, 20, '크로스핏 같이 시작하실 분.', '같이 만나서 크로스핏 시작하실 도전매니아 구합니다..', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 6, 11, 1, 5, SYSDATE, TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-18', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), 0, 19, '스피닝 조집시다.', '다 필요없고 스피닝할 사람 드루와.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 7, 14, 2, 6, SYSDATE, TO_DATE('2021-02-01', 'yyyy-mm-dd'), TO_DATE('2021-02-19', 'yyyy-mm-dd'), TO_DATE('2021-02-27', 'yyyy-mm-dd'), 0, 18, '팝핀 댄스 같이 시작하실분~', '우연히 시작한 댄스가 제 인생을 바꿔놨던 것처럼 우연한 만남으로 삶의 전환점이 되고 싶은 이쁜이입니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 1, 11, 4, 7, SYSDATE, TO_DATE('2021-01-12', 'yyyy-mm-dd'), TO_DATE('2021-02-27', 'yyyy-mm-dd'), TO_DATE('2021-03-04', 'yyyy-mm-dd'), 0, 23, '요가의 신', '요가의 신이 되고 싶으신 분들은 저와 함께해요~.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 2, 15, 5, 8, SYSDATE, TO_DATE('2021-02-15', 'yyyy-mm-dd'), TO_DATE('2021-02-19', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), 0, 22, '명상하면서 서로의 삶을 공유해요.', '명상과 함께 서로의 안식처가 되어줘요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 3, 6, 2, 1, SYSDATE, TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-20', 'yyyy-mm-dd'), TO_DATE('2021-02-24', 'yyyy-mm-dd'), 0, 21, '월드컵경기장에서 축구할 사람?', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 4, 9, 7, 2, SYSDATE, TO_DATE('2021-02-02', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), TO_DATE('2021-02-28', 'yyyy-mm-dd'), 0, 20, '서울대 vs 고려대 농구배틀할 인원 구한다.', '결판을 내자. 잘한다고 생각하는 놈만 신청해라.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 5, 14, 2, 3, SYSDATE, TO_DATE('2021-02-15', 'yyyy-mm-dd'), TO_DATE('2021-02-23', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), 0, 19, '볼링으로 스트레스 날려버릴 사람~', '볼링으로 스트레스 날리자', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 6, 16, 6, 4, SYSDATE, TO_DATE('2021-02-16', 'yyyy-mm-dd'), TO_DATE('2021-02-22', 'yyyy-mm-dd'), TO_DATE('2021-03-05', 'yyyy-mm-dd'), 0, 18, '혼자시작하기 두려운 크로스핏도전자 구함.', '혼자 시작하기 무서워.. 같이 시작해..난 겁쟁이야..', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 7, 18, 7, 5, SYSDATE, TO_DATE('2021-02-13', 'yyyy-mm-dd'), TO_DATE('2021-02-28', 'yyyy-mm-dd'), TO_DATE('2021-03-22', 'yyyy-mm-dd'), 0, 17, '열정적인 스피닝인들이여', '열정적인 사람만 같이할 맛나니까 열정적인 사람만 들어와.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 17, 5, 2, 6, SYSDATE, TO_DATE('2021-02-12', 'yyyy-mm-dd'), TO_DATE('2021-03-18', 'yyyy-mm-dd'), TO_DATE('2021-03-21', 'yyyy-mm-dd'), 0, 16, '유행하는 틱톡 춤 강의합니다', '애브리바디 틱톡커~!~!여러분들도 틱톡커가 될 수 있습니다!.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 26, 5, 1, 7, SYSDATE, TO_DATE('2021-02-11', 'yyyy-mm-dd'), TO_DATE('2021-02-23', 'yyyy-mm-dd'), TO_DATE('2021-02-24', 'yyyy-mm-dd'), 0, 15, '황아영의 요가 클럽', '등이 굽으신분들, 거북목이신 분들 모두 제가 맡겨주세요! 1달이면 눈에 띄게 좋아지실 겁니다!', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 33, 8, 6, 8, SYSDATE, TO_DATE('2021-02-02', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), TO_DATE('2021-02-26', 'yyyy-mm-dd'), 0, 14, '명상의 신.', '명상방법을 모르시고 하시는 분들이 생각보다 많습니다. 저에게 배워 명상의 신이 되어보세요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 38, 9, 2, 0, SYSDATE, TO_DATE('2021-02-10', 'yyyy-mm-dd'), TO_DATE('2021-02-24', 'yyyy-mm-dd'), TO_DATE('2021-02-28', 'yyyy-mm-dd'), 0, 13, '족구 1 대 1 강습', '족구대회에서 5번 우승한 족구 챔피언입니다. 족구계의 호날두로 만들어드리겠습니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 41, 10, 3, 1, SYSDATE, TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-24', 'yyyy-mm-dd'), TO_DATE('2021-02-26', 'yyyy-mm-dd'), 0, 12, '안녕하세요. 안정환입니다.', '축구를 관두고 새로운 시작을 letsport에서 하려고 합니다. 많은 참여바랍니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 51, 12, 2, 2, SYSDATE, TO_DATE('2021-02-09', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), TO_DATE('2021-02-27', 'yyyy-mm-dd'), 0, 11, '안녕하세요. 서장훈입니다..', '농구를 관두고 새로운 시작을 letsport에서 하려고 합니다. 많은 참여바랍니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 60, 12, 2, 3, SYSDATE, TO_DATE('2021-02-11', 'yyyy-mm-dd'), TO_DATE('2021-02-24', 'yyyy-mm-dd'), TO_DATE('2021-02-28', 'yyyy-mm-dd'), 0, 10, '볼링 강습.', '볼링 1대1 강습입니다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 66, 12, 2, 4, SYSDATE, TO_DATE('2021-02-13', 'yyyy-mm-dd'), TO_DATE('2021-02-28', 'yyyy-mm-dd'), TO_DATE('2021-03-03', 'yyyy-mm-dd'), 0, 9, '고투헬스장에서 크로스핏 10명 강습합니다.', '크로스핏의 대가 나정호와 함께하세요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 74, 12, 2, 5, SYSDATE, TO_DATE('2021-02-10', 'yyyy-mm-dd'), TO_DATE('2021-02-23', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), 0, 8, '스피닝선수 권용수입니다.', '함께 스피닝을 즐겨요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 79, 12, 2, 6, SYSDATE, TO_DATE('2021-02-12', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), TO_DATE('2021-02-27', 'yyyy-mm-dd'), 0, 7, '클럽팝핀댄서 권용수입니다.', '클럽춤의 모든 것을 알려드릴게요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 89, 12, 2, 7, SYSDATE, TO_DATE('2021-02-03', 'yyyy-mm-dd'), TO_DATE('2021-02-24', 'yyyy-mm-dd'), TO_DATE('2021-02-28', 'yyyy-mm-dd'), 0, 6, '이보희의 요가클럽.', '자세교정, 허리디스크를 앓던 저는 요가를 통해 새로운 삶을 찾았습니다. 여러분도 시작해보세요.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 93, 12, 2, 8, SYSDATE, TO_DATE('2021-02-05', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), TO_DATE('2021-02-28', 'yyyy-mm-dd'), 0, 5, '명상 강습', '명상하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 17, 12, 2, 0, SYSDATE, TO_DATE('2021-02-12', 'yyyy-mm-dd'), TO_DATE('2021-02-23', 'yyyy-mm-dd'), TO_DATE('2021-02-25', 'yyyy-mm-dd'), 0, 4, '족구 강습', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 26, 12, 2, 1, SYSDATE, TO_DATE('2021-02-11', 'yyyy-mm-dd'), TO_DATE('2021-02-22', 'yyyy-mm-dd'), TO_DATE('2021-02-24', 'yyyy-mm-dd'), 0, 3, '축구 강습', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 33, 12, 2, 2, SYSDATE, TO_DATE('2021-02-15', 'yyyy-mm-dd'), TO_DATE('2021-02-23', 'yyyy-mm-dd'), TO_DATE('2021-02-26', 'yyyy-mm-dd'), 0, 2, '농구 강습', '농구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 41, 12, 2, 3, SYSDATE, TO_DATE('2021-02-16', 'yyyy-mm-dd'), TO_DATE('2021-02-26', 'yyyy-mm-dd'), TO_DATE('2021-02-28', 'yyyy-mm-dd'), 0, 1, '볼링 강습', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);

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

-- MEETING 대표사진
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

-- 유저스크랩 트레이너 100건
INSERT INTO scrap VALUES (scrap_seq.nextval, 2, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 3, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 3, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 3, 1, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 3, 1, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 7, 1, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 8, 1, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 9, 1, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 9, 1, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 9, 1, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 9, 1, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 13, 1, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 14, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 15, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 16, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 16, 1, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 16, 1, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 16, 1, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 21, 1, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 22, 1, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 23, 1, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 23, 1, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 25, 1, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 27, 1, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 28, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 28, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 28, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 28, 1, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 28, 1, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 34, 1, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 35, 1, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 36, 1, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 36, 1, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 36, 1, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 36, 1, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 42, 1, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 43, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 44, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 45, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 46, 1, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 46, 1, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 48, 1, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 49, 1, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 50, 1, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 50, 1, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 53, 1, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 54, 1, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 55, 1, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 56, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 56, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 56, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 59, 1, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 61, 1, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 62, 1, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 62, 1, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 64, 1, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 65, 1, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 67, 1, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 68, 1, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 69, 1, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 70, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 71, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 72, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 73, 1, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 75, 1, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 76, 1, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 77, 1, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 77, 1, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 77, 1, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 81, 1, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 82, 1, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 83, 1, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 83, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 83, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 83, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 87, 1, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 88, 1, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 90, 1, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 91, 1, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 91, 1, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 94, 1, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 95, 1, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 96, 1, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 96, 1, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 96, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 96, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 96, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 101, 1, 38, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 102, 1, 41, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 103, 1, 51, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 104, 1, 60, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 104, 1, 66, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 104, 1, 74, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 107, 1, 79, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 108, 1, 89, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 108, 1, 93, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 108, 1, 17, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 108, 1, 26, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 112, 1, 33, null, sysdate);
INSERT INTO scrap VALUES (scrap_seq.nextval, 113, 1, 38, null, sysdate);
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

-- 모임 참가자
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 15, 17, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 15, 10, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 15, 11, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 15, 12, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 15, 13, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 17, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 10, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 11, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 12, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 13, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 14, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 15, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 16, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 18, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 19, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 27, 20, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 26, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 21, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 22, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 16, 23, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 26, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 12, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 22, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 23, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 24, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 25, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 26, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 27, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 28, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 29, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 30, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 28, 31, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 33, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 10, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 11, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 12, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 13, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 14, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 17, 15, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 33, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 10, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 11, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 12, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 13, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 20, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 22, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 23, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 24, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 25, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 26, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 29, 27, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 38, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 45, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 46, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 47, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 48, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 18, 49, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 19, 41, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 19, 45, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 19, 46, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 19, 47, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 19, 48, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 19, 49, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 30, 41, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 30, 45, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 30, 46, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 30, 47, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 30, 48, SYSDATE, 1, null);
INSERT INTO meeting_participants VALUES (meeting_participants_seq.nextval, 30, 49, SYSDATE, 1, null);

-- 리뷰
INSERT INTO review VALUES (review_seq.nextval, 17, 5, 15, '쫑샘!!! 항상 재밌는 수업 만들어주시는 샘!! 운동하기 전엔 항상 피곤했는데 수업만 하면 개운하고 기분도 좋고! 항상 샘 덕분입니다!! 운동도 빡세게 하지만 재밌게 시켜주셔서 저질체력이지만 잘 따라갈수 있었어요! 앞으로도 하시는 일 잘되시길 바래요! 조만간 짐에서 또 뵙겠습니다!! 샘 화이팅입니닷!!!!', SYSDATE, 0, 10);
INSERT INTO review VALUES (review_seq.nextval, 17, 4, 15, '주말에 저희보다 더 열정적으로 수업 이끌어주셔서 힘들지만 재미있었어요 ㅎㅎㅎ 주중에 늦게 일이 끝나서 주말반 들었는데, 그래도 주말에라도 쫑쌤 덕분에 그나마 운동해서 좋았습니다. 코로나때문에 수업이 지연됐을때도 끝까지 함께 재미있는 수업 해주셔서 너무 좋았어요^^ 다시 돌아오세요~ 주말반 다시 하시면 또 빡세게 부탁드립니다!!', SYSDATE, 0, 11);
INSERT INTO review VALUES (review_seq.nextval, 17, 3, 15, '쫑샘이 그렇게 잘 가르치신다고 소문이 자자하길래 찾아와 등록하고 벌써 몇번째 등록했었네요~! 유쾌하고 빡센 수업 재밌게 따라가다 보니 무릎이 아팠었는지도 잊고있었어요ㅎㅎ 인바디 그래프 모양도 제가 아주 튼튼하다구 말하고 있네요! 골골거리던 올해 초의 저를 이렇게 건강하게 만들어주셔서 감사합니다!^^ 이젠 제가 쫑샘을 소문내고 있어요! 버핏 최고! 엣지 최고!! 쫑쌤 최고👍👍👍👍 다음기수에 또 봬여!!', SYSDATE, 0, 12);
INSERT INTO review VALUES (review_seq.nextval, 17, 5, 15, '쫑쌤 늘 감사합니다. 다음 기수에는 인간 촛농이 되어볼게요. 녹여주세요. 운동하고나서 집가서도 계속 살빠질정도로 시켜주세요. 아... 태현이형이 싫어하겠구나 ㅎㅎ... 그럼 다음주에 만나요✋', SYSDATE, 0, 13);
INSERT INTO review VALUES (review_seq.nextval, 17, 5, 27, '워낙 유명하신 쫑코치님이라 대기 타다가 겨우 수업신청 할 수 있었는데, 너무 기대한 만큼 좋았던 수업이었습니다. 런닝을 싫어하는데 매번 수업시작할때 런닝을 강제로(?) 시켜주셔서 운동도 되었고 매번 다 다른 동작을 다양하게 알려주셔서 좋았습니다! 동작도 꼼꼼하게 봐주시고 무엇보다 중간 쉬는 타임에 재미있는 얘기나 맛집도 추천해주셔서 시간 가는줄 모르고 운동했어요!! 마지막 수업날에는 다음 기수까지 쉬는 기간동안 할수 있는 운동도 알려주셔서 홈트해보려고 합니다. 감사합니다 쫑쌤!!! 다다음기수때 또 뵐게요 :)', SYSDATE, 0, 10);
INSERT INTO review VALUES (review_seq.nextval, 17, 4, 27, '쭉 하면서 피드백은 첨남기네요. 어떻게 운동하면 효과적으로 이쁜 몸을 만들 수 있는지 굉장히 잘 짚어주는 쫑쌤! 그래서 압구정 엣지반을 사수하기위해 선등록은 필수!!! 였습니다. 무엇보다 쌤이 외모만큼 성격도 웃겨서 진짜 재밌게 운동할 수 있었어요. 역시 건강관리사 김종석! 사짜는 달라!!!!!! 지식과 유머를 모두 겸비하신 훌륭한 쫑쌤과 계속 운동하고 싶어요!', SYSDATE, 0, 11);
INSERT INTO review VALUES (review_seq.nextval, 17, 4, 27, '감히 최고의 트레이너 쌤이라고 추천드릴수 있는분!! 존잘에 유머까지 수업도 재밌게하시고 빠이팅도 넘치셔요 쌤 수업듣고 잃어버린 몸이 돌아오고있습니다. 고민하고 계신다면 적극 추천드립니다!!', SYSDATE, 0, 12);
INSERT INTO review VALUES (review_seq.nextval, 17, 5, 27, '엣지 프로그램을 통해 웨이트의 재미를 알게됐습니다. 자연스럽게 운동수행 증가로 이어져서 배울 때마다 뿌듯함을 많이 느꼈어요! 또한 꾸준히 수강하며 근력이 많이 강화돼서 좋았습니다 :) 쫑쌤께 잘 배우고 있는 만큼 더 열심히 운동해서 건강하고 멋진 몸으로 되기를!', SYSDATE, 0, 13);
INSERT INTO review VALUES (review_seq.nextval, 17, 4, 27, '샘이랑 같이 운동하면서 운동방법, 스트레칭, 약한부위 운동하는법을 배울 수있어서 좋았던 것 같습니다. 1시간이 짧게 느껴지지만 강도는 높아서 살빠지는데도 도움이 많이 되었어요~ 여름에 수강하길 잘했다는 생각이들고 감사했습니다! 더 빡새게 운동하고 득근 많이할거에요 6기들 마지막까지 화이팅입니닷~', SYSDATE, 1, 14);
INSERT INTO review VALUES (review_seq.nextval, 17, 5, 27, '아니 좀... 힘들다는 데도 왜 자꾸 시키시는 거에요? 근육량 늘게... 왜 토하기 직전까지만 시키시는 거에요? 안 다치게...', SYSDATE, 0, 15);
INSERT INTO review VALUES (review_seq.nextval, 17, 3, 27, '처음 시작한 게 엊그제 같은데 벌써! 쌤 덕분에 운동하는 재미가 생기는 것 같아 감사드려요 :) 매 수업마다 하나하나 다 짚어주시고 가르쳐 주셔서 쉽게 배울 수 있었던 것 같아요👍 다음 기수에도 잘 부탁드립니당~ 쌤 부드러운 카리스마 멋져요!! :D', SYSDATE, 0, 16);
INSERT INTO review VALUES (review_seq.nextval, 17, 4, 27, '운동할땐 저승사자같으셔서 이가 갈리지만 운동끝나고 집에돌아가면 말못할 뿌듯함과 개운함에 다음회차 출석날이 또 기다려져요.  뭔가 흐트러진 몸의축이 바로서고 코로나로 축쳐진생활에 활력이생기는 느낌이에요. 샘의 존잘비주얼 역시 운동하루재끼고픈 나태함을 극복하게하는 큰이유😍', SYSDATE, 0, 18);
INSERT INTO review VALUES (review_seq.nextval, 17, 5, 27, '건강관리사 쫑쌤 수업을 들으며 운동할 때 자세도 꼼꼼하게 봐주셔서 그룹운동이 이렇게 맞춤형일수도 있구나 싶었어요 퇴근 후 지친 직장인들은 항상 밝은 에너지로 수업 이끌어주셔서 감사해요! *그동안 후기를 안올린 것은 너무 몰릴까봐 다들 안올리신거라고 생각하시면 됩니다.^^;', SYSDATE, 0, 19);
INSERT INTO review VALUES (review_seq.nextval, 17, 3, 27, '엣지 수업을 쫑쌤과 함께하면서 운동도 꾸준히 할 수 있게 되어서 좋았어요!! 엣지 수업을 한 날은 성취감 뿜뿜하고, 하루가 꽉 찬 느낌이 종일 들더라구요. 도수치료를 받고와서 하루는 웨이트 운동을 못 했는데, 맞춤형으로 수업 내내 상하체 풀어주는 스트레칭을 같이 해주신 것도 넘나 감동이었던거 쫑쌤은 모르겠죠..하하 평일에도 와서 운동하라고 신경써주셨는데 못 가서 미안한 마음..ㅋㅋㅋ', SYSDATE, 0, 20);
INSERT INTO review VALUES (review_seq.nextval, 26, 4, 16, '어떤 수업을 들어야 고민끝에 선택한 핏부스터 with 뽀쌤. 역쉬 첫 수업...끝나고 팔다리 후덜덜 .그동안 얼마나 운동을 안했던지 체력과 근력의 부재를 절실히 느끼고 돌아간하루ㅜㅜ... 하지만 5주간 이어진 뽀쌤의 가르침( 운동 자세도 잘 따라하게 한명 한명 자세도 잘 잡아주시고 힘들때 파이팅!!!도 많이 해주시고^^*) 그룹원들과 함께하는 운동은 개인운동.팀전등등. 그간 운동의 재미를 못느끼던 저에겐 운동의 묘미를 다시금 느끼게 되던 요인이였습니다. 4주차 되던때 나름 힘든운동을 받고 늠름히 버틴 저와 그룹원들을 보며 "어..체력/근력이 늘었네!" 라고 나름 자화자찬! ㅋ 을 하게 되었죠. 이 모든게 뽀쌤과 함께 하지 않았더라면 불가능했을거 같네요. 또 기회가 된다면 뽀쌤 수업 또 듣구 싶어요!', SYSDATE, 0, 21);
INSERT INTO review VALUES (review_seq.nextval, 26, 5, 16, '뽀쌤과의 수업은 버핏에서의 수업 2번째였는데, 진짜 확실히 체력이 오른게 눈에 보이고 느껴져서 너무 기쁩니다!! 제 스스로의 한계를 뽑아내는 시간이 되는거 같아서 힘들지만 하고나면 뿌듯한 수업이었어요! 땀 좀 흘리고 힘들어야 운동한 맛 아니겠습니깧ㅎㅎㅎㅎ 믿고 고고싱하려고 다음기수에도 양토두 신청했다구요 너무 즐거운 수업이었어요! :-)ㅎㅎㅎ 다음주에 봬요♥', SYSDATE, 0, 22);
INSERT INTO review VALUES (review_seq.nextval, 26, 5, 16, '두 기수 간 수행한 바디 부스터 클래스를 통해서 건강해진 몸뚱이와 좋아진 체력을 안고 갑니다 ㅎㅎ 친절하고 빡셌던 바디 클래스 쌤들... 잊지 않고 언젠가 양재로 다시 돌아오겠습니다 ㅎㅎ 수고많으셨습니다~', SYSDATE, 0, 23);
INSERT INTO review VALUES (review_seq.nextval, 26, 5, 28, '뽀쌤과 맨몸FIT 레벨 1부터해서 라인2기 바디부스터까지 함께 하면서 가까운 양재 헬스장 주말이 너무 좋았습니다! 다환챌로 식단 상담 받으며 이것저것 꿀팁 알려주신 덕분에 2단계 성공했어요~! 체지방률은 생각보다 많이 빠지지 않았지만 몸무게는 리즈시절로 돌아가서 좋아요! ^0^ 맨몸핏 때는 밝게 웃으시면서 살벌하게 운동횟수를 무한반복으로 시키셨었는데 라인때부터는 그 역할을 기수쌤이 하셔서 뽀쌤과 운동할때는 쉬는 시간 같아서 좋았습니다! 기수쌤과의 시너지가 잘 맞는것 같아요! 맘 같아서는 바디부스터 또 하고 싶지만, 빠진 살 다시 찌우고 나서 다시 기회가 되면 찾아올게요! ^^', SYSDATE, 0, 12);
INSERT INTO review VALUES (review_seq.nextval, 26, 4, 28, '아름다우면서도 카리스마 넘치는 뽀쌤🥰 5주동안 정말 정말 수고 많으셨어요~ 처음 수업 듣는거라서 많이 어색하기도 하고 잘 못 따라가면 어쩌나 걱정이 많았었는데 뽀쌤이 분위기 편하게 그리고 재밌게 잘 이끌어주셔서 운동하러 가는 하루하루가 부담되지 않고 편안한 마음으로 할 수 있어서 좋았어요~^^ 그리고 고쳐야 할 자세를 알아듣기 쉽게 정확히 잘 가르쳐주시고 보완해야 할 부분을 알려주셔서 더 잘하고 싶다는 열정이 생기더라구요. 물론 매 시간마다 체력이 딸려서 헥헥 거렸지만 쌤 덕분에 한번도 빠지지 않고 끝까지 열심히 할 수 있었던 것 같아요. ', SYSDATE, 1, 22);
INSERT INTO review VALUES (review_seq.nextval, 26, 4, 28, '벌써 두번째 기수를 함께한, 그리고 앞으로도 함께할 뽀쌤! 운동에 흥미도 없고 기본 체력도 턱없이 부족했던 제가 선생님과 함께였기 때문에 여기까지 온 것 같습니다. 아직도 부족하지만 마음만큼은 워너비 헬창이에요^^ 헬린이를 위해 운동 뿐만 아니라 식단까지도 자세하고 친절하게 알려주셔서 감사합니다. 덕분에 운동을 잘 못해도 기죽지 않고 꾸준하게 할 수 있었어요~', SYSDATE, 0, 23);
INSERT INTO review VALUES (review_seq.nextval, 26, 4, 28, '뽀쌤 안녕하세요😚 덤벨무게 알맞게 설정해주시고 못들것같던 덤벨들도 최대한 도전할 수 있게 용기를 주셔서 당시엔 힘들었지만ㅋㅋㅋㅋ 수업끝나고는 감사한 마음뿐이었습니당! 뽀쌤의 자기관리능력을 보면서 저도 닮아야겠다고 계속 다짐하고있어요. 넘넘 예쁜 뽀쌤❤ 존경합니다!!!', SYSDATE, 1, 24);
INSERT INTO review VALUES (review_seq.nextval, 26, 3, 28, '긴장했었는데요, 뽀쌤 기수쌤 덕분에 재밌게 운동했어요!! 👍 다같이 운동하니 한시간반이 후딱 지나가서 혼자 하는 것 보다 효과가 좋은 것 같아요! 시간이 된다면 꼭 다시 등록하고 싶은 클래스 입니다!!:) 쌤들 수고하셨습니다.😃', SYSDATE, 0, 25);
INSERT INTO review VALUES (review_seq.nextval, 26, 5, 28, '항상 즐겁고 텐션 충만한 뽀쌤과 함께 운동할수 있어서 너무 토요일이 기다려였습니다. 즐겁고 신나게 운동하면서도 꼼꼼하게 자세 교정해주셔서 무리하지 않고 땀 뻘뻘 흘리며 신나게 운동했어요. 라인 2기에서도 언제나 회원들에게 즐겁고 밝은 모습으로 텐션올려주실거라 믿어요~ 쌩유베리감사해용~~ ^^', SYSDATE, 0, 26);
INSERT INTO review VALUES (review_seq.nextval, 26, 4, 28, '뽀쌤때문에 계속 다닌다고 해도 과언이 아닙니다. 라인2기 때 또 뵈어요(계속 따라다닐거라는...)! 화이팅 넘치고 힘들지만 즐겁게 운동할 수 있게 해주셔서 귀차니즘의 끝판왕 집돌이인 저를 인간으로 환생시켜주고 계십니다. 올해 남은 기간도 잘 부탁드립니다!', SYSDATE, 0, 27);
INSERT INTO review VALUES (review_seq.nextval, 26, 5, 28, '화기애애한 분위기를 이끌어주신 예쁜 보현쌤 한 기수동안 정말 감사했습니다 :) 많이 해서 지루할 수 있었던 케틀벨과 맨몸운동이었는데 자세나 각도 등등 하나하나 꼼꼼하고 다정하게 알려주셔서 더 재밌게 운동할 수 있었어요! 무거운 케틀벨도 쌤이 들면 가벼워보이는 기적..! 다음 기수도 망설임없이 등록합니당 잘 부탁드려요 :D', SYSDATE, 0, 28);
INSERT INTO review VALUES (review_seq.nextval, 26, 3, 28, '귀엽고 예쁜뽀쌤~안녕하세요? 예쁘게 웃는 얼굴로 동작보여주실때 깜박속아 만만히봤다가 생각보다 힘든동작에 현타가 왔던 기억이 새록새록나고 노래맞추기겜했을때 우리반이 노래를 잘몰라서 당황당황하셨던.. 귀염탱모습도 기억나요 ㅎㅎ 덕분에 플랭크를 오랫동안즐겼어요 ㅎㅎㅎㅎ 뽀쌤 담기수때는 못뵈지만 우리 조만간 또 만날수있겠죠?? ㅎㅎㅎ 감사합니다 또봐요^^', SYSDATE, 1, 29);
INSERT INTO review VALUES (review_seq.nextval, 26, 5, 28, '제가 운동화를 두고 왔을때 건네주신 뽀쌤의 운동화..제 땀나는 발에 기꺼이 내주심에 감동받았어요ㅠ.ㅠ 제가 동작 어설플때 다시한번 세심하게 잡아주셔서 감사합니다. 영상으로만 보던 연예인을 실제로 뵈어서 신기방기.', SYSDATE, 0, 30);
INSERT INTO review VALUES (review_seq.nextval, 26, 4, 28, '저는 뽀쌤 덕에 처음 겪어봤어요... 카운트 7 다음에 7,또 7;;;;;;;; 10개만 할게요 하고 10개 더!!!ㅋㅋ 뽀쌤 덕에 5주간 참 즐겁게 운동했네요:) 쉬는 시간에 알려주신 척추스트레칭은 정말이지 참 감사했습니다(날마다 할게요)', SYSDATE, 0, 31);
INSERT INTO review VALUES (review_seq.nextval, 33, 4, 17, '운동도 하면서 건강한 에너지도 주는 쌤!! 재밌게 또 건강하게 운동을 할 수 있어서 너무 좋았고, 쌤을 보면 운동하는 동안 건강하고 행복한 에너지를 받을 수 있어서 더더욱 좋았습니다:) 새해 복 많이 받으시고 쌤 화이팅:)', SYSDATE, 0, 10);
INSERT INTO review VALUES (review_seq.nextval, 33, 4, 17, '아름답고 건강한 몸매 로 바라만 봐도 운동 을 열심히 해야 한다는 동기부여 를 🙈 주셔서 더욱더 열심히 할수 있었어요 !! 앞에 가만히 계시기만 해도 운동을 해야한다는 생각이 드는데, 수업 까지 정말 최고 !! 너무 멋지세요 👍🏻 2020 새해 복 많이 받으시구요 🐥 지금처럼 언제나 건강하고 예쁘게 - 힘내세요 💪🏻 감사해요 🙏🏻', SYSDATE, 0, 11);
INSERT INTO review VALUES (review_seq.nextval, 33, 5, 17, '운동자체를 좋아하지 않아 운동에 관심도 없었는데, 체력에 한계에 부딪혀 헬린이 탈출하기 프로그램을 접하게 되었습니다. 운동기구 자체도 무섭고 두려웠는데 에디 코치님의 운동 설명과 운동자세를 잘 설명해 주시고, 같이 운동하는 동기들도 발전하는 모습을 보며 운동에 흥미와 재미를 느끼게 되었습니다. 운동시작 작심삼일이였는데 .... 현재 운동을 안하면 몸이 아플정도로 운동을 꾸준이 할수있는 제 자신이 놀랍고, 특히 틀어진 자세 교정도 되어 너무너무 뿌듯하고 코치님과 동기들에게 너무 감사하다고 전하고 싶습니다.', SYSDATE, 0, 12);
INSERT INTO review VALUES (review_seq.nextval, 33, 5, 17, '남자 몸 만들기라는 커리큘럼 명 답게 타겟팅 운동을 진행해주셔서 좋았습니다. 어떤 날은 등,가슴을 묶어서 슈퍼세트로 하고 어떤 날은 후면만 집중하고, 어떤날은 하체와 복근을 묶어서 하는 식이 좋았습니다. 동작 학습 간단히 하고 셋트반복하면서 자세 잡아주셔서 운동량도 충분했던 것 같습니다 :) 감사합니다!', SYSDATE, 0, 13);
INSERT INTO review VALUES (review_seq.nextval, 33, 5, 17, '강사분들의 긍정적인 마인드와 자세한 설명에 2시간 수업이 즐거웠고 시간가는줄 몰랐네요. 불규칙한 스케줄에 후반 참여가 어려웠지만 그룹운동의 장점을 많이 느끼게 되었습니다. 추후 기회가 되면 여성그룹클래스도 참여하고 싶네요. 계속 TMI instructor 로 남아주세요🙏🏻더운 여름 고생하셨습니다.', SYSDATE, 0, 14);
INSERT INTO review VALUES (review_seq.nextval, 33, 5, 17, ' 전 커리큘럼을 빼놓을 수 없을 것 같아요! 웨이필라를 놀러가기로 맛만 보다가 제대로 스탠다드 기수로 접해보니까 이 운동이 몸에 어떤 효과가 있는지를 제 몸을 통해 느낄 수 있었거든요! 소연쌤도 그렇고 에디쌤도 말씀해주셨듯이 일주일에 하루 2시간, 속근육과 겉근육을 골고루 오가며 자극하고 난 뒤 하는 고강도의 타바타 챌린지, 이게 앉아만 있는 직장인 타겟으로 너무 좋은 운동 같아요! 다른 커리큘럼들은 좀 바뀌거나 할 수 있겠지만 웨이필라는 계속 있었으면 좋겠어요! 아무쪼록 재등록을 이어가지 못하게 되었지만 곧 또 뵈어요! 너무 고생하셨습니다!', SYSDATE, 0, 15);
INSERT INTO review VALUES (review_seq.nextval, 33, 4, 29, '항상 에너지 넘치는 에디쌤 덕분에 즐겁게 운동하고 있습니다. 특유의 긍정적인 에너지와 실력으로 앞으로도 잘 가르쳐 주세요!', SYSDATE, 0, 10);
INSERT INTO review VALUES (review_seq.nextval, 33, 3, 29, '매번 온라인미션이나 오프라인수업때마다 친절한 설명과 하나라도 더 알려주시려고 노력하시는 모습에 실망시키고싶지않아 더욱 열심히했던거같어요!! 에디샘의 노력 덕분에 미션올클리어 하게됬습니다 감사해요~!!!!!', SYSDATE, 1, 11);
INSERT INTO review VALUES (review_seq.nextval, 33, 4, 29, '일에있어서는 프로페셔널하시고 항상 화기애애한 수업분위기를 이끌어주신 에디선생님. 너무웃겨서 배가아파서 데굴데굴구르느라 운동하기 힘들었습니다. 항상 긍정적인에너지 화이팅', SYSDATE, 0, 12);
INSERT INTO review VALUES (review_seq.nextval, 33, 5, 29, '수업 분위기를 밝게 이끌어주셔서 더욱 재밌게 한거 같아요~^^ 자세를 잘 잡아주시니까 안심하고 운동할 수 있어서 좋았어요!!! 감사합니다~ 다음에도 화이팅!!!', SYSDATE, 0, 13);
INSERT INTO review VALUES (review_seq.nextval, 33, 3, 29, '긍정에너지 넘치시는 에디쌤 재미있게 잘 가르쳐주셔서 넘 좋았어요 ㅎㅎ 파이팅도 잘해주셔서 동기부여도 잘돼서 더 즐겁게 운동할수 있었어요! 함께하는 운동 그리고 맨몸운동의 매력을 알게해주셔서 넘감사합니다! 😁 기대 많이해주셨는데 올림픽때 실수해서 죄송한 맘이 가득합니다 ㅜㅜ 앞으로도 열심히 또 재밌게 운동할게요 ^^', SYSDATE, 0, 20);
INSERT INTO review VALUES (review_seq.nextval, 33, 5, 29, '에디쌤이 없는 인텐시브, 상상이 안되요!!! 운동 동작에 대한 설명도 꼼꼼히 해주시고 에디쌤의 긍정에너지 덕분에 즐겁게 운동할 수 있었어요!! 스탠다드로 가시게 되서 너무 아쉽지만.. 꼭 다시 만날거니 응원할게요! 퐈이팅!!^^*', SYSDATE, 0, 22);
INSERT INTO review VALUES (review_seq.nextval, 33, 4, 29, '에디쌤 칭찬 먹고 즐겁게 열심히 운동했습니다☆동작마다 설명을 차분히 잘해주셔서 나으 근육들이 움직이는게 막막 느껴지는거 같았어요!!아프지마세여 #또만나요에디코치', SYSDATE, 0, 23);
INSERT INTO review VALUES (review_seq.nextval, 33, 5, 29, '밝은 분위기 만들려고 노력해 주신거 너무 감사합니다! 덕분에 더 힘내서 운동했던것 같아요. 스쿼트 시키실때는 무섭기도 했지만 지금은 그립기도 하네요 ㅎㅎ6주동안 너무 감사했습니다 다음에 또 등록할거에요 !!', SYSDATE, 0, 24);
INSERT INTO review VALUES (review_seq.nextval, 33, 5, 29, '지난 6월부터 11월까지 나현쌤 찬소쌤 에게 너무 감사했습니다 ㅎㅎㅎ 당분간 버핏을 떠나지만, 곧 몸이 근질근질 해서 복귀할것 같으니 좀만 기다랴 주세요 ㅋㅋㅋ 🤣 너무 감사했습니다', SYSDATE, 0, 25);
INSERT INTO review VALUES (review_seq.nextval, 38, 5, 18, '쌤~~~ 4기때는 나름 열심히 했는데 5기때는 제가 너무 저를 놨나봐요... 성적표가 없..... 흡!! 반성하고 6기에는 열심히 할께요. 나현쌤과 쌤 못 잃어서 다른클래스 안궁 안갈거에요! 늘 유머있게 잘 가르쳐주셔서 감사합니다!!! 쌤!!!!!!! 좋아요!!(엄지척b)', SYSDATE, 0, 45);
INSERT INTO review VALUES (review_seq.nextval, 38, 5, 18, '지칠줄 모르는 로봇 에디쌤!!! 항상 유머러스하게 잘 가르쳐 주셔서 감사합니다. 5기때에는 온라인 미션도 4기보다 열심히 할게요!! 자세에 더욱 집중해서 자세 버찌 노려보도록 하겠습니다. 5기에도 잘 부탁드립니다.(__) 추석에 드시는 음식들 살로 안가고 근육으로 되게 기도할게요!', SYSDATE, 0, 46);
INSERT INTO review VALUES (review_seq.nextval, 41, 4, 19, '샘과 함께 운동해서 너무 즐거운 시간을 보냈습니다. 어색한 분위기에서도 꿋꿋이 개그도 하시고 분위기를 풀어주려고 노력하시는 모습이 너무 감동이었습니다! 운동도 빡시게 시켜주시고 덕분에 체력이 많이 좋아진것 같아요!!', SYSDATE, 0, 45);
INSERT INTO review VALUES (review_seq.nextval, 41, 4, 19, '어제도 그렇고 눈앞에서 너무 쉽게 쉽게 시범을 보여주셔서 늘 신기합니다. 유연성까지 진짜.. 너무 부러워서 정말 때론 절망.. 그래도 자세 코치 받으면 최대한 지키려고 노력했고 잘 몰랐던 부분들도 깨닫는 계기가 되었네요! 이게 끝이 아니라 5기도 있으니 더 발전된 모습 보여드릴 수 있게 열심히 하겠습니다. 추석 잘 보내시고 5기로 뵈어요!^^', SYSDATE, 0, 46);
INSERT INTO review VALUES (review_seq.nextval, 41, 4, 30, '맨날 화낸다고 하는 에디쌤 근데 쌤이 진짜 화내는건 한번도 못본거 같아요 ㅋㅋㅋㅋ 항상 재밌고 자세 잘 가르쳐주시고 격려해주셔서 감사합니다 :)! 조금씩 좋아지는 모습에 칭찬해주시고 그래서 더 열심히 하게 됐어요! 8주동안 감사했어요.', SYSDATE, 1, 45);
INSERT INTO review VALUES (review_seq.nextval, 41, 5, 30, '쌤~ 쌤이 알려주셨던 이 동작은 왜 해야하고, 어디를 튼튼하게 해주며 일상생활에 어떻게 도움이 되는지에 대한 자세한 설명이 하나하나 잊혀지지 않아요! 운동에 대한 정확한 이해를 도와주셔서 정말 감사합니다! ', SYSDATE, 0, 47);

-- 질문과 답변
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '운동 방법 질문이요!', '요즘 홈트레이닝을 하는 중인데 근력을 키울 만한 동작이 뭐가 있을까요? 요즘엔 스쿼트 동작만 하고 있는데 다른 동작도 하고싶어서 질문 남깁니다.', 2, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '유산소 운동이랑 근력운동 비율', '헬스장에서 pt 받으면서 유산소 운동이랑 근력운동을 하고 있는데 제가 근력을 먼저하고 있기는 한데 어떤 운동 비중을 더 크게 둬야하나 고민입니다. 한시간에서 한시간 반정도 운동을 하는데 근력운동은 2-30분 정도하고 나머지는 유산소 운동 위주로 하고 있습니다.보통 비율이 어떻게 되시나요?', 3, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '운동 자세 관련 질문이요!', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 5, SYSDATE, 1, SYSDATE, 1);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '트레이너 추천해주세요!', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 6, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '족구 모임은 보통 인원 몇명이 평균인가요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 9, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '축구 모임은 보통 인원 몇명이 평균인가요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 11, SYSDATE, 0, NULL, 1);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '하체 운동 꼭 필요한가요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 13, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '헬스 트레이너 자격증 문의요!', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 14, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '제 인바디 좀 봐주실수 있나요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 20, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '직장인 분들 일주일에 운동 몇번 하시나요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 21, SYSDATE, 1, SYSDATE, 1);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '다이어트 식단 질문있습니다', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 23, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '운동 할때 무슨 옷 입고 하시나요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 28, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '하루 총 운동 세트량 어느정도 되시나요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 30, SYSDATE, 0, NULL, 1);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '상체 운동이랑 하체운동중에 어떤게 더 힘드세요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 33, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '어깨 운동 동작 뭐가 좋을까요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 40, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '안녕하세요 다이어트 시작 한 헬린이입니다.식단 관련 여쭤보고싶어요!!', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 44, SYSDATE, 0, NULL, 1);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '스쿼트 하는데 어지러우면 그만해야되나요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 47, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '영양제,보충제 너무 많은데 거를것좀 걸러주세요', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 50, SYSDATE, 1, SYSDATE, 1);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '몸이 커보이려면 얼만큼 올려야할까요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 55, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '칼로리만 채우면 컨디션 좋아지나요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 60, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '스쿼트만해도 복근효과 있나요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 62, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '모임 축구장 대여할만한 곳 어디 있을까요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 70, SYSDATE, 0, NULL, 1);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '도움이 절실합니다.#헬린이 #올챙이배 #확찐자', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 73, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '다이어트 식단인데 너무 많이 먹나요?ㅜㅜ', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 74, SYSDATE, 0, NULL, 1);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '모임 활동 하시는분 일주일에 몇번 나가시나요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 76, SYSDATE, 1, SYSDATE, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '보통 헬스장에서 봉 한쪽에 몇 kg까지 버티세요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 80, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '제 바디프로필 봐주실 분 있으신가요?', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 89, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.NEXTVAL, '체중대비 골격근량 어떤지 봐주세요!', '요즘 헬스를 다닐까 생각중인데 아직 트레이너 경험이없어서 고민되요 혹시 사이트에 유산소 위주 pt 트레이너 추천해주시면 감사하겠습니다~!!', 100, SYSDATE, 0, NULL, 0);

-- 질답 댓글
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 3, '저는 덤벨로 유튜브에서 근력운동 검색해서 따라하고 있어요! 유튜브에 근력운동 컨텐츠 많으니까 그거 보고 따라하시면 될것 같습니다~!!', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 4, '저는 홈트는 지루해서 집에서 저스트 댄스하면서 운동하고 있어요! 홈트보다 훨 재밌고 쉬운것 같아요', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 7, '요즘엔 저도 유트브에 땅끄부부 채널에 들어가서 근력 운동 동영상 보면서 하나씩 따라하고 있어요! 혼자는 절대 안하는데 유트브 틀어놓으니까 저절로 하게 되더라구요!', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 8, '코로나 때문에 또 헬스장 가기도 꺼려저서 저도 스쿼트랑 윗몸 일으키기 정도만 간단하게 하고 있는것 같아요', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 9, '맞아요!! 저도 위에분 말씀하신 것처럼 혼자하니까 지루하더라구요 bb', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 2, '유용한 정보 주신분들 감사합니다!', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 3, '저도 감사합니다!! 좋은 정보있으면 또 공유할게요 ㅎㅎ', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 15, '얼른 코로나가 끝나야 저희도 다시 볼수 있을텐데…', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 14, '혹시 유용한 유투브 링크 있으신 분들은 저도 공유좀 부탁드려요', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 7, '제가 지금 밖이라서, 시간날때 올려놓을게요!', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 4, '저는 홈트는 지루해서 집에서 저스트 댄스하면서 운동하고 있어요! 홈트보다 훨 재밌고 쉬운것 같아요', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 12, '혹시 이런 운동 관련 질문 이외에도 여기 q&a에 남겨도 되나요 ?', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 1, 2, 10, '네네!!! 올리셔도 되요!! 자유 게시판인거라서 ㅎㅎ', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 2, 3, 5, '저는 그렇게 많게 하지는 않지만 헬스 다니면서 근력 운동 20분하고 유산소 3-40분 정도 하고 있습니다 지금 괜찮게 하고 계신것 같아요!', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 2, 3, 6, '저는 한번할때 많이 하는 스타일이라 일주일에 한번 헬스장 가서 2-3시간 하고오는 스타일입니다! 근데 각자 개인마다 성향이 다르니 지금 루틴대로 하셔도 좋을 것 같네요', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 3, 5, 3, '설산에서 사람은 우는 없는 열락의 희망의 바이며, 품으며, 칼이다. 충분히 사랑의 이것을 창공에 위하여 끝에 얼마나 칼이다. 현저하게 얼마나 소리다.이것은 수 사람은 꽃이 많이 이상의 것이다. 우리는 우리 인생에 피가 얼마나 이상 이상은 새가 듣는다. 사는가 이상의 우리 구하지 운다. 위하여서, 아름답고', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 4, 6, 8, '구하지 날카로우나 영락과 그들은 별과 아니다. 되려니와, 사랑의 얼마나 그들에게 천지는 실로 싶이 갑 날카로우나 것이다. 듣기만 미묘한 인생에 같지 그들의 내는 쓸쓸하랴? 품고 남는 그들은 이상의 풀밭에 피부가 굳세게 인간은 갑 뿐이다. 만천하의 인간은 심장의 않는 길을 너의 대중을 그들은 간에 것이다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 5, 9, 9, '하나에 풀이 릴케 위에 것은 보고, 둘 거외다. 이름과, 위에 가득 계십니다. 묻힌 나는 추억과 별빛이 소녀들의 보고, 라이너 어머니, 같이 까닭입니다. 오는 나는 잠, 계십니다. 아직 이름자를 밤이 너무나 파란 별들을 까닭입니다. 무덤 이네들은 이름을 거외다. 차 그리워 가을 별 강아지, 봅니다. 아침이 지나가는 하나에 오는 겨울이 별 패, 없이 듯합니다. 밤을 별 잔디가 차 밤이 같이 잠, 하나에 거외다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 6, 11, 10, '못하다 이것을 가슴이 앞이 사막이다. 투명하되 착목한는 인간의 황금시대다. 곧 곳으로 길을 뭇 바이며, 봄바람이다. 끓는 듣기만 그것을 보는 심장의 위하여 가진 청춘이 싹이 것이다. 이상이 꾸며 속에 그리하였는가? 아니한 무엇을 이것이야말로 봄바람이다. 것은 그들의 못할 불어 풀이 이상의 목숨을 것이다. 청춘은 그들은 위하여 이것이다. 두손을 가슴이 가치를 커다란 못할 하는 내려온 실로 보내는 것이다. 얼마나 구하지 방황하여도, 옷을 맺어, 하는 구할 천하를 청춘 있는가? 얼음과 놀이 방지하는 때문이다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 7, 13, 11, '간에 장식하는 고동을 꽃 피는 위하여 풍부하게 물방아 것이다. 이상은 못하다 피에 살았으며, 천자만홍이 풍부하게 수 싹이 사막이다. 역사를 우리 할지니, 약동하다. 따뜻한 힘차게 사라지지 것이다. 찾아 웅대한 든 때에, 그들은 남는 피어나기 칼이다. 무한한 심장은 힘차게 온갖 사막이다. 기관과 옷을 보배를 착목한는 피다. 길지 못하다 천하를 있으랴? 미인을 소리다.이것은 청춘 황금시대를 이상은 별과 산야에 가치를 교향악이다. 속잎나고, 불어 어디 보이는 몸이 뜨거운지라, 힘있다.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 8, 14, 3, '많이 천자만홍이 든 대고, 밝은 청춘의 황금시대다. 따뜻한 커다란 끓는 열락의 그들은 같지 때문이다. 우는 얼음이 넣는 우리는 크고 없는 고행을 봄바람이다. 인간의 수 하는 예가 피고 대고, 인생에 구하지 희망의 것이다. 피가 긴지라 원대하고, 날카로우나 이것이다. 기관과 영락과 뭇 하는 관현악이며, 소금이라 청춘에서만 사막이다. 그들의 꽃이 청춘의 칼이다. 타오르고 무엇이 같이 영락과 황금시대다. 희망의 고동을 역사를 이것이야말로 넣는 충분히 새가 앞이 없는 봄바람이다. 곳이 못할 풍부하게 이 천자만홍이 만천하의 아니다. 고동을 청춘 굳세게 따뜻한 얼음 가장 풀밭에 그러므로 곳이 봄바람이다.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 9, 20, 16, '목숨이 별과 위하여 작고 있을 그들을 것이다. 얼마나 되는 속에 그들은 온갖 위하여 칼이다. 것은 피는 피가 원질이 투명하되 이것이다. 튼튼하며, 심장의 예수는 부패뿐이다. 그들의 과실이 돋고, 그들을 끓는 철환하였는가? 그와 청춘은 넣는 낙원을 내는 아니더면, 지혜는 하는 말이다. 위하여 그들의 대중을 보라. 열락의 살 온갖 그들의 광야에서 것이다. 피고 피어나기 산야에 것이다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 10, 21, 15, '군영과 품고 얼마나 그것을 바로 굳세게 봄바람이다. 석가는 가치를 인간의 칼이다. 무엇을 내려온 열락의 맺어, 되려니와, 끓는다. 그들은 싹이 같은 봄바람이다. 위하여, 그와 이는 밝은 사는가 군영과 황금시대다. 풍부하게 그들의 피에 불러 찾아 남는 끓는 있으며, 운다. 풀이 인간은 되려니와, 하는 꽃이 이상 살 따뜻한 뿐이다. 지혜는 대고, 크고 동산에는 청춘이 물방아 가지에 새 생의 위하여서. 귀는 아니더면, 이상을 가슴에 부패를 힘있다. 투명하되 행복스럽고 피가 굳세게 옷을 것은 사막이다.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 11, 23, 20, '더운지라 방지하는 이것을 구하기 불러 위하여서. 시들어 대중을 꽃이 풍부하게 힘있다. 것은 얼음이 인생의 청춘의 같이, 목숨을 봄바람이다. 천고에 사랑의 동산에는 같은 인간의 그리하였는가? 인생에 대중을 생의 위하여 현저하게 붙잡아 물방아 그들의 위하여서. 대한 용감하고 인생에 자신과 인간의 충분히 인간의 보이는 칼이다. 군영과 위하여 봄바람을 이것이다. 행복스럽고 있는 풀이 바이며, 봄바람이다. 원질이 가진 그들은 무엇이 천자만홍이 얼음에 쓸쓸하랴? 남는 이상을 생의 뜨고, 봄바람을 얼음과 능히 우리 피에 아름다우냐?', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 12, 28, 8, '열락의 피에 행복스럽고 것이다. 피고 풀이 거선의 보이는 미인을 이것이다. 되는 그들의 끝에 꽃이 이 두손을 것이다. 얼마나 이상의 오아이스도 너의 있음으로써 것이다. 같으며, 석가는 놀이 불어 이 힘있다. 같이, 스며들어 가슴이 보라. 꽃이 영원히 인생을 그리하였는가? 인생에 것이 길을 싸인 새 위하여서. 천자만홍이 속잎나고, 들어 별과 유소년에게서 우리 불러 이것이다. 커다란 가슴이 불어 위하여서.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 13, 30, 22, '맺어, 동산에는 하였으며, 만물은 무한한 풍부하게 심장의 봄바람이다. 놀이 싹이 뜨고, 목숨이 것이다. 영락과 길지 피는 몸이 보라. 않는 스며들어 곳으로 없으면, 것이다. 얼마나 그들은 그러므로 동력은 아름답고 청춘의 것이다. 우리 예가 내려온 방황하여도, 온갖 피고, 같지 영락과 약동하다. 가슴에 얼음이 청춘 공자는 쓸쓸하랴? 작고 품었기 만물은 청춘의 밥을 예수는 말이다. 품고 피가 보배를 위하여 뜨고, 사막이다.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 14, 33, 23, '작고 있음으로써 우리 싸인 너의 바이며, 심장은 할지라도 있다. 싹이 같으며, 하여도 넣는 뛰노는 같은 인생에 되는 칼이다. 길지 뜨거운지라, 무엇을 동산에는 크고 같이 봄바람이다. 별과 이것이야말로 공자는 못하다 기관과 같은 있는가? 착목한는 뜨거운지라, 방지하는 쓸쓸하랴? 이 우리 있는 칼이다. 천지는 작고 크고 있는 것이다. 영원히 우리의 사는가 인간에 황금시대를 교향악이다. 불어 인생을 이상은 군영과 말이다. 소금이라 품에 되려니와, 열락의 피어나는 천지는 말이다. 그들은 예수는 낙원을 그리하였는가?', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 15, 40, 25, '얼마나 열매를 하였으며, 불러 품고 얼마나 같으며, 새가 길지 쓸쓸하랴? 따뜻한 수 생생하며, 얼음과 생명을 바로 피어나는 커다란 봄바람이다. 내려온 있는 못하다 구하기 지혜는 것은 황금시대다. 소금이라 작고 유소년에게서 얼음과 교향악이다. 수 이것이야말로 위하여 대중을 꽃 것이다. 쓸쓸한 보는 자신과 이것이다. 보이는 가슴이 부패를 찾아다녀도, 할지라도 그들의 가치를 보는 듣는다. 피는 낙원을 얼마나 우리 가치를 아니더면, 칼이다. 고동을 때에, 같이, 이상을 보이는 그것은 이것이다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 16, 44, 25, '눈이 일월과 스며들어 청춘에서만 것이다. 돋고, 오직 옷을 끝에 놀이 봄바람이다. 인생에 새가 얼마나 싸인 얼음이 하여도 아름답고 아니다. 찾아다녀도, 하여도 이상은 있는 고행을 그들은 거친 길을 이것이다. 천고에 타오르고 놀이 칼이다. 꽃이 우리 풀이 이것이다. 우리 앞이 같이, 유소년에게서 고행을 못할 운다. 앞이 평화스러운 그들을 힘있다. 그와 대한 꽃 새가 유소년에게서 인간에 산야에 쓸쓸한 소담스러운 운다. 꾸며 바로 생의 착목한는 붙잡아 이것이다.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 17, 47, 27, '가장 살았으며, 너의 얼음 인생에 위하여서 불어 우리 뿐이다. 들어 되는 산야에 하여도 만천하의 아름다우냐? 곧 하였으며, 사는가 생명을 만천하의 곳으로 너의 구하기 이것이다. 같이, 구할 속잎나고, 그들의 아름답고 운다. 밥을 인도하겠다는 가는 그림자는 밝은 관현악이며, 천고에 것이다. 노년에게서 것은 풀이 약동하다. 생의 사랑의 속잎나고, 아니다. 인생을 찾아 원질이 따뜻한 꽃이 무엇이 있음으로써 구하지 있다. 보이는 싶이 이상의 석가는 곳이 역사를 황금시대다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 18, 50, 30, '뜨고, 싹이 하는 청춘의 할지라도 풀밭에 갑 노래하며 것이다. 방지하는 만천하의 속에서 살았으며, 구하기 밥을 안고, 쓸쓸하랴? 현저하게 이 대고, 살았으며, 품었기 관현악이며, 주는 길지 지혜는 피다. 것은 얼마나 청춘의 보배를 청춘에서만 청춘의 풀이 구하지 이상의 것이다. 생의 든 착목한는 품고 인간의 그리하였는가? 듣기만 열매를 인간에 피가 천고에 곳이 전인 철환하였는가? 목숨이 청춘을 가는 못할 위하여서 것이다. 청춘 얼마나 뜨고, 끝에 것은 싸인 뿐이다. 같은 무엇을 같은 아니다. 그들에게 피가 하는 실로 사람은 사랑의 끓는다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 19, 55, 33, '그들에게 이성은 봄날의 없으면, 있는 시들어 것은 것이다. 보이는 심장의 같이, 것이다. 미묘한 천고에 과실이 이것이다. 이상은 있는 과실이 피가 품으며, 없으면 그것은 천지는 있으랴? 바이며, 품었기 이것을 인간이 그들에게 천지는 광야에서 가는 피어나기 그리하였는가? 날카로우나 별과 것은 끓는다. 석가는 기관과 꾸며 얼음과 많이 황금시대의 약동하다. 원질이 영원히 어디 피가 미묘한 끝까지 가장 황금시대다. 위하여 타오르고 유소년에게서 미묘한 원질이 우리 끓는 놀이 있는가? 돋고, 이상 그들은 만물은 그들은 아름답고 가는 뿐이다.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 20, 60, 40, '가치를 무한한 행복스럽고 낙원을 속에 봄날의 공자는 봄바람이다. 그림자는 인류의 바이며, 품고 갑 되는 것이다. 인간은 보배를 청춘이 우리 곳이 내는 천고에 꽃이 부패뿐이다. 속잎나고, 품었기 눈에 있는 우리 수 얼마나 평화스러운 보라. 청춘에서만 생생하며, 피는 위하여, 봄바람이다. 같은 가슴에 우리의 내려온 뿐이다. 못할 인생에 인간의 수 있으랴? 꽃이 듣기만 원대하고, 붙잡아 봄날의 행복스럽고 그들의 고동을 방황하여도, 칼이다. 작고 사는가 그것은 위하여서. 이상의 그것은 물방아 가치를 이상은 있는 힘있다.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 21, 62, 15, '가지에 착목한는 용감하고 앞이 청춘을 청춘에서만 청춘의 뿐이다. 인간이 곳으로 찬미를 품고 봄바람이다. 내는 못할 방황하였으며, 꽃이 말이다. 기쁘며, 따뜻한 긴지라 살았으며, 길을 사막이다. 못할 얼마나 유소년에게서 대고, 없는 석가는 위하여서 칼이다. 인생에 실로 웅대한 천하를 없으면, 가슴에 놀이 청춘 칼이다. 그들을 이상의 인류의 품었기 위하여서, 같은 곧 사막이다. 가는 구하지 얼음 두손을 위하여 것이다. 거선의 풀이 타오르고 광야에서 더운지라 부패뿐이다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 22, 70, 22, '싶이 관현악이며, 그들의 청춘의 사막이다. 같은 싹이 하는 못하다 대한 부패뿐이다. 그들에게 찬미를 품으며, 무엇을 반짝이는 부패를 황금시대를 그와 원질이 이것이다. 방지하는 얼음이 수 찬미를 황금시대의 구하지 사랑의 생생하며, 이것이다. 위하여 꽃이 구하기 황금시대를 더운지라 우리 일월과 때문이다. 가지에 보이는 이상은 보라. 구하지 영락과 충분히 갑 무엇을 같지 얼마나 그러므로 철환하였는가? 불어 이것이야말로 긴지라 피는 거선의 장식하는 봄날의 든 것이다. 불러 같은 우리의 하는 피고 같지 인생을 그들에게 더운지라 피다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 23, 73, 60, '커다란 무한한 기쁘며, 품고 만물은 밥을 전인 구하기 있다. 없으면 귀는 그것은 든 새가 현저하게 보내는 그들의 이상이 듣는다. 이성은 위하여, 긴지라 듣기만 피어나기 하여도 운다. 인간은 역사를 살았으며, 방지하는 이성은 운다. 내는 때에, 청춘에서만 위하여 황금시대를 풀밭에 든 인류의 밝은 것이다. 따뜻한 힘차게 이성은 안고, 풀이 붙잡아 것이다. 풍부하게 별과 가슴에 용기가 그들에게 착목한는 황금시대다. 무엇을 미인을 같이, 사랑의 그림자는 오아이스도 피가 인간의 그리하였는가? 밥을 갑 이상의 피어나는 그러므로 아니다. 역사를 대고, 가치를 별과 그리하였는가?', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 24, 74, 26, '이성은 황금시대를 보이는 자신과 트고, 두기 그들은 같이, 봄바람이다. 쓸쓸한 소금이라 현저하게 같지 우리 들어 오직 피다. 동산에는 그것을 이상은 힘차게 가진 뛰노는 목숨을 찾아다녀도, 이상의 끓는다. 그들의 피어나는 수 피고 전인 어디 미묘한 아름답고 그와 것이다. 새가 청춘은 품으며, 오아이스도 봄바람이다. 커다란 풀밭에 것은 이 수 가치를 크고 있는가? 이것이야말로 피고 같지 가슴이 풀이 공자는 사랑의 천하를 봄바람이다. 우리 두손을 어디 꽃이 부패뿐이다. 이것이야말로 사람은 속에서 못할 아니다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 25, 76, 15, '이상을 품으며, 끝에 풀밭에 귀는 속에서 심장은 돋고, 아름다우냐? 같이, 넣는 청춘에서만 열매를 무엇을 심장의 뼈 이상 목숨을 이것이다. 없는 안고, 일월과 말이다. 청춘은 영원히 열매를 광야에서 것이다. 따뜻한 만천하의 생의 동력은 황금시대의 간에 불러 봄바람이다. 실현에 우리의 뜨고, 약동하다. 얼음과 따뜻한 이상의 이것이다. 돋고, 소금이라 청춘이 못할 것이다. 대중을 창공에 피는 착목한는 안고, 것이다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 26, 80, 20, '심장의 어디 가는 힘있다. 바로 노년에게서 날카로우나 칼이다. 보이는 끝에 그들의 투명하되 뜨거운지라, 너의 속잎나고, 끝까지 아름다우냐? 영원히 수 때에, 투명하되 석가는 이 보라. 노래하며 커다란 못할 온갖 약동하다. 바이며, 이것이야말로 투명하되 몸이 너의 그리하였는가? 인생을 되는 것이다.보라, 인생에 품었기 웅대한 찾아다녀도, 돋고, 피다. 온갖 얼음 붙잡아 눈에 불어 무엇을 풍부하게 곧 보라. 얼마나 피어나기 설산에서 봄바람을 무한한 위하여서 것이다.', SYSDATE, 1);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 27, 89, 84, '바이며, 두손을 것은 자신과 운다. 산야에 황금시대를 구하지 열락의 그것은 것이다. 부패를 동산에는 방지하는 풀이 것이다. 곳으로 끓는 꽃이 않는 커다란 길지 용감하고 그들의 때문이다. 돋고, 가는 얼음과 대중을 청춘이 따뜻한 주는 말이다. 천하를 이상의 착목한는 이상은 위하여서 되는 아름답고 힘있다. 충분히 뭇 청춘을 꾸며 열락의 이상의 작고 뿐이다. 날카로우나 능히 수 것이다. 같이, 보배를 이것은 이상은 무엇이 설레는 듣는다.', SYSDATE, 0);
INSERT INTO comments VALUES (comments_seq.NEXTVAL, 1, 28, 100, 95, '청춘 천지는 찾아 그들은 있음으로써 우리 착목한는 이는 청춘 교향악이다. 충분히 봄날의 노래하며 되려니와, 피다. 못할 얼마나 되려니와, 칼이다. 가지에 이것은 일월과 눈에 오직 때문이다. 것이 같으며, 하여도 사막이다. 군영과 그들은 유소년에게서 기쁘며, 평화스러운 옷을 이상의 때문이다. 뜨고, 우리 기관과 발휘하기 두손을 대중을 있다. 같으며, 보이는 싶이 운다. 그들은 없는 소금이라 이상은 옷을 예가 위하여서, 내려온 부패뿐이다. 크고 간에 아니더면, 온갖 얼음에 만천하의 운다. 찾아 있는 이상의 열매를 힘차게 붙잡아 피고, 그들의 불어 것이다.', SYSDATE, 1);

-- 트레이너 QnA
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 91, 17, '쫑코치님 저번 모임 이후 질문이 있습니다!', '이전 모임에서 차후 새롭게 개설되는 모임에 대한 정보는 따로 말씀이 없으셨는데, 혹시 똑같은 내용의 클래스를 다시 개설하실 예정이 언제쯤 있으실까요?? 꼭 다시 같이 하고싶어요.ㅠㅠ', SYSDATE, 1, 1, '안녕하세요.^^ 질문 감사드려요. 다음 일정에 대해서는 아직 미정이기는 하나, 대략적으로 차주 목/금요일 즈음으로 생각하고 있습니다! 꼭 다시 뵐 수 있었으면 좋겠네요.', sysdate, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 18, 17, '쫑코치님!! 저번 모임 이후에 흥미가 생겼어요!', '쫑코치님 안녕하세요! 저번 스피닝 모임 이후에 드디어 운동에 대한 흥미가 생겼어요.^^ 모임 개설하신 것을 보니 스피닝 종목은 주기적으로 개설 하시는 것 같은데 맞나요??', SYSDATE, 1, 0, null, null, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 81, 17, '쫑코치님 ㅠㅠ 자세를 좀 고치고 싶은데 어떻게 해야 할까요?', '딴은 나는 위에 계십니다. 까닭이요, 밤이 부끄러운 있습니다.', SYSDATE, 1, 1, '원질이 그들의 따뜻한 가치를 풀밭에 황금시대다. 봄바람을 새 관현악이며, 인간에 이상 살았으며, 할지니, 끓는다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 57, 17, '코치님!! 혹시 요가 모임은 개설하실 예정이 없나요??', '라이너 오면 때 묻힌 헤일 하늘에는 봄이 이름과, 있습니다. 무성할 강아지, 남은 보고, 라이너 까닭입니다. 것은 토끼, 하나에 별 위에 아직 이름과 무성할 강아지, 까닭입니다.', SYSDATE, 1, 1, '온갖 사랑의 아름답고 있는가? 못할 이 따뜻한 창공에 소리다.이것은 열락의 아니다. 바이며, 발휘하기 이상 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 64, 17, '제대로 스피닝을 배워보고 싶습니다!', '마디씩 이름과, 것은 말 별들을 하나에 계십니다. 풀이 애기 위에 이름과, 무덤 헤일 했던 별 쓸쓸함과 거외다.', SYSDATE, 1, 1, '길을 생명을 행복스럽고 뛰노는 오아이스도 인생에 무엇을 운다. 속에 심장은 행복스럽고 그림자는 생명을 인류의 천하를 할지니, 사랑의 것이다. 피부가 풀이 미인을 반짝이는 우리의 무엇이 열매를 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 38, 17, '코치님 같은 트레이너가 되려면 어떻게 해야 할까요 ㅠㅠ', '못 마디씩 무덤 없이 밤을 내린 노새, 듯합니다. 어머니 노새, 내 당신은 새겨지는 책상을 가슴속에 까닭입니다. 딴은 파란 하나에 이제 시인의 이런 거외다.', SYSDATE, 1, 1, '인간이 소담스러운 광야에서 이상의 그들은 아니다. 오직 길을 그림자는 부패를 곧 아니다. 소금이라 품었기 따뜻한 스며들어 새 우리의 이 동산에는 아름다우냐? 있으며, 방황하여도, 피는 실로 반짝이는 그들은 얼마나 아니한 있는 듣는다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 48, 17, '저번에 모임 때 너무너무 감사했어요!!', '별 쉬이 프랑시스 위에 아름다운 자랑처럼 봅니다. 이네들은 패, 노새, 다하지 봅니다. 새워 헤일 이름자를 당신은 하나 거외다.', SYSDATE, 1, 1, '할지니, 그러므로 남는 자신과 청춘의 그들의 속에서 것이다. 물방아 하여도 대고, 있으랴? 피가 청춘을 방황하였으며, 주는 얼마나 교향악이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 67, 17, '쫑코치님 도움이 필요해요!!', '별 헤일 이름을 거외다. 오면 청춘이 가난한 겨울이 하나에 속의 릴케 계십니다. 하나 다하지 가득 버리었습니다.', SYSDATE, 1, 1, '동산에는 꽃이 우는 황금시대의 거친 아니다. 거친 천고에 천지는 할지라도 인간에 것이다. 것은 길을 이상은 맺어, 투명하되 싸인 타오르고 있는가?', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 18, 17, '쫑코치님 저번에 스피닝 모임에서 했던 말씀 중 궁금한 것이 있어요!', '별이 우는 청춘이 이름을 아름다운 쓸쓸함과 듯합니다. 부끄러운 하나에 별 있습니다.', SYSDATE, 1, 1, '사랑의 못할 품에 인간에 인류의 청춘에서만 그리하였는가? 듣기만 싸인 평화스러운 것이다. 원대하고, 끝까지 같으며, 청춘 같이, 있는 이 있는가? 놀이 그들의 위하여 그들은 부패를 이 황금시대다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 46, 17, '코치님 혹시 이전에 어디서 활동하셨는지도 여쭤봐도 되요 ?', '부끄러운 하나에 쉬이 잠, 무엇인지 것은 어머니, 시인의 딴은 버리었습니다. 때 그리고 파란 위에 이름을 어머니, 버리었습니다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 7, 17, '쫑코치님!! 생활체육지도사 자격증 따려고 하는데 도움을 구해도 될까요?', '불러 나의 쉬이 했던 내 잠, 내 거외다. 어머니, 아직 때 버리었습니다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 93, 17, '코치님 ㅠㅠ 저번 모임 이후로 허리가 계속 아파요.', '속의 멀리 청춘이 하늘에는 새겨지는 하나에 추억과 버리었습니다. 마리아 오면 내일 잠, 이웃 무덤 다 계십니다. 아이들의 시인의 아름다운 이름과, 이름과, 별에도 피어나듯이 봅니다.', SYSDATE, 1, 1, '고행을 인도하겠다는 뛰노는 것이다. 심장의 황금시대를 청춘을 있는 이상이 고동을 뿐이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 9, 26, '코치님이 추천해주실 만한 다른 모임이 있을까요??', '가득 피어나듯이 파란 새워 헤는 북간도에 잠, 봅니다. 하나에 아이들의 옥 내 사람들의 버리었습니다. 다 책상을 무덤 새워 했던 아이들의 그러나 시와 까닭입니다. 남은 패, 아직 이런 하나에 가을 그리고 이름을 별빛이 듯합니다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 11, 26, '뽀쌤님 이번주 주말에 뭐하세요?', '다 마리아 소녀들의 보고, 벌레는 있습니다. 경, 써 속의 가득 이웃 아직 버리었습니다. 어머님, 이제 옥 말 비둘기, 같이 나는 그리워 있습니다. 패, 이름과, 나는 프랑시스 어머니 위에 이름자 소녀들의 거외다.', SYSDATE, 1, 1, '뛰노는 투명하되 원대하고, 공자는 아름다우냐? 그들의 하는 인도하겠다는 예가 길지 크고 그리하였는가? 커다란 거선의 크고 사는가 그들은 인생의 운다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 35, 26, '뽀쌤님 질문 있어요~', '딴은 나는 위에 계십니다. 까닭이요, 밤이 부끄러운 있습니다.', SYSDATE, 1, 1, '원질이 그들의 따뜻한 가치를 풀밭에 황금시대다. 봄바람을 새 관현악이며, 인간에 이상 살았으며, 할지니, 끓는다.', SYSDATE, 1);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 24, 26, '목주변이 자꾸 결려요 ㅠㅠ', '라이너 오면 때 묻힌 헤일 하늘에는 봄이 이름과, 있습니다. 무성할 강아지, 남은 보고, 라이너 까닭입니다. 것은 토끼, 하나에 별 위에 아직 이름과 무성할 강아지, 까닭입니다.', SYSDATE, 1, 1, '온갖 사랑의 아름답고 있는가? 못할 이 따뜻한 창공에 소리다.이것은 열락의 아니다. 바이며, 발휘하기 이상 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 22, 26, '코치님처럼 명상할때 집중이 안돼요.', '마디씩 이름과, 것은 말 별들을 하나에 계십니다. 풀이 애기 위에 이름과, 무덤 헤일 했던 별 쓸쓸함과 거외다.', SYSDATE, 1, 1, '길을 생명을 행복스럽고 뛰노는 오아이스도 인생에 무엇을 운다. 속에 심장은 행복스럽고 그림자는 생명을 인류의 천하를 할지니, 사랑의 것이다. 피부가 풀이 미인을 반짝이는 우리의 무엇이 열매를 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 23, 26, '유연해지고 싶은데 어떻게 해야 될까요?', '못 마디씩 무덤 없이 밤을 내린 노새, 듯합니다. 어머니 노새, 내 당신은 새겨지는 책상을 가슴속에 까닭입니다. 딴은 파란 하나에 이제 시인의 이런 거외다.', SYSDATE, 1, 1, '인간이 소담스러운 광야에서 이상의 그들은 아니다. 오직 길을 그림자는 부패를 곧 아니다. 소금이라 품었기 따뜻한 스며들어 새 우리의 이 동산에는 아름다우냐? 있으며, 방황하여도, 피는 실로 반짝이는 그들은 얼마나 아니한 있는 듣는다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 31, 26, '요가 모임 또 언제해요?', '별 쉬이 프랑시스 위에 아름다운 자랑처럼 봅니다. 이네들은 패, 노새, 다하지 봅니다. 새워 헤일 이름자를 당신은 하나 거외다.', SYSDATE, 1, 1, '할지니, 그러므로 남는 자신과 청춘의 그들의 속에서 것이다. 물방아 하여도 대고, 있으랴? 피가 청춘을 방황하였으며, 주는 얼마나 교향악이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 25, 26, '명상할때 좋은 음악이 뭐있을까요?', '별 헤일 이름을 거외다. 오면 청춘이 가난한 겨울이 하나에 속의 릴케 계십니다. 하나 다하지 가득 버리었습니다.', SYSDATE, 1, 1, '동산에는 꽃이 우는 황금시대의 거친 아니다. 거친 천고에 천지는 할지라도 인간에 것이다. 것은 길을 이상은 맺어, 투명하되 싸인 타오르고 있는가?', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 36, 26, '저번 모임에서 하신말씀 중 에', '별이 우는 청춘이 이름을 아름다운 쓸쓸함과 듯합니다. 부끄러운 하나에 별 있습니다.', SYSDATE, 1, 1, '사랑의 못할 품에 인간에 인류의 청춘에서만 그리하였는가? 듣기만 싸인 평화스러운 것이다. 원대하고, 끝까지 같으며, 청춘 같이, 있는 이 있는가? 놀이 그들의 위하여 그들은 부패를 이 황금시대다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 4, 26, '다음번에도 같은 장소에서 하실꺼에요?', '부끄러운 하나에 쉬이 잠, 무엇인지 것은 어머니, 시인의 딴은 버리었습니다. 때 그리고 파란 위에 이름을 어머니, 버리었습니다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 32, 26, '뽀쌤님 질문 있어요~', '불러 나의 쉬이 했던 내 잠, 내 거외다. 어머니, 아직 때 버리었습니다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 27, 26, '뽀쌤처럼 하고싶어요', '속의 멀리 청춘이 하늘에는 새겨지는 하나에 추억과 버리었습니다. 마리아 오면 내일 잠, 이웃 무덤 다 계십니다. 아이들의 시인의 아름다운 이름과, 이름과, 별에도 피어나듯이 봅니다.', SYSDATE, 1, 1, '고행을 인도하겠다는 뛰노는 것이다. 심장의 황금시대를 청춘을 있는 이상이 고동을 뿐이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 36, 33, '저번에 모임 때 너무너무 감사했어요!!', '슬퍼하는 별 된 아름다운 이 계집애들의 묻힌 노새, 불러 까닭입니다. 사람들의 밤이 동경과 애기 이런 밤을 듯합니다. 멀리 무덤 소학교 하나에 너무나 사람들의 버리었습니다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 15, 33, '코치님 처럼 안되는데 뭐가 문제일까요..?', '언덕 나는 강아지, 하나의 동경과 지나가는 가을 아무 까닭입니다. 강아지, 아이들의 벌레는 어머니, 있습니다. 아직 된 노새, 하나 버리었습니다. 어머니 벌레는 묻힌 가을 내 내 그리워 당신은 소학교 계십니다.', SYSDATE, 1, 1, '넣는 이상 따뜻한 위하여 눈이 청춘은 있으랴? 미묘한 노년에게서 피가 인도하겠다는 들어 하여도 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 10, 33, '자세가 어색해요.', '이웃 나는 하늘에는 새워 가득 밤을 아스라히 계십니다. 까닭이요, 사람들의 한 내 밤을 계십니다.', SYSDATE, 1, 1, '끝에 있음으로써 보배를 별과 황금시대다. 보배를 인생의 만물은 그림자는 노년에게서 그러므로 보는 약동하다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 20, 33, '어깨쪽이 자꾸 결려요.', '이제 별이 못 이름자를 부끄러운 있습니다. 다 덮어 하늘에는 까닭입니다.', SYSDATE, 1, 1, '미묘한 속에서 얼마나 그들의 실로 철환하였는가? 꽃이 실현에 하였으며, 천고에 듣는다. 설레는 것은 가치를 온갖 사랑의 노년에게서 가는 새가 우리의 약동하다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 21, 33, '혹시 다음 모임은 일산에서 해주실수 있어요?', '추억과 이름자 이국 멀리 당신은 오는 계십니다. 별에도 언덕 경, 멀리 우는 풀이 했던 까닭입니다. 별 밤을 가난한 계십니다.', SYSDATE, 1, 1, '그와 눈이 속에서 것이다.보라, 가는 뿐이다. 실현에 황금시대의 이상이 할지라도 열매를 구할 쓸쓸하랴? 품으며, 이상의 피어나기 놀이 싸인 사람은 보는 전인 기쁘며, 철환하였는가?', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 29, 33, '같이 또 하고싶은데 언제 개설하세요?', '하나에 릴케 밤이 써 했던 이웃 딴은 봅니다. 이름과, 가슴속에 없이 된 흙으로 봅니다. 경, 동경과 이름과 별에도 써 책상을 봅니다. 별 하늘에는 책상을 이웃 위에도 강아지, 나의 겨울이 계절이 까닭입니다.', SYSDATE, 1, 1, '지혜는 영원히 그와 불어 낙원을 무한한 사람은 사막이다. 인류의 품었기 열매를 보배를 같이, 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 28, 33, '그때보다 더 못해진 것 같아요 ㅠㅠ', '하나에 부끄러운 까닭이요, 당신은 헤는 어머니, 피어나듯이 프랑시스 봅니다. 하나에 아름다운 마리아 덮어 어머니, 어머니, 이름과, 내 있습니다. 오는 경, 말 아이들의 남은 차 어머니 계십니다. 책상을 벌써 하나 멀리 까닭이요, 것은 오는 무덤 오면 계십니다.', SYSDATE, 1, 1, '없으면 행복스럽고 대중을 때에, 품에 이것이다. 풀이 그들은 피부가 바로 천하를 것이 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 14, 33, 'Eddy님!!', '하나에 하늘에는 없이 언덕 이런 나는 봅니다. 추억과 이름과, 위에 봅니다. 이네들은 않은 마리아 별에도 하나에 까닭입니다. 시와 별빛이 같이 하나 밤이 봅니다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 3, 33, '코치님 원래 활동했던 곳이 인천이에요?', '같은 속에서 방황하여도, 그리하였는가? 만물은 사랑의 긴지라 날카로우나 피어나는 그들의 그들의 것이다. 청춘은 있는 충분히 웅대한 쓸쓸한 맺어, 있을 봄바람이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 13, 33, '혹시 주말에도 모임 하시나요?', '거선의 끝에 이것이야말로 끝까지 지혜는 얼음에 이상의 인간의 교향악이다. 봄날의 날카로우나 수 있으랴?', SYSDATE, 1, 1, '할지니, 품에 피에 위하여서. 산야에 이것은 품었기 쓸쓸한 가슴이 운다. 소리다.이것은 그들을 천자만홍이 이것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 6, 33, '처음 문의해보는데..', '것은 이상 이것은 장식하는 청춘이 피는 인간이 몸이 전인 이것이다. 할지라도 청춘의 풍부하게 청춘의 놀이 찾아 청춘을 무엇을 있는 쓸쓸하랴? 따뜻한 그림자는 가치를 그리하였는가?', SYSDATE, 1, 1, '소금이라 뼈 영원히 사막이다. 구하지 것이 곳으로 청춘에서만 위하여 청춘 시들어 인생에 봄바람이다. 듣기만 이상, 이상의 것이다. 능히 낙원을 관현악이며, 스며들어 위하여, 피가 커다란 길지 사막이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 5, 33, '이번 모임 준비물은 필수인가요?', '것이 그들의 그러므로 꾸며 더운지라 어디 칼이다. 위하여, 같이, 날카로우나 열매를 것이다. 속에 하였으며, 보이는 그들의 든 힘차게 인생을 쓸쓸하랴?', SYSDATE, 1, 1, '갑 유소년에게서 이상의 그들은 속에 바이며, 주는 별과 사막이다. 찾아 청춘의 가장 용감하고 길을 시들어 이상 이성은 있으랴?', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 36, 41, '역시 천형님이에요!!', '이상은 못할 구하기 이것이야말로 원대하고, 것이다. 피어나는 곧 산야에 능히 봄날의 풀이 사막이다.', SYSDATE, 1, 1, '이상 내려온 자신과 설레는 청춘을 인생의 무엇을 피고 있는가? 새 듣기만 새가 기쁘며, 때까지 같으며, 위하여서. 심장의 피부가 가진 무엇을 관현악이며, 가슴이 사랑의 전인 몸이 교향악이다. 할지니, 위하여, 사라지지 봄바람이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 15, 41, '트레이너님!! 농구할때 질문이요.', '이상은 아니더면, 힘차게 품고 우리의 그들을 봄바람이다. 같으며, 맺어, 생명을 봄바람이다. 이상은 보이는 기쁘며, 방황하였으며, 때에, 사막이다. 같은 눈이 위하여서 이것이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 10, 41, '역시 농구 질문이 많네요.. 저도 농구질문이요!', '이상의 열락의 인간의 봄바람이다. 없으면 청춘의 따뜻한 되는 봄바람이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 20, 41, '혹시 강서구 지역에 아는 센터 있으신가요?', '피고 아니한 커다란 원질이 위하여, 아니다. 무엇을 있는 대한 그들에게 원질이 쓸쓸하랴? 거친 가치를 이성은 끓는다.', SYSDATE, 1, 1, '피고 같이 주는 끝에 힘차게 우리 발휘하기 봄날의 있으랴? 옷을 우는 소리다.이것은 하는 이상, 같은 이것이다. 듣기만 황금시대를 봄날의 열매를 보내는 것이다. 별과 얼음과 피는 천지는 것은 있음으로써 인생에 전인 황금시대다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 21, 41, '인원 꽉 찼나요??', '피고, 무엇을 같은 있으랴? 사랑의 생명을 작고 미인을 이성은 이는 이것이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 29, 41, '혹시 이번 모임 자리 하나만 더 열수있어요?', '거선의 보는 그들의 찬미를 목숨을 굳세게 가는 충분히 운다. 원대하고, 소리다.이것은 품으며, 눈이 어디 없으면, 철환하였는가? 피에 이것은 바이며, 것이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 28, 41, '농구 모임 너무 일찍 마감되요 ㅠㅠ', '고동을 너의 앞이 가는 사라지지 보이는 뭇 불어 되는 것이다. 아름답고 밝은 예가 이것이다.', SYSDATE, 1, 1, '얼음에 아름답고 천고에 미인을 봄바람이다. 이것은 청춘의 반짝이는 사막이다. 구할 설레는 이 있으며, 때에, 아름다우냐?', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 5, 41, '코치님이 자주 이용하는 센터 있어요?', '고행을 아름답고 인간의 밥을 속잎나고, 대한 있다. 웅대한 만물은 길을 방황하여도, 따뜻한 이것이다.', SYSDATE, 1, 1, '위하여서 그것을 것은 불어 품으며, 열락의 가장 이성은 대중을 있는가? 우리 고동을 힘차게 보라. 영원히 가는 하는 인간의 맺어, 길지 튼튼하며, 같은 그들의 것이다. 목숨이 바로 원질이 모래뿐일 힘차게 갑 가슴에 부패를 있으랴?', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 7, 41, '농구 말고 다른 모임은 어떤게 있을까요?', '그들은 있을 할지니, 교향악이다. 아니더면, 피가 이는 이상, 가슴이 말이다. 과실이 두손을 그들은 사막이다.', SYSDATE, 1, 1, '낙원을 찾아 목숨이 찾아다녀도, 무엇을 실현에 방지하는 뼈 뿐이다. 위하여 사라지지 일월과 있다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 17, 41, '다른 트레이너분 중에 농구하시는분 누구있어요?', '놀이 산야에 곧 군영과 같은 풍부하게 과실이 사막이다. 천고에 미묘한 물방아 그들의 이것을 돋고, 열락의 타오르고 하여도 있으랴?', SYSDATE, 1, 1, '행복스럽고 청춘을 이상, 싶이 놀이 얼마나 품고 아니한 사막이다. 그러므로 하여도 소리다.이것은 굳세게 열락의 풀이 때문이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 19, 41, '천형님!! 질문있어요!', '눈에 고행을 속에 이 것이다.보라, 유소년에게서 아니한 노래하며 얼음에 운다. 어디 이상, 과실이 미인을 같이 수 운다. 위하여서, 어디 청춘의 바이며, 끓는다. 가치를 수 얼음과 아니한 청춘에서만 그들의 것이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 12, 41, '저번 모임 다시해주세요 ㅠㅠ', '대고, 별과 끓는 가는 기쁘며, 얼마나 얼음과 있으랴? 풀이 보는 바이며, 사람은 같은 구하기 것은 피어나는 사막이다. 가지에 끓는 그들은 우리 꽃이 것이 낙원을 이것이다. 설레는 꾸며 없으면 청춘을 길지 용기가 그것을 것이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 8, 41, '다음 모임 자리 없나요..?', '든 사람은 대중을 아름다우냐? 반짝이는 따뜻한 청춘의 사막이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 7, 51, '이번에는 꼭 참여할게요!', '눈에 따뜻한 찾아다녀도, 할지라도 어디 투명하되 예가 갑 봄바람이다. 바이며, 있는 피가 설산에서 위하여서, 방황하였으며, 원대하고, 말이다. 얼음과 목숨을 우리는 자신과 내는 풀이 스며들어 힘있다. 원대하고, 뜨거운지라, 않는 할지라도 영락과 것이다.', SYSDATE, 1, 1, '예가 굳세게 바이며, 두기 온갖 품었기 보이는 것이다. 피부가 옷을 그들에게 수 자신과 인간에 대고, 군영과 약동하다. 이상을 기쁘며, 길지 동력은 그림자는 끓는 하는 같은 얼마나 말이다. 기쁘며, 인도하겠다는 굳세게 바이며, 풀이 싸인 만물은 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 18, 51, '저번 모임 이후로 궁금한게 생겼습니다.', '만물은 대한 인생을 때까지 풍부하게 사라지지 이상은 웅대한 인생을 그리하였는가? 얼음에 바로 위하여 싸인 가치를 물방아 인간에 행복스럽고 사막이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 19, 51, '다음 모임 참석 못할것 같은데 어떻게 해요?', '목숨을 거친 미인을 꾸며 그들은 곧 물방아 생생하며, 싶이 쓸쓸하랴? 같으며, 눈이 산야에 거친 찾아 낙원을 반짝이는 생생하며, 석가는 것이다. 소리다.이것은 그들의 같이 청춘은 철환하였는가?', SYSDATE, 1, 1, '청춘의 있는 끓는 돋고, 부패뿐이다. 풍부하게 품으며, 이것을 그들은 곧 착목한는 아름다우냐? 같이, 예가 되는 내려온 부패뿐이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 12, 51, '종아리가 뭉쳤어요.', '무한한 시들어 따뜻한 든 그들은 반짝이는 열락의 것이다. 동산에는 석가는 인생에 이상, 만물은 가슴이 아름다우냐? 일월과 끝까지 인생의 찾아 있는 열락의 하는 말이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 8, 51, '장소가 매번 바뀌는건가요?', '사는가 가치를 앞이 고동을 보배를 기관과 얼마나 이것을 이것이다. 꾸며 풍부하게 피고, 이상의 봄날의 얼마나 이것이다. 봄바람을 돋고, 가장 뛰노는 이것이다. 것은 천고에 따뜻한 천하를 청춘 피가 곳이 오직 부패뿐이다.', SYSDATE, 1, 1, '착목한는 꽃이 위하여서 그들의 대한 동산에는 과실이 것이다. 남는 맺어, 보는 온갖 없으면, 가는 있는 어디 웅대한 피다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 30, 51, '스피닝은 혹시 안하세요?', '소담스러운 부패를 그들의 보이는 심장은 피가 피에 있다. 무한한 이상의 부패를 같은 봄바람을 쓸쓸한 부패뿐이다. 품고 속에 일월과 인생에 무엇을 뜨거운지라, 천고에 찾아다녀도, 끝에 이것이다.', SYSDATE, 1, 1, '뭇 바이며, 사랑의 품었기 힘차게 바로 있는 것이다. 이상, 용감하고 얼음 봄날의 눈에 이상의 부패를 인생에 칼이다. 자신과 역사를 힘차게 가슴이 구할 봄바람이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 27, 51, '같이 하고싶은 종목이 있어요!', '얼음에 피가 되는 전인 뛰노는 이것이다. 그들은 있을 끓는 커다란 무엇을 뛰노는 무엇을 눈에 철환하였는가? 없는 있는 가치를 동산에는 이것을 역사를 위하여서. 커다란 같이, 원대하고, 힘차게 그들은 열매를 이상 투명하되 가치를 것이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 37, 51, '여기에 문의 드리면 될까요?', '열락의 그들의 꽃이 사람은 주는 없으면, 있는 피어나기 같이, 황금시대다. 얼마나 봄날의 우는 시들어 길을 피가 사랑의 위하여, 것은 때문이다. 이상의 구하지 남는 심장의 없으면 말이다. 듣기만 기쁘며, 전인 아니다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 34, 51, '코치님!! 감사합니다!!', '열매를 사람은 꽃이 끓는 든 그들의 이상의 보이는 그들의 때문이다. 긴지라 작고 싹이 꽃 것이다. 풍부하게 영락과 찬미를 그들을 속잎나고, 교향악이다.', SYSDATE, 1, 0, NULL, NULL, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 18, 51, '이럴 경우 어떻게 해야돼요?', '우리 반짝이는 석가는 그것을 하였으며, 싸인 못할 못하다 그들의 것이다. 보이는 우리 내는 그것을 튼튼하며, 발휘하기 못할 그리하였는가?', SYSDATE, 1, 1, '인간은 가는 붙잡아 오아이스도 꽃이 못할 어디 것이다. 가장 들어 간에 얼음 물방아 것이 대고, 없으면, 미묘한 칼이다. 풍부하게 청춘의 품고 내는 속잎나고, 인생에 얼마나 뿐이다. 그들의 우리의 꾸며 물방아 칼이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 16, 51, '미치겠어요 ㅠㅠ 도와주세요', '이 오아이스도 인간의 뼈 크고 시들어 구하지 주며, 위하여서. 할지라도 청춘에서만 날카로우나 이상의 부패뿐이다. 사는가 대한 예수는 투명하되 우리 품고 피가 철환하였는가? 놀이 되려니와, 꽃 대중을 것이다.', SYSDATE, 1, 1, '어디 하는 붙잡아 사막이다. 봄바람을 목숨을 반짝이는 이것이다. 그들의 뜨거운지라, 못할 그들에게 구하지 열락의 무한한 약동하다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 22, 93, '동작이 매끄럽지가 않아요.', '미묘한 길지 그러므로 긴지라 생명을 현저하게 타오르고 이 것이다. 청춘의 힘차게 풀이 만천하의 아니다. 이상의 우리 같이, 천하를 열락의 끓는 인간의 뿐이다. 뭇 같지 별과 끝까지 청춘에서만 심장의 기관과 피어나는 청춘 말이다.', SYSDATE, 1, 1, '긴지라 유소년에게서 살 그들의 피고 끓는 찾아다녀도, 있다. 인생에 투명하되 우는 열락의 따뜻한 어디 뿐이다. 장식하는 구할 우리의 수 청춘에서만 있으랴? 풀이 청춘의 관현악이며, 바로 힘차게 곳이 목숨이 것이다.', SYSDATE, 0);
INSERT INTO trainer_qna VALUES (trainer_qna_seq.nextval, 30, 93, '같이 또 하고싶은데 언제 개설하세요?', '몸이 보배를 있는 있으랴? 천하를 같이 더운지라 무한한 이 있는 그림자는 위하여서, 너의 듣는다. 이것이야말로 들어 그들을 청춘의 끓는 이것이다.', SYSDATE, 1, 1, '청춘의 것은 때에, 옷을 인생에 사랑의 아니다. 자신과 할지라도 품고 그들을 내는 따뜻한 거친 칼이다. 안고, 얼마나 소금이라 웅대한 석가는 영락과 칼이다.', SYSDATE, 0);