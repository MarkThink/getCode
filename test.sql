/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2013-5-27 16:18:53                           */
/*==============================================================*/

/*==============================================================*/
/* Table: ActionPowers                                          */
/*==============================================================*/
create table ActionPowers (
   ID                   SERIAL not null,
   ActionStr            VARCHAR(5000)        null,
   ActionName           VARCHAR(30)          null,
   ActionUrl            VARCHAR(200)         null,
   ParentID             INT4                 null,
   Path                 VARCHAR(100)         null,
   constraint PK_ACTIONPOWERS primary key (ID)
);

comment on table ActionPowers is
'权限表';

comment on column ActionPowers.ID is
'自动编号';

comment on column ActionPowers.ActionStr is
'权限字符串';

comment on column ActionPowers.ActionName is
'权限名称';

comment on column ActionPowers.ActionUrl is
'网址链接';

comment on column ActionPowers.ParentID is
'该ID项的父ID-对应本表的主键ID';

comment on column ActionPowers.Path is
'分层路径';

/*==============================================================*/
/* Index: ActionPowers_PK                                       */
/*==============================================================*/
create unique index ActionPowers_PK on ActionPowers (
ID
);

/*==============================================================*/
/* Table: Classify                                              */
/*==============================================================*/
create table Classify (
   ID                   SERIAL not null,
   CompanyID            INT4                 null,
   Sort                 INT4                 null,
   Title                VARCHAR(30)          null,
   ParentID             INT4                 null,
   constraint PK_CLASSIFY primary key (ID)
);

comment on table Classify is
'商品分类表';

comment on column Classify.ID is
'自动编号';

comment on column Classify.CompanyID is
'企业编号';

comment on column Classify.Sort is
'排序';

comment on column Classify.Title is
'类名';

comment on column Classify.ParentID is
'父类编号';

/*==============================================================*/
/* Index: Classify_PK                                           */
/*==============================================================*/
create unique index Classify_PK on Classify (
ID
);


