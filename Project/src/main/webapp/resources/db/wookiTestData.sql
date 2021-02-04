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
    scrap_user_no		NUMBER  REFERENCES users(user_no) ON DELETE CASCADE NOT NULL,
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

-- 관리자 1, 일반유저 35, 트레이너 3
INSERT INTO USERS values (users_seq.nextval, 'ziziza93@naver.com', 1111, 0, SYSDATE, SYSDATE, 100, 0, 0, 'kakao', '본계정', '관리자입니다', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'admin@letsports.com', 1111, 0, SYSDATE, SYSDATE, 100, 0, 0, 'kakao', '관리자', '관리자입니다', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user1@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '메롱', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user2@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '글쎄요', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user3@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '접니다', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user4@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'google', '운동마니아', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user5@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'facebook', '농구조아', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user6@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'local', '야구만세', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user7@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '신난당', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user8@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '나니고레', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user9@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '무슨서비스지', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user10@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'google', '심심해', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user11@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'facebook', '머슬킹', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user12@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'local', '머슬마니아', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user13@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '술술마니아', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user14@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '머술쓰', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user15@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '마님하이', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user16@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'google', '마늘맨', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user17@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'facebook', '당근맨', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user18@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'local', '당근좋아', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user19@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '가지좋아', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user20@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '씐난다', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user21@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', 'kinggu', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user22@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'google', '캥거루맨', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user23@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'facebook', '캉캉이', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user24@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'local', '좋아요', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user25@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '그냥좋아', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user26@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '울지마', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user27@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '슬퍼하쥐망', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user28@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'google', '운동하자', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user29@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'facebook', '같이할래', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user30@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'local', '같이하자구', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user31@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '같이해용', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user32@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '하기시러', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user33@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '나는조타', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user34@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'local', '나는실타', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'user35@letsports.com', 1111, 2, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '굿굿맨', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'trainer1@letsports.com', 1111, 1, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '쫑트', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'trainer2@letsports.com', 1111, 1, SYSDATE, SYSDATE, 1, 0, 0, 'kakao', '킹트', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO USERS values (users_seq.nextval, 'trainer3@letsports.com', 1111, 1, SYSDATE, SYSDATE, 1, 0, 0, 'naver', '홍트', '잘부탁드려요', null, null, null, null, 0, 0);
INSERT INTO trainer_info values (trainer_info_seq.nextval, 38, 1, '강철종', '트레이너자격증', '신촌센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO trainer_info values (trainer_info_seq.nextval, 39, 7, '김갑수', '트레이너자격증', '영등포센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);
INSERT INTO trainer_info values (trainer_info_seq.nextval, 40, 10, '홍백현', '트레이너자격증', '강남센터', '안녕하세요. 반갑습니다. 잘부탁드립니다.', SYSDATE);

-- 모임3 / 게시글12 / 15질문과답변
INSERT INTO MEETING values (meeting_seq.nextval, 1, 10, 6, 0, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '족구합시다.', '족구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '하하하하', '이러쿵저러ㅇ쿵', SYSDATE, 1, 0, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '도움을 주세요', '내용ㅇㅇㅇ', 15, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '으아아아 살려주세요', '내용ㅇㅇㅇ', 14, SYSDATE, 0, NULL, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '저건저겁니다', '이러쿵저러ㅇ쿵', SYSDATE, 3, 2, 0, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 2, 8, 4, 3, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '볼링합시다.', '볼링하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '아시겠어요?', '이러쿵저러ㅇ쿵', SYSDATE, 4, 2, 0, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '넹', '이러쿵저러ㅇ쿵', SYSDATE, 40, 1, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '오늘저녁은 뭐죠', '내용ㅇㅇㅇ', 3, SYSDATE, 0, NULL, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '그랬구나', '이러쿵저러ㅇ쿵', SYSDATE, 38, 1, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '어제 뭐먹었어요', '내용ㅇㅇㅇ', 4, SYSDATE, 0, NULL, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '알았어요', '이러쿵저러ㅇ쿵', SYSDATE, 39, 1, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '내일 뭐해요?', '내용ㅇㅇㅇ', 6, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '오늘 공부할거에요?', '내용ㅇㅇㅇ', 5, SYSDATE, 0, NULL, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '놀까말까', '이러쿵저러ㅇ쿵', SYSDATE, 8, 2, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '심심한가요?', '내용ㅇㅇㅇ', 5, SYSDATE, 0, NULL, 0);
INSERT INTO MEETING values (meeting_seq.nextval, 3, 12, 10, 1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 0, 1, '축구합시다.', '축구하면 얼마나 좋게요~!? 다같이 합시다.', 0, null, 0, null, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '이건 뭐ㅔ요?', '내용ㅇㅇㅇ', 5, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '놀곳 알려주세요', '내용ㅇㅇㅇ', 4, SYSDATE, 0, NULL, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '그렇구나', '이러쿵저러ㅇ쿵', SYSDATE, 9, 2, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '다이어트 방법 알려주세요', '내용ㅇㅇㅇ', 3, SYSDATE, 0, NULL, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '이야야아아아아', '이러쿵저러ㅇ쿵', SYSDATE, 7, 2, 0, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '나는천재다', '이러쿵저러ㅇ쿵', SYSDATE, 6, 2, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '어떻게해야하죠', '내용ㅇㅇㅇ', 8, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '질문게시판이죠?', '내용ㅇㅇㅇ', 33, SYSDATE, 0, NULL, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '이건이거고', '이러쿵저러ㅇ쿵', SYSDATE, 2, 0, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '거기 119인가요?', '내용ㅇㅇㅇ', 23, SYSDATE, 0, NULL, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '경찰아저씨 도와주세요', '내용ㅇㅇㅇ', 21, SYSDATE, 0, NULL, 0);
INSERT INTO board_knowhow VALUES (board_knowhow_seq.nextval, '후후후후후', '이러쿵저러ㅇ쿵', SYSDATE, 5, 2, 0, 0);
INSERT INTO board_qna VALUES (board_qna_seq.nextval, '살려주세요', '내용ㅇㅇㅇ', 22, SYSDATE, 0, NULL, 0);