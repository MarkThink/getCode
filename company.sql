/*==============================================================*/
/* Table: company                                               */
/*==============================================================*/
create table companyfox (
   id                   SERIAL               not null,
   company_name         VARCHAR(32)          null,
   genre                INT2                 null,
   reg_number           VARCHAR(64)          null,
   company_addr         VARCHAR(64)          null,
   reg_captita          VARCHAR(32)          null,
   trade_area           VARCHAR(512)         null,
   major_good           VARCHAR(128)         null,
   company_brief        VARCHAR(512)         null,
   legal_name           VARCHAR(16)          null,
   sex                  INT2                 null,
   company_phone        VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   zip_code             VARCHAR(8)           null,
   add_timed            DATE                 null,
   constraint PK_COMPANY primary key (id)
);

comment on table company is
'企业';

comment on column company.id is
'自动编号';

comment on column company.company_name is
'企业名称';

comment on column company.genre is
'类型';

comment on column company.reg_number is
'营业执照号码';

comment on column company.company_addr is
'企业地址';

comment on column company.reg_captita is
'注册资本';

comment on column company.trade_area is
'经营范围';

comment on column company.major_good is
'主营产品';

comment on column company.company_brief is
'企业描述';

comment on column company.legal_name is
'姓名(法定代表人)';

comment on column company.sex is
'性别';

comment on column company.company_phone is
'企业电话';

comment on column company.mobile_phone is
'手机';

comment on column company.zip_code is
'邮编';

comment on column company.add_timed is
'创建时间';

/*==============================================================*/
/* Index: company_PK                                            */
/*==============================================================*/
create unique index company_PK on company (
id
);