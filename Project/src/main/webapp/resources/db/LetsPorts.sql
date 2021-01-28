-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
-- SEQUENCE들
CREATE SEQUENCE location1_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE location2_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE users_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE exercise_seq
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

CREATE SEQUENCE tags_seq
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
    location1_no      INT             PRIMARY KEY, 
    location1_name    VARCHAR2(30)    NOT NULL
);

-- location2 Table Create SQL
CREATE TABLE location2 (
    location2_no      INT             PRIMARY KEY, 
    location2_name    VARCHAR2(30)    NOT NULL
);

-- users Table Create SQL
CREATE TABLE users (
    user_no            INT              PRIMARY KEY, 
    email              VARCHAR2(50)     UNIQUE NOT NULL, 
    password           VARCHAR2(50)     NOT NULL, 
    user_separator     INT              NOT NULL, 
    created_at         DATE             NOT NULL, 
    last_login         DATE             NOT NULL, 
    login_count        INT              NOT NULL, 
    login_attempt      INT              NOT NULL, 
    disable            INT              NOT NULL, 
    user_reg_method    VARCHAR2(30)     NOT NULL, 
    user_nickname      VARCHAR2(30)     UNIQUE NOT NULL, 
    user_message       VARCHAR2(40)     NULL, 
    profile_photo      VARCHAR2(100)    NULL, 
    birth_year         INT              NULL, 
    birth_month        INT              NULL, 
    birth_day          INT              NULL, 
    location1_no       INT              REFERENCES location1(location1_no) NOT NULL, 
    location2_no       INT              REFERENCES location2(location2_no) NOT NULL
);

-- exercise Table Create SQL
CREATE TABLE exercise (
    exercise_no      INT             PRIMARY KEY, 
    exercise_name    VARCHAR2(30)    UNIQUE NOT NULL
);

-- meeting Table Create SQL
CREATE TABLE meeting (
    meeting_no           INT               PRIMARY KEY, 
    user_no              INT               REFERENCES users(user_no) NOT NULL, 
    meeting_max          INT               NOT NULL, 
    meeting_min          INT               NOT NULL, 
    exercise_no          INT               REFERENCES exercise(exercise_no) NOT NULL, 
    created_at           DATE              NOT NULL, 
    start_gather_date    DATE              NOT NULL, 
    end_gather_date      DATE              NOT NULL, 
    meeting_date         DATE              NOT NULL, 
    location1_no         INT               REFERENCES location1(location1_no) NOT NULL, 
    location2_no         INT               REFERENCES location2(location2_no) NOT NULL, 
    meeting_title        VARCHAR2(100)     NOT NULL, 
    meeting_content      VARCHAR2(4000)    NOT NULL, 
    is_progress          INT               NOT NULL, 
    cancel_reason        VARCHAR2(100)     NULL, 
    on_hide              INT               NOT NULL, 
    detail_location      VARCHAR2(100)     NULL, 
    meeting_hit          INT               NOT NULL
);

-- meeting_participants Table Create SQL
CREATE TABLE meeting_participants (
    participants_no    INT              PRIMARY KEY, 
    meeting_no         INT              REFERENCES meeting(meeting_no) NOT NULL, 
    user_no            INT              REFERENCES users(user_no) NOT NULL, 
    created_at         DATE             NOT NULL, 
    status             INT              NOT NULL, 
    reject_reason      VARCHAR2(100)    NULL
);

-- board_knowhow Table Create SQL
CREATE TABLE board_knowhow (
    knowhow_no         INT               PRIMARY KEY, 
    knowhow_title      VARCHAR2(100)     NOT NULL, 
    knowhow_content    VARCHAR2(4000)    NOT NULL, 
    created_at         DATE              NOT NULL, 
    user_no            INT               REFERENCES users(user_no) NOT NULL, 
    user_separator     INT               NOT NULL, 
    on_hide            INT               NOT NULL, 
    knowhow_hit        INT               NOT NULL
);

-- tags Table Create SQL
CREATE TABLE tags (
    tag_no      INT             PRIMARY KEY, 
    tag_name    VARCHAR2(30)    UNIQUE NOT NULL
);

-- scrap Table Create SQL
CREATE TABLE scrap (
    scrap_no            INT     PRIMARY KEY, 
    user_no             INT     REFERENCES users(user_no) NOT NULL, 
    scrap_separator     INT     NOT NULL, 
    scrap_referer_no    INT     NOT NULL, 
    end_gather_date     DATE    NULL, 
    created_at          DATE    NOT NULL
);

-- trainer_qna Table Create SQL
CREATE TABLE trainer_qna (
    trainer_qna_no          INT               PRIMARY KEY, 
    question_user_no        INT               REFERENCES users(user_no) NOT NULL, 
    trainer_user_no         INT               REFERENCES users(user_no) NOT NULL, 
    trainer_qna_title       VARCHAR2(100)     NOT NULL, 
    trainer_qna_content     VARCHAR2(2000)    NOT NULL, 
    created_at              DATE              NOT NULL, 
    is_published            INT               NOT NULL, 
    is_answered             INT               NOT NULL, 
    trainer_qna_answered    varchar2(2000)    NOT NULL, 
    answered_date           DATE              NOT NULL, 
    on_hide                 INT               NOT NULL
);

-- comment Table Create SQL
CREATE TABLE comments (
    comment_no             INT               PRIMARY KEY, 
    comment_referer_sep    INT               NOT NULL, 
    comment_referer_no     INT               NOT NULL, 
    user_no                INT               REFERENCES users(user_no) NOT NULL, 
    comment_content        varchar2(1000)    NOT NULL, 
    created_at             DATE              NOT NULL, 
    on_hide                int               NOT NULL
);

-- board_knowhow_tag Table Create SQL
CREATE TABLE board_knowhow_tag (
    knowhow_tag_no    INT    PRIMARY KEY, 
    knowhow_no        INT    REFERENCES board_knowhow(knowhow_no) NOT NULL, 
    tag_no            INT    REFERENCES tags(tag_no) NOT NULL
);

-- board_qna Table Create SQL
CREATE TABLE board_qna (
    board_qna_no         INT               PRIMARY KEY, 
    board_qna_title      VARCHAR2(100)     NOT NULL, 
    board_qna_content    VARCHAR2(4000)    NOT NULL, 
    user_no              INT               REFERENCES users(user_no) NOT NULL, 
    created_at           DATE              NOT NULL, 
    is_resolved          INT               NOT NULL, 
    resolve_date         DATE              NOT NULL, 
    on_hide              INT               NOT NULL
);

-- review Table Create SQL
CREATE TABLE review (
    review_no         INT               PRIMARY KEY, 
    target_user_no    INT               REFERENCES users(user_no) NOT NULL, 
    score             INT               NOT NULL, 
    meeting_no        INT               REFERENCES meeting(meeting_no) NOT NULL, 
    content           VARCHAR2(1000)    NOT NULL, 
    created_at        DATE              NOT NULL, 
    on_hide           INT               NOT NULL, 
    writer_user_no    INT               REFERENCES users(user_no) NOT NULL
);

-- trainer_info Table Create SQL
CREATE TABLE trainer_info (
    trainer_no              INT               PRIMARY KEY, 
    user_no                 INT               REFERENCES users(user_no) NOT NULL, 
    career                  INT               NOT NULL, 
    trainer_name            VARCHAR2(30)      NOT NULL, 
    certificate_filename    VARCHAR2(50)      NOT NULL, 
    employment              VARCHAR2(100)     NOT NULL, 
    profile                 VARCHAR2(2000)    NOT NULL, 
    created_at              DATE              NOT NULL
);

-- photo Table Create SQL
CREATE TABLE photo (
    photo_no             INT              PRIMARY KEY, 
    photo_referer_sep    INT              NOT NULL, 
    photo_referer_no     INT              NOT NULL, 
    photo_filename       VARCHAR2(100)    NOT NULL, 
    created_at           DATE             NOT NULL, 
    on_hide              int              NOT NULL
);

-- alarm Table Create SQL
CREATE TABLE alarm (
    alarm_no            INT              PRIMARY KEY, 
    alarm_separator     INT              NOT NULL, 
    alarm_referer_no    INT              NOT NULL, 
    alarm_content       VARCHAR2(500)    NOT NULL, 
    status              INT              NOT NULL, 
    created_at          DATE             NOT NULL
);

-- user_interest Table Create SQL
CREATE TABLE user_interest (
    user_interest_no    INT    PRIMARY KEY, 
    user_no             INT    REFERENCES users(user_no) NOT NULL, 
    exercise_no         INT    REFERENCES exercise(exercise_no) NOT NULL
);

-- materials Table Create SQL
CREATE TABLE materials (
    materials_no      INT             PRIMARY KEY, 
    meeting_no        INT             REFERENCES meeting(meeting_no) NOT NULL, 
    materials_name    VARCHAR2(30)    NOT NULL, 
    created_at        DATE            NOT NULL
);

-- is_reviewed Table Create SQL
CREATE TABLE is_reviewed (
    is_reviewed_no    INT    PRIMARY KEY, 
    meeting_no        INT    NOT NULL, 
    target_user_no    INT    NOT NULL, 
    writer_user_no    INT    NOT NULL, 
    status            INT    NOT NULL
);