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
    scrap_referer_no    NUMBER  NULL, 
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