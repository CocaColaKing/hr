create table VISITOR
(
  VISITOR_ID  VARCHAR2(255) default NULL not null
    primary key,
  LOGIN_NAME  VARCHAR2(255),
  PWD         VARCHAR2(255),
  MOBILE      VARCHAR2(255),
  STATUS      NUMBER,
  NICKNAME    VARCHAR2(255),
  REAL_NAME   VARCHAR2(255),
  EMAIL       VARCHAR2(255),
  CREATE_TIME DATE default current_timestamp,
  UPDATE_TIME DATE
)
/

comment on table VISITOR
is '游客表'
/

create table RECRUITMENT
(
  RECRUITMENT_ID VARCHAR2(12) not null
    primary key,
  CREATE_USER    VARCHAR2(12),
  TITLE          VARCHAR2(255),
  DESCRIPTION    VARCHAR2(1024),
  CREATE_TIME    DATE default current_timestamp,
  UPDATE_TIME    VARCHAR2(255)
)
/

comment on table RECRUITMENT
is '招聘信息表'
/

create table RESUME
(
  RESUME_ID       VARCHAR2(12) not null
    primary key,
  VISITOR_ID      VARCHAR2(12),
  REAL_NAME       VARCHAR2(10),
  MOBILE          VARCHAR2(11),
  GENDER          VARCHAR2(10) default NULL,
  MAJOR           VARCHAR2(10),
  SCHOOL          VARCHAR2(20),
  BIRTHDAY        VARCHAR2(20),
  ADDRESS         VARCHAR2(64),
  DESCRIPTION     VARCHAR2(512),
  HOBBY           VARCHAR2(64),
  EDUCATION       VARCHAR2(12),
  WORK_EXPERIENCE VARCHAR2(512),
  CREATE_TIME     DATE         default current_timestamp,
  UPDATE_TIME     DATE,
  EMAIL           VARCHAR2(20)
)
/

comment on table RESUME
is '简历表'
/

comment on column RESUME.REAL_NAME
is '真实姓名'
/

comment on column RESUME.MOBILE
is '手机号'
/

comment on column RESUME.GENDER
is '性别'
/

comment on column RESUME.MAJOR
is '专业'
/

comment on column RESUME.SCHOOL
is '毕业院校'
/

comment on column RESUME.BIRTHDAY
is '出生年月日'
/

comment on column RESUME.ADDRESS
is '住址'
/

comment on column RESUME.DESCRIPTION
is '自我介绍'
/

comment on column RESUME.HOBBY
is '兴趣爱好'
/

comment on column RESUME.EDUCATION
is '学历'
/

comment on column RESUME.WORK_EXPERIENCE
is '工作经验'
/

comment on column RESUME.EMAIL
is '邮箱'
/

create table RESUME_SEND
(
  RESUME_SEND_ID VARCHAR2(12) not null
    constraint RESUME_SEND_PK
    primary key,
  RECRUITMENT_ID VARCHAR2(12),
  RESUME_ID      VARCHAR2(12),
  VISITOR_ID     VARCHAR2(12),
  CREATE_TIME    DATE default current_timestamp,
  UPDATE_TIME    DATE
)
/

comment on table RESUME_SEND
is '简历投递表'
/

comment on column RESUME_SEND.RECRUITMENT_ID
is '招聘id'
/

comment on column RESUME_SEND.RESUME_ID
is '简历id'
/

comment on column RESUME_SEND.VISITOR_ID
is '游客id'
/

create table INTERVIEW
(
  INTERVIEW_ID   VARCHAR2(12) not null
    primary key,
  RESUME_SEND_ID VARCHAR2(12),
  NOTE           VARCHAR2(64),
  STATUS         NUMBER(1) default 0,
  CREATE_TIME    DATE      default current_timestamp,
  UPDATE_TIME    DATE
)
/

comment on table INTERVIEW
is '面试表'
/

comment on column INTERVIEW.NOTE
is '附加信息'
/

comment on column INTERVIEW.STATUS
is '初始状态为0，确认之后则成为员工'
/

