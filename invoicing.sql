/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2013-5-31 17:59:00                           */
/*==============================================================*/

/*==============================================================*/
/* Table: classify                                              */
/*==============================================================*/
create table classify (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   title                VARCHAR(32)          null,
   parent_id            INT4                 null,
   in_path              VARCHAR(128)         null,
   constraint PK_CLASSIFY primary key (id)
);

comment on table classify is
'商品分类表';

comment on column classify.id is
'自动编号';

comment on column classify.company_id is
'企业编号';

comment on column classify.title is
'类名';

comment on column classify.parent_id is
'父类编号';

comment on column classify.in_path is
'分层路径';

/*==============================================================*/
/* Index: classify_PK                                           */
/*==============================================================*/
create unique index classify_PK on classify (
id
);

/*==============================================================*/
/* Table: company                                               */
/*==============================================================*/
create table company (
   id                   SERIAL               not null,
   title                VARCHAR(32)          null,
   genre                INT2                 null,
   reg_number           VARCHAR(64)          null,
   addr                 VARCHAR(64)          null,
   reg_captita          VARCHAR(32)          null,
   trade_area           VARCHAR(512)         null,
   major_good           VARCHAR(128)         null,
   brief                VARCHAR(512)         null,
   legal_name           VARCHAR(16)          null,
   sex                  INT2                 null,
   phone                VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   zip_code             VARCHAR(8)           null,
   add_timed            DATE                 null,
   constraint PK_COMPANY primary key (id)
);

comment on table company is
'企业表';

comment on column company.id is
'自动编号';

comment on column company.title is
'名称';

comment on column company.genre is
'公司类型';

comment on column company.reg_number is
'营业执照号码';

comment on column company.addr is
'地址';

comment on column company.reg_captita is
'注册资本';

comment on column company.trade_area is
'经营范围';

comment on column company.major_good is
'主营产品';

comment on column company.brief is
'企业简介';

comment on column company.legal_name is
'姓名(法定代表人)';

comment on column company.sex is
'性别';

comment on column company.phone is
'电话';

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

/*==============================================================*/
/* Table: consignee                                             */
/*==============================================================*/
create table consignee (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   managers             VARCHAR(16)          null,
   zip_code             VARCHAR(16)          null,
   country              VARCHAR(16)          null,
   province             VARCHAR(16)          null,
   city                 VARCHAR(16)          null,
   phone                VARCHAR(16)          null,
   mobile_phone         VARCHAR(16)          null,
   addr                 VARCHAR(128)         null,
   def                  INT2                 null,
   constraint PK_CONSIGNEE primary key (id)
);

comment on table consignee is
'物流信息表';

comment on column consignee.id is
'自动编号';

comment on column consignee.company_id is
'企业编号';

comment on column consignee.managers is
'收货人';

comment on column consignee.zip_code is
'邮编';

comment on column consignee.country is
'国家';

comment on column consignee.province is
'省';

comment on column consignee.city is
'城市';

comment on column consignee.phone is
'收货人电话';

comment on column consignee.mobile_phone is
'收货人手机';

comment on column consignee.addr is
'收货地址';

comment on column consignee.def is
'默认收货地址';

/*==============================================================*/
/* Index: consignee_PK                                          */
/*==============================================================*/
create unique index consignee_PK on consignee (
id
);

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   pinyin_code          VARCHAR(64)          null,
   title                VARCHAR(32)          null,
   phone                VARCHAR(16)          null,
   fax                  VARCHAR(16)          null,
   contact              VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   email                VARCHAR(32)          null,
   qq                   VARCHAR(32)          null,
   tax_id               VARCHAR(32)          null,
   bank                 VARCHAR(128)         null,
   bank_title           VARCHAR(128)         null,
   account              VARCHAR(64)          null,
   addr                 VARCHAR(64)          null,
   url                  VARCHAR(32)          null,
   manager              VARCHAR(32)          null,
   in_credit            NUMERIC(10,4)        null,
   out_credit           NUMERIC(10,4)        null,
   deadline             INT4                 null,
   status               INT2                 null,
   def                  INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_CUSTOMER primary key (id)
);

comment on table customer is
'客户表';

comment on column customer.id is
'自动编号';

comment on column customer.company_id is
'企业编号';

comment on column customer.pinyin_code is
'拼音编码';

comment on column customer.title is
'名称';

comment on column customer.phone is
'电话';

comment on column customer.fax is
'传真';

comment on column customer.contact is
'联系人';

comment on column customer.mobile_phone is
'手机';

comment on column customer.email is
'邮箱';

comment on column customer.qq is
'QQ';

comment on column customer.tax_id is
'税号';

comment on column customer.bank is
'开户行';

comment on column customer.bank_title is
'开户名称';

comment on column customer.account is
'帐号';

comment on column customer.addr is
'地址';

comment on column customer.url is
'网址';

comment on column customer.manager is
'管理负责人';

comment on column customer.in_credit is
'应收款信用额度';

comment on column customer.out_credit is
'应付款信用额度';

comment on column customer.deadline is
'帐期';

comment on column customer.status is
'状态';

comment on column customer.def is
'默认';

comment on column customer.remark is
'备注';

/*==============================================================*/
/* Index: customer_PK                                           */
/*==============================================================*/
create unique index customer_PK on customer (
id
);

/*==============================================================*/
/* Table: delivery                                              */
/*==============================================================*/
create table delivery (
   id                   SERIAL               not null,
   title                VARCHAR(32)          null,
   url                  VARCHAR(128)         null,
   status               INT2                 null,
   constraint PK_DELIVERY primary key (id)
);

comment on table delivery is
'货运公司表';

comment on column delivery.id is
'自动编号';

comment on column delivery.title is
'快递公司名';

comment on column delivery.url is
'快递公司网址';

comment on column delivery.status is
'状态';

/*==============================================================*/
/* Index: delivery_PK                                           */
/*==============================================================*/
create unique index delivery_PK on delivery (
id
);

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   title                VARCHAR(16)          null,
   status               INT2                 null,
   constraint PK_DEPARTMENT primary key (id)
);

comment on table department is
'公司部门表';

comment on column department.id is
'自动编号';

comment on column department.company_id is
'企业编号';

comment on column department.title is
'部门名称';

comment on column department.status is
'状态';

/*==============================================================*/
/* Index: department_PK                                         */
/*==============================================================*/
create unique index department_PK on department (
id
);

/*==============================================================*/
/* Table: depot                                                 */
/*==============================================================*/
create table depot (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   title                VARCHAR(32)          null,
   brief                VARCHAR(512)         null,
   phone                VARCHAR(16)          null,
   addr                 VARCHAR(64)          null,
   manager              VARCHAR(12)          null,
   status               INT2                 null,
   def                  INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT primary key (id)
);

comment on table depot is
'仓库表';

comment on column depot.id is
'自动编号';

comment on column depot.company_id is
'企业编号';

comment on column depot.title is
'仓库名称';

comment on column depot.brief is
'仓库简称';

comment on column depot.phone is
'仓库电话';

comment on column depot.addr is
'仓库地址';

comment on column depot.manager is
'仓库管理员';

comment on column depot.status is
'状态';

comment on column depot.def is
'默认';

comment on column depot.remark is
'备注';

/*==============================================================*/
/* Index: depot_PK                                              */
/*==============================================================*/
create unique index depot_PK on depot (
id
);

/*==============================================================*/
/* Table: depot_assembly                                        */
/*==============================================================*/
create table depot_assembly (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   as_date              DATE                 null,
   managers             INT4                 null,
   out_depot            INT4                 null,
   in_depot             INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_ASSEMBLY primary key (id)
);

comment on table depot_assembly is
'库存商品组装单';

comment on column depot_assembly.id is
'自动编号';

comment on column depot_assembly.company_id is
'企业编号';

comment on column depot_assembly.as_date is
'组装日期';

comment on column depot_assembly.managers is
'经办人';

comment on column depot_assembly.out_depot is
'出库仓库';

comment on column depot_assembly.in_depot is
'入库仓库';

comment on column depot_assembly.status is
'状态';

comment on column depot_assembly.remark is
'备注';

/*==============================================================*/
/* Index: depot_assembly_PK                                     */
/*==============================================================*/
create unique index depot_assembly_PK on depot_assembly (
id
);

/*==============================================================*/
/* Table: depot_check                                           */
/*==============================================================*/
create table depot_check (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   check_date           DATE                 null,
   check_depot          INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_CHECK primary key (id)
);

comment on table depot_check is
'库存盘点';

comment on column depot_check.id is
'自动编号';

comment on column depot_check.company_id is
'企业编号';

comment on column depot_check.check_date is
'盘点日期';

comment on column depot_check.check_depot is
'盘点仓库';

comment on column depot_check.status is
'状态';

comment on column depot_check.remark is
'备注';

/*==============================================================*/
/* Index: depot_check_PK                                        */
/*==============================================================*/
create unique index depot_check_PK on depot_check (
id
);

/*==============================================================*/
/* Table: depot_gift                                            */
/*==============================================================*/
create table depot_gift (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   gift_date            DATE                 null,
   managers             INT4                 null,
   company              INT4                 null,
   gift_depot           INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_GIFT primary key (id)
);

comment on table depot_gift is
'库存赠送单';

comment on column depot_gift.id is
'自动编号';

comment on column depot_gift.company_id is
'企业编号';

comment on column depot_gift.gift_date is
'赠送日期';

comment on column depot_gift.managers is
'经办员工';

comment on column depot_gift.company is
'往来单位';

comment on column depot_gift.gift_depot is
'赠送仓库';

comment on column depot_gift.status is
'状态';

comment on column depot_gift.remark is
'备注';

/*==============================================================*/
/* Index: depot_gift_PK                                         */
/*==============================================================*/
create unique index depot_gift_PK on depot_gift (
id
);

/*==============================================================*/
/* Table: depot_in                                              */
/*==============================================================*/
create table depot_in (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   in_date              DATE                 null,
   managers             INT4                 null,
   title                INT4                 null,
   in_depot             INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_IN primary key (id)
);

comment on table depot_in is
'库存入库单';

comment on column depot_in.id is
'自动编号';

comment on column depot_in.company_id is
'企业编号';

comment on column depot_in.in_date is
'入库日期';

comment on column depot_in.managers is
'经办人';

comment on column depot_in.title is
'供货单位';

comment on column depot_in.in_depot is
'入库仓库';

comment on column depot_in.status is
'状态';

comment on column depot_in.remark is
'备注';

/*==============================================================*/
/* Index: depot_in_PK                                           */
/*==============================================================*/
create unique index depot_in_PK on depot_in (
id
);

/*==============================================================*/
/* Table: depot_item                                            */
/*==============================================================*/
create table depot_item (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   depot_id             INT4                 null,
   good_id              INT4                 null,
   current_depot        INT4                 null,
   uppers               INT4                 null,
   lowers               INT4                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_ITEM primary key (id)
);

comment on table depot_item is
'库存细目表';

comment on column depot_item.id is
'自动编号';

comment on column depot_item.company_id is
'企业编号';

comment on column depot_item.depot_id is
'仓库编号';

comment on column depot_item.good_id is
'商品编号';

comment on column depot_item.current_depot is
'当前库存';

comment on column depot_item.uppers is
'上限数量';

comment on column depot_item.lowers is
'下限数量';

comment on column depot_item.remark is
'备注';

/*==============================================================*/
/* Index: depot_item_PK                                         */
/*==============================================================*/
create unique index depot_item_PK on depot_item (
id
);

/*==============================================================*/
/* Table: depot_loss                                            */
/*==============================================================*/
create table depot_loss (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   loss_date            DATE                 null,
   loss_depot           INT4                 null,
   managers             INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_LOSS primary key (id)
);

comment on table depot_loss is
'库存报损单';

comment on column depot_loss.id is
'自动编号';

comment on column depot_loss.company_id is
'企业编号';

comment on column depot_loss.loss_date is
'报损日期';

comment on column depot_loss.loss_depot is
'报损仓库';

comment on column depot_loss.managers is
'经办员工';

comment on column depot_loss.status is
'状态';

comment on column depot_loss.remark is
'备注';

/*==============================================================*/
/* Index: depot_loss_PK                                         */
/*==============================================================*/
create unique index depot_loss_PK on depot_loss (
id
);

/*==============================================================*/
/* Table: depot_move                                            */
/*==============================================================*/
create table depot_move (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   move_date            DATE                 null,
   managers             INT4                 null,
   out_depot            INT4                 null,
   in_depot             INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_MOVE primary key (id)
);

comment on table depot_move is
'库存调拨单';

comment on column depot_move.id is
'自动编号';

comment on column depot_move.company_id is
'企业编号';

comment on column depot_move.move_date is
'调拨日期';

comment on column depot_move.managers is
'经办人';

comment on column depot_move.out_depot is
'调出仓库';

comment on column depot_move.in_depot is
'调入仓库';

comment on column depot_move.status is
'状态';

comment on column depot_move.remark is
'备注';

/*==============================================================*/
/* Index: depot_move_PK                                         */
/*==============================================================*/
create unique index depot_move_PK on depot_move (
id
);

/*==============================================================*/
/* Table: depot_out                                             */
/*==============================================================*/
create table depot_out (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   out_date             DATE                 null,
   managers             INT4                 null,
   title                INT4                 null,
   out_depot            INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_OUT primary key (id)
);

comment on table depot_out is
'库存出库单';

comment on column depot_out.id is
'自动编号';

comment on column depot_out.company_id is
'企业编号';

comment on column depot_out.out_date is
'出库日期';

comment on column depot_out.managers is
'经办人';

comment on column depot_out.title is
'客户名称';

comment on column depot_out.out_depot is
'出库仓库';

comment on column depot_out.status is
'状态';

comment on column depot_out.remark is
'备注';

/*==============================================================*/
/* Index: depot_out_PK                                          */
/*==============================================================*/
create unique index depot_out_PK on depot_out (
id
);

/*==============================================================*/
/* Table: depot_profit                                          */
/*==============================================================*/
create table depot_profit (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   profit_date          DATE                 null,
   profit_depot         INT4                 null,
   managers             INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_PROFIT primary key (id)
);

comment on table depot_profit is
'库存报溢单';

comment on column depot_profit.id is
'自动编号';

comment on column depot_profit.company_id is
'企业编号';

comment on column depot_profit.profit_date is
'报溢日期';

comment on column depot_profit.profit_depot is
'报溢仓库';

comment on column depot_profit.managers is
'经办员工';

comment on column depot_profit.status is
'状态';

comment on column depot_profit.remark is
'备注';

/*==============================================================*/
/* Index: depot_profit_PK                                       */
/*==============================================================*/
create unique index depot_profit_PK on depot_profit (
id
);

/*==============================================================*/
/* Table: depot_receive                                         */
/*==============================================================*/
create table depot_receive (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   rev_date             DATE                 null,
   managers             INT4                 null,
   company              INT4                 null,
   rev_depot            INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_RECEIVE primary key (id)
);

comment on table depot_receive is
'库存获赠单';

comment on column depot_receive.id is
'自动编号';

comment on column depot_receive.company_id is
'企业编号';

comment on column depot_receive.rev_date is
'获赠日期';

comment on column depot_receive.managers is
'经办员工';

comment on column depot_receive.company is
'往来单位';

comment on column depot_receive.rev_depot is
'获赠仓库';

comment on column depot_receive.status is
'状态';

comment on column depot_receive.remark is
'备注';

/*==============================================================*/
/* Index: depot_receive_PK                                      */
/*==============================================================*/
create unique index depot_receive_PK on depot_receive (
id
);

/*==============================================================*/
/* Table: depot_split                                           */
/*==============================================================*/
create table depot_split (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   split_date           DATE                 null,
   managers             INT4                 null,
   out_depot            INT4                 null,
   in_depot             INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_SPLIT primary key (id)
);

comment on table depot_split is
'库存商品拆分单';

comment on column depot_split.id is
'自动编号';

comment on column depot_split.company_id is
'企业编号';

comment on column depot_split.split_date is
'拆分日期';

comment on column depot_split.managers is
'经办人';

comment on column depot_split.out_depot is
'出库仓库';

comment on column depot_split.in_depot is
'入库仓库';

comment on column depot_split.status is
'状态';

comment on column depot_split.remark is
'备注';

/*==============================================================*/
/* Index: depot_split_PK                                        */
/*==============================================================*/
create unique index depot_split_PK on depot_split (
id
);

/*==============================================================*/
/* Table: depot_temp_Item                                       */
/*==============================================================*/
create table depot_temp_Item (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   genre                INT2                 null,
   good_id              INT4                 null,
   good_title           VARCHAR(32)          null,
   unit                 INT2                 null,
   price                NUMERIC(10,4)        null,
   numbers              INT4                 null,
   moneys               NUMERIC(10,4)        null,
   currents             INT4                 null,
   uppers               INT4                 null,
   lowers               INT4                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_TEMP_ITEM primary key (id)
);

comment on table depot_temp_Item is
'库存临时细目表';

comment on column depot_temp_Item.id is
'自动编号';

comment on column depot_temp_Item.company_id is
'企业编号';

comment on column depot_temp_Item.genre is
'类型(调拨 报损 报溢 赠送 获赠 入库 出库 组装 拆分)';

comment on column depot_temp_Item.good_id is
'商品编号';

comment on column depot_temp_Item.good_title is
'商品名称';

comment on column depot_temp_Item.unit is
'单位';

comment on column depot_temp_Item.price is
'单价';

comment on column depot_temp_Item.numbers is
'数量';

comment on column depot_temp_Item.moneys is
'金额';

comment on column depot_temp_Item.currents is
'当前库存';

comment on column depot_temp_Item.uppers is
'上限数量';

comment on column depot_temp_Item.lowers is
'下限数量';

comment on column depot_temp_Item.remark is
'备注';

/*==============================================================*/
/* Index: depot_temp_Item_PK                                    */
/*==============================================================*/
create unique index depot_temp_Item_PK on depot_temp_Item (
id
);

/*==============================================================*/
/* Table: funds                                                 */
/*==============================================================*/
create table funds (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   title                VARCHAR(32)          null,
   addr                 VARCHAR(128)         null,
   account              VARCHAR(128)         null,
   status               INT2                 null,
   def                  INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_FUNDS primary key (id)
);

comment on table funds is
'资金帐户表';

comment on column funds.id is
'自动编号';

comment on column funds.company_id is
'企业编号';

comment on column funds.title is
'名称';

comment on column funds.addr is
'地址';

comment on column funds.account is
'帐号';

comment on column funds.status is
'状态';

comment on column funds.def is
'默认';

comment on column funds.remark is
'备注';

/*==============================================================*/
/* Index: funds_PK                                              */
/*==============================================================*/
create unique index funds_PK on funds (
id
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   title                VARCHAR(32)          null,
   pinyin_code          VARCHAR(64)          null,
   in_price             NUMERIC(10,4)        null,
   out_price            NUMERIC(10,4)        null,
   low_in_price         NUMERIC(10,4)        null,
   hig_in_price         NUMERIC(10,4)        null,
   low_out_pice         NUMERIC(10,4)        null,
   hig_out_pice         NUMERIC(10,4)        null,
   month_avg_value      NUMERIC(10,4)        null,
   mobile_avg_value     NUMERIC(10,4)        null,
   formats              VARCHAR(32)          null,
   weight               INT4                 null,
   warp_formats         VARCHAR(32)          null,
   model                VARCHAR(32)          null,
   cat_id               INT4                 null,
   unit                 VARCHAR(16)          null,
   warp_unit            VARCHAR(16)          null,
   formula              VARCHAR(128)         null,
   brand                VARCHAR(32)          null,
   place_of_origin      VARCHAR(128)         null,
   material             VARCHAR(128)         null,
   styles               VARCHAR(128)         null,
   license              VARCHAR(128)         null,
   health               VARCHAR(128)         null,
   supplier             VARCHAR(128)         null,
   shelf_bit            VARCHAR(128)         null,
   goods_pic            VARCHAR(128)         null,
   shelf_life           VARCHAR(128)         null,
   warning_days         INT4                 null,
   bar_code             VARCHAR(128)         null,
   in_code              VARCHAR(128)         null,
   warp_code            VARCHAR(128)         null,
   color                VARCHAR(128)         null,
   attributes           VARCHAR(32)          null,
   goods_desc           VARCHAR(2046)        null,
   goods_mark           VARCHAR(512)         null,
   adv_proxy_price      NUMERIC(10,4)        null,
   vip_price            NUMERIC(10,4)        null,
   general_price        NUMERIC(10,4)        null,
   distribution_price   NUMERIC(10,4)        null,
   sell_price           NUMERIC(10,4)        null,
   discount             INT2                 null,
   integral             INT2                 null,
   promote_price        NUMERIC(10,4)        null,
   promote_start_time   DATE                 null,
   promote_end_time     DATE                 null,
   is_promote           INT2                 null,
   is_member_price      INT2                 null,
   add_timed            DATE                 null,
   constraint PK_GOODS primary key (id)
);

comment on table goods is
'商品信息表';

comment on column goods.id is
'自动编号';

comment on column goods.company_id is
'企业编号';

comment on column goods.title is
'名称';

comment on column goods.pinyin_code is
'拼音编码';

comment on column goods.in_price is
'采购价格';

comment on column goods.out_price is
'销售价格';

comment on column goods.low_in_price is
'最低采购价';

comment on column goods.hig_in_price is
'最高采购价';

comment on column goods.low_out_pice is
'最低销售价';

comment on column goods.hig_out_pice is
'最高销售价';

comment on column goods.month_avg_value is
'月平均值';

comment on column goods.mobile_avg_value is
'移动平均值';

comment on column goods.formats is
'商品规格';

comment on column goods.weight is
'商品重量';

comment on column goods.warp_formats is
'包装规格';

comment on column goods.model is
'商品型号';

comment on column goods.cat_id is
'商品类别';

comment on column goods.unit is
'计价单位';

comment on column goods.warp_unit is
'包装单位';

comment on column goods.formula is
'换算公式';

comment on column goods.brand is
'品牌';

comment on column goods.place_of_origin is
'产地';

comment on column goods.material is
'商品材质';

comment on column goods.styles is
'商品款式';

comment on column goods.license is
'生产许可证';

comment on column goods.health is
'卫生合格证';

comment on column goods.supplier is
'供货商';

comment on column goods.shelf_bit is
'货架位';

comment on column goods.goods_pic is
'产品图片';

comment on column goods.shelf_life is
'保质期';

comment on column goods.warning_days is
'预警天数';

comment on column goods.bar_code is
'条形码';

comment on column goods.in_code is
'内部条码';

comment on column goods.warp_code is
'包装条码';

comment on column goods.color is
'商品颜色';

comment on column goods.attributes is
'商品属性';

comment on column goods.goods_desc is
'商品描述';

comment on column goods.goods_mark is
'商品备注';

comment on column goods.adv_proxy_price is
'高级代理销售价';

comment on column goods.vip_price is
'VIP客户销售价';

comment on column goods.general_price is
'普通客户销售价';

comment on column goods.distribution_price is
'分销代理销售价';

comment on column goods.sell_price is
'销售销售价';

comment on column goods.discount is
'参加打折';

comment on column goods.integral is
'参加积分';

comment on column goods.promote_price is
'促销价';

comment on column goods.promote_start_time is
'促销开始时间';

comment on column goods.promote_end_time is
'促销结束时间';

comment on column goods.is_promote is
'是否促销';

comment on column goods.is_member_price is
'是否享受会员价';

comment on column goods.add_timed is
'创建时间';

/*==============================================================*/
/* Index: goods_PK                                              */
/*==============================================================*/
create unique index goods_PK on goods (
id
);

/*==============================================================*/
/* Table: goods_unit                                            */
/*==============================================================*/
create table goods_unit (
   id                   SERIAL               not null,
   unit_title           VARCHAR(16)          null,
   constraint PK_GOODS_UNIT primary key (id)
);

comment on table goods_unit is
'商品单位表';

comment on column goods_unit.id is
'自动编号';

comment on column goods_unit.unit_title is
'单位名称';

/*==============================================================*/
/* Index: goods_unit_PK                                         */
/*==============================================================*/
create unique index goods_unit_PK on goods_unit (
id
);

/*==============================================================*/
/* Table: invoice                                               */
/*==============================================================*/
create table invoice (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   billing_date         DATE                 null,
   billing_type         INT2                 null,
   title                VARCHAR(32)          null,
   numbers              VARCHAR(32)          null,
   headers              VARCHAR(32)          null,
   contents             VARCHAR(512)         null,
   constraint PK_INVOICE primary key (id)
);

comment on table invoice is
'发票表';

comment on column invoice.id is
'自动编号';

comment on column invoice.company_id is
'企业编号';

comment on column invoice.billing_date is
'开票日期';

comment on column invoice.billing_type is
'开票类型';

comment on column invoice.title is
'客户名称';

comment on column invoice.numbers is
'发票编号';

comment on column invoice.headers is
'发票抬头';

comment on column invoice.contents is
'发票内容';

/*==============================================================*/
/* Index: invoice_PK                                            */
/*==============================================================*/
create unique index invoice_PK on invoice (
id
);

/*==============================================================*/
/* Table: master_role                                           */
/*==============================================================*/
create table master_role (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   title                VARCHAR(32)          null,
   bewrite              VARCHAR(512)         null,
   action_str           VARCHAR(4096)        null,
   constraint PK_MASTER_ROLE primary key (id)
);

comment on table master_role is
'角色表';

comment on column master_role.id is
'自动编号';

comment on column master_role.company_id is
'企业编号';

comment on column master_role.title is
'名称';

comment on column master_role.bewrite is
'描述';

comment on column master_role.action_str is
'权限字符串';

/*==============================================================*/
/* Index: master_role_PK                                        */
/*==============================================================*/
create unique index master_role_PK on master_role (
id
);

/*==============================================================*/
/* Table: master_user                                           */
/*==============================================================*/
create table master_user (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   role_id              INT4                 null,
   login_name           VARCHAR(32)          null,
   login_pwd            VARCHAR(128)         null,
   real_name            VARCHAR(32)          null,
   status               INT2                 null,
   login_num            INT4                 null,
   last_ip              VARCHAR(32)          null,
   create_user          VARCHAR(32)          null,
   add_timed            DATE                 null,
   constraint PK_MASTER_USER primary key (id)
);

comment on table master_user is
'用户表';

comment on column master_user.id is
'自动编号';

comment on column master_user.company_id is
'企业编号';

comment on column master_user.role_id is
'角色编号';

comment on column master_user.login_name is
'管理员登陆名';

comment on column master_user.login_pwd is
'管理员密码';

comment on column master_user.real_name is
'真实姓名';

comment on column master_user.status is
'状态';

comment on column master_user.login_num is
'登录次数';

comment on column master_user.last_ip is
'最后登录IP';

comment on column master_user.create_user is
'创建者';

comment on column master_user.add_timed is
'创建时间';

/*==============================================================*/
/* Index: master_user_PK                                        */
/*==============================================================*/
create unique index master_user_PK on master_user (
id
);

/*==============================================================*/
/* Table: powers                                                */
/*==============================================================*/
create table powers (
   id                   SERIAL               not null,
   action_str           VARCHAR(4096)        null,
   action_name          VARCHAR(32)          null,
   action_url           VARCHAR(128)         null,
   parent_id            INT4                 null,
   in_path              VARCHAR(128)         null,
   constraint PK_POWERS primary key (id)
);

comment on table powers is
'权限表';

comment on column powers.id is
'自动编号';

comment on column powers.action_str is
'权限字符串';

comment on column powers.action_name is
'权限名称';

comment on column powers.action_url is
'网址链接';

comment on column powers.parent_id is
'该ID项的父ID-对应本表的主键ID';

comment on column powers.in_path is
'分层路径';

/*==============================================================*/
/* Index: powers_PK                                             */
/*==============================================================*/
create unique index powers_PK on powers (
id
);

/*==============================================================*/
/* Table: purchase_in                                           */
/*==============================================================*/
create table purchase_in (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           INT4                 null,
   ret_id               INT4                 null,
   in_date              DATE                 null,
   in_depot             INT4                 null,
   delivery             INT4                 null,
   shipper_id           VARCHAR(32)          null,
   flow_lucre           NUMERIC(10,4)        null,
   buy_lucre            NUMERIC(10,4)        null,
   fashion              INT4                 null,
   pay_account          INT4                 null,
   benefit_lucre        NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   pay_lucre            NUMERIC(10,4)        null,
   mortgage             NUMERIC(10,4)        null,
   promise              INT4                 null,
   pay_promise          INT4                 null,
   pay_time             DATE                 null,
   ticket_type          INT4                 null,
   ticket_sn            VARCHAR(32)          null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_PURCHASE_IN primary key (id)
);

comment on table purchase_in is
'采购到货单';

comment on column purchase_in.id is
'自动编号';

comment on column purchase_in.company_id is
'企业编号';

comment on column purchase_in.receipt_id is
'单据编号';

comment on column purchase_in.ret_id is
'退货单编号';

comment on column purchase_in.in_date is
'到货日期';

comment on column purchase_in.in_depot is
'到货仓库';

comment on column purchase_in.delivery is
'货运公司';

comment on column purchase_in.shipper_id is
'货运单号';

comment on column purchase_in.flow_lucre is
'物流费用';

comment on column purchase_in.buy_lucre is
'采购费用';

comment on column purchase_in.fashion is
'结算方式';

comment on column purchase_in.pay_account is
'付款帐户';

comment on column purchase_in.benefit_lucre is
'优惠金额';

comment on column purchase_in.after_lucre is
'优惠后金额';

comment on column purchase_in.pay_lucre is
'本次支付金额';

comment on column purchase_in.mortgage is
'抵扣预付款';

comment on column purchase_in.promise is
'付款约定';

comment on column purchase_in.pay_promise is
'应付约定';

comment on column purchase_in.pay_time is
'应付期限';

comment on column purchase_in.ticket_type is
'开票类型';

comment on column purchase_in.ticket_sn is
'发票编号';

comment on column purchase_in.status is
'状态';

comment on column purchase_in.remark is
'备注';

/*==============================================================*/
/* Index: purchase_in_PK                                        */
/*==============================================================*/
create unique index purchase_in_PK on purchase_in (
id
);

/*==============================================================*/
/* Table: purchase_item                                         */
/*==============================================================*/
create table purchase_item (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           INT4                 null,
   good_id              INT4                 null,
   title                VARCHAR(32)          null,
   unit                 INT4                 null,
   out_price            NUMERIC(10,4)        null,
   amount               INT4                 null,
   lucre                NUMERIC(10,4)        null,
   tax_rate             VARCHAR(30)          null,
   tax                  NUMERIC(10,4)        null,
   out_tax              NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_PURCHASE_ITEM primary key (id)
);

comment on table purchase_item is
'采购商品细目表';

comment on column purchase_item.id is
'自动编号';

comment on column purchase_item.company_id is
'企业编号';

comment on column purchase_item.receipt_id is
'采购单据编号';

comment on column purchase_item.good_id is
'商品编号';

comment on column purchase_item.title is
'商品名称';

comment on column purchase_item.unit is
'单位';

comment on column purchase_item.out_price is
'销售价';

comment on column purchase_item.amount is
'数量';

comment on column purchase_item.lucre is
'含税金额';

comment on column purchase_item.tax_rate is
'税率';

comment on column purchase_item.tax is
'税额';

comment on column purchase_item.out_tax is
'不含税金额';

comment on column purchase_item.remark is
'备注';

/*==============================================================*/
/* Index: purchase_item_PK                                      */
/*==============================================================*/
create unique index purchase_item_PK on purchase_item (
id
);

/*==============================================================*/
/* Table: purchase_order                                        */
/*==============================================================*/
create table purchase_order (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           INT4                 null,
   in_receipt           INT4                 null,
   in_date              DATE                 null,
   buyer                INT4                 null,
   supplier             INT4                 null,
   in_depot             INT4                 null,
   pay_type             INT4                 null,
   pay_account          INT4                 null,
   benefit_cost         NUMERIC(10,4)        null,
   after_cost           NUMERIC(10,4)        null,
   in_type              INT4                 null,
   forecast_date        DATE                 null,
   pay_promise          INT4                 null,
   pay_status           INT4                 null,
   company              INT4                 null,
   shipper_sn           VARCHAR(32)          null,
   flow_cost            NUMERIC(10,4)        null,
   buy_cost             NUMERIC(10,4)        null,
   already_cost         NUMERIC(10,4)        null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_PURCHASE_ORDER primary key (id)
);

comment on table purchase_order is
'采购订单';

comment on column purchase_order.id is
'自动编号';

comment on column purchase_order.company_id is
'企业编号';

comment on column purchase_order.receipt_id is
'单据编号';

comment on column purchase_order.in_receipt is
'到货单编号';

comment on column purchase_order.in_date is
'采购日期';

comment on column purchase_order.buyer is
'采购员';

comment on column purchase_order.supplier is
'供应商名称';

comment on column purchase_order.in_depot is
'到货仓库';

comment on column purchase_order.pay_type is
'结算方式';

comment on column purchase_order.pay_account is
'付款帐户';

comment on column purchase_order.benefit_cost is
'优惠金额';

comment on column purchase_order.after_cost is
'优惠后金额';

comment on column purchase_order.in_type is
'开票类型';

comment on column purchase_order.forecast_date is
'预计到货日期';

comment on column purchase_order.pay_promise is
'付款约定';

comment on column purchase_order.pay_status is
'付款状态';

comment on column purchase_order.company is
'货运公司';

comment on column purchase_order.shipper_sn is
'货运单号';

comment on column purchase_order.flow_cost is
'物流费用';

comment on column purchase_order.buy_cost is
'采购费用';

comment on column purchase_order.already_cost is
'已支付金额';

comment on column purchase_order.status is
'状态';

comment on column purchase_order.remark is
'备注';

/*==============================================================*/
/* Index: purchase_order_PK                                     */
/*==============================================================*/
create unique index purchase_order_PK on purchase_order (
id
);

/*==============================================================*/
/* Table: purchase_ret                                          */
/*==============================================================*/
create table purchase_ret (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           INT4                 null,
   ret_date             DATE                 null,
   ret_depot            INT4                 null,
   cargo_company        INT4                 null,
   cargo_sn             VARCHAR(32)          null,
   pay_type             INT4                 null,
   in_account           INT4                 null,
   rebate_lucre         NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   recv_lucre           NUMERIC(10,4)        null,
   offset_lucre         NUMERIC(10,4)        null,
   turn_prelucre        INT2                 null,
   deadline             DATE                 null,
   flow_lucre           NUMERIC(10,4)        null,
   ret_lucre            NUMERIC(10,4)        null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_PURCHASE_RET primary key (id)
);

comment on table purchase_ret is
'采购退货单';

comment on column purchase_ret.id is
'自动编号';

comment on column purchase_ret.company_id is
'企业编号';

comment on column purchase_ret.receipt_id is
'单据编号';

comment on column purchase_ret.ret_date is
'退货日期';

comment on column purchase_ret.ret_depot is
'退货仓库';

comment on column purchase_ret.cargo_company is
'货运公司';

comment on column purchase_ret.cargo_sn is
'货运单号';

comment on column purchase_ret.pay_type is
'结算方式';

comment on column purchase_ret.in_account is
'收款帐户';

comment on column purchase_ret.rebate_lucre is
'折扣金额';

comment on column purchase_ret.after_lucre is
'折扣后金额';

comment on column purchase_ret.recv_lucre is
'收款金额';

comment on column purchase_ret.offset_lucre is
'抵消应付款金额';

comment on column purchase_ret.turn_prelucre is
'转为预付款';

comment on column purchase_ret.deadline is
'收款期限';

comment on column purchase_ret.flow_lucre is
'物流费用';

comment on column purchase_ret.ret_lucre is
'退货费用';

comment on column purchase_ret.status is
'状态';

comment on column purchase_ret.remark is
'备注';

/*==============================================================*/
/* Index: purchase_ret_PK                                       */
/*==============================================================*/
create unique index purchase_ret_PK on purchase_ret (
id
);

/*==============================================================*/
/* Table: sell_goods_item                                       */
/*==============================================================*/
create table sell_goods_item (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   sell_order_id        INT4                 null,
   good_id              INT4                 null,
   title                VARCHAR(32)          null,
   unit                 INT4                 null,
   out_price            NUMERIC(10,4)        null,
   amount               INT4                 null,
   lucre                NUMERIC(10,4)        null,
   tax_rate             VARCHAR(30)          null,
   tax                  NUMERIC(10,4)        null,
   out_tax              NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_SELL_GOODS_ITEM primary key (id)
);

comment on table sell_goods_item is
'销售商品细目表';

comment on column sell_goods_item.id is
'自动编号';

comment on column sell_goods_item.company_id is
'企业编号';

comment on column sell_goods_item.sell_order_id is
'销售订单编号';

comment on column sell_goods_item.good_id is
'商品编号';

comment on column sell_goods_item.title is
'商品名称';

comment on column sell_goods_item.unit is
'单位';

comment on column sell_goods_item.out_price is
'销售价';

comment on column sell_goods_item.amount is
'数量';

comment on column sell_goods_item.lucre is
'含税金额';

comment on column sell_goods_item.tax_rate is
'税率';

comment on column sell_goods_item.tax is
'税额';

comment on column sell_goods_item.out_tax is
'不含税金额';

comment on column sell_goods_item.remark is
'备注';

/*==============================================================*/
/* Index: sell_goods_item_PK                                    */
/*==============================================================*/
create unique index sell_goods_item_PK on sell_goods_item (
id
);

/*==============================================================*/
/* Table: sell_order                                            */
/*==============================================================*/
create table sell_order (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           INT4                 null,
   send_sn              INT4                 null,
   in_date              DATE                 null,
   salesman             INT4                 null,
   customer             INT4                 null,
   send_depot           INT4                 null,
   fashion              INT4                 null,
   pay_account          INT4                 null,
   benefit_lucre        NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   ticket_type          INT4                 null,
   forecast_date        DATE                 null,
   promise              INT4                 null,
   send_date            DATE                 null,
   sell_lucre           NUMERIC(10,4)        null,
   already_lucre        NUMERIC(10,4)        null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_SELL_ORDER primary key (id)
);

comment on table sell_order is
'销售订单';

comment on column sell_order.id is
'自动编号';

comment on column sell_order.company_id is
'企业编号';

comment on column sell_order.receipt_id is
'单据编号';

comment on column sell_order.send_sn is
'发货单编号';

comment on column sell_order.in_date is
'订单日期';

comment on column sell_order.salesman is
'业务员';

comment on column sell_order.customer is
'客户名称';

comment on column sell_order.send_depot is
'发货仓库';

comment on column sell_order.fashion is
'结算方式';

comment on column sell_order.pay_account is
'收款帐户';

comment on column sell_order.benefit_lucre is
'优惠金额';

comment on column sell_order.after_lucre is
'优惠后金额';

comment on column sell_order.ticket_type is
'开票类型';

comment on column sell_order.forecast_date is
'预计发货日期';

comment on column sell_order.promise is
'收款约定';

comment on column sell_order.send_date is
'送货时间约定';

comment on column sell_order.sell_lucre is
'销售费用';

comment on column sell_order.already_lucre is
'已收款金额';

comment on column sell_order.status is
'状态';

comment on column sell_order.remark is
'备注';

/*==============================================================*/
/* Index: sell_order_PK                                         */
/*==============================================================*/
create unique index sell_order_PK on sell_order (
id
);

/*==============================================================*/
/* Table: sell_ret                                              */
/*==============================================================*/
create table sell_ret (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt              INT4                 null,
   ret_date             DATE                 null,
   ret_depot            INT4                 null,
   freight              INT4                 null,
   freight_sn           VARCHAR(32)          null,
   bear_method          INT4                 null,
   in_account           INT4                 null,
   rebate_lucre         NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   recv_lucre           NUMERIC(10,4)        null,
   offset_lucre         NUMERIC(10,4)        null,
   turn_prelucre        INT2                 null,
   flow_lucre           NUMERIC(10,4)        null,
   ret_lucre            NUMERIC(10,4)        null,
   deadline             DATE                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_SELL_RET primary key (id)
);

comment on table sell_ret is
'销售退货单';

comment on column sell_ret.id is
'自动编号';

comment on column sell_ret.company_id is
'企业编号';

comment on column sell_ret.receipt is
'单据编号';

comment on column sell_ret.ret_date is
'退货日期';

comment on column sell_ret.ret_depot is
'入库仓库';

comment on column sell_ret.freight is
'货运公司';

comment on column sell_ret.freight_sn is
'货运单号';

comment on column sell_ret.bear_method is
'结算方式';

comment on column sell_ret.in_account is
'退款帐户';

comment on column sell_ret.rebate_lucre is
'折扣金额';

comment on column sell_ret.after_lucre is
'折扣后金额';

comment on column sell_ret.recv_lucre is
'退款金额';

comment on column sell_ret.offset_lucre is
'抵消应收款金额';

comment on column sell_ret.turn_prelucre is
'是否转为预收款';

comment on column sell_ret.flow_lucre is
'物流费用';

comment on column sell_ret.ret_lucre is
'退货费用';

comment on column sell_ret.deadline is
'退款期限';

comment on column sell_ret.status is
'状态';

comment on column sell_ret.remark is
'备注';

/*==============================================================*/
/* Index: sell_ret_PK                                           */
/*==============================================================*/
create unique index sell_ret_PK on sell_ret (
id
);

/*==============================================================*/
/* Table: sell_send                                             */
/*==============================================================*/
create table sell_send (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           INT4                 null,
   ret_id               INT4                 null,
   send_date            DATE                 null,
   send_depot           INT4                 null,
   delivery             INT4                 null,
   shipper_id           VARCHAR(32)          null,
   flow_lucre           NUMERIC(10,4)        null,
   fashion              INT4                 null,
   pay_account          INT4                 null,
   benefit_lucre        NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   pay_lucre            NUMERIC(10,4)        null,
   mortgage             INT2                 null,
   credit               NUMERIC(10,4)        null,
   deadline             DATE                 null,
   promise              INT4                 null,
   send_time            DATE                 null,
   ticket_type          INT4                 null,
   ticket_sn            VARCHAR(32)          null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_SELL_SEND primary key (id)
);

comment on table sell_send is
'销售发货单';

comment on column sell_send.id is
'自动编号';

comment on column sell_send.company_id is
'企业编号';

comment on column sell_send.receipt_id is
'单据编号';

comment on column sell_send.ret_id is
'退货单编号';

comment on column sell_send.send_date is
'发货日期';

comment on column sell_send.send_depot is
'发货仓库';

comment on column sell_send.delivery is
'货运公司';

comment on column sell_send.shipper_id is
'货运单号';

comment on column sell_send.flow_lucre is
'物流费用';

comment on column sell_send.fashion is
'结算方式';

comment on column sell_send.pay_account is
'收款帐户';

comment on column sell_send.benefit_lucre is
'优惠金额';

comment on column sell_send.after_lucre is
'优惠后金额';

comment on column sell_send.pay_lucre is
'本次收款金额';

comment on column sell_send.mortgage is
'抵扣预收款';

comment on column sell_send.credit is
'信用额度';

comment on column sell_send.deadline is
'收款期限';

comment on column sell_send.promise is
'收款约定';

comment on column sell_send.send_time is
'送货时间约定';

comment on column sell_send.ticket_type is
'开票类型';

comment on column sell_send.ticket_sn is
'发票编号';

comment on column sell_send.status is
'状态';

comment on column sell_send.remark is
'备注';

/*==============================================================*/
/* Index: sell_send_PK                                          */
/*==============================================================*/
create unique index sell_send_PK on sell_send (
id
);

/*==============================================================*/
/* Table: staff                                                 */
/*==============================================================*/
create table staff (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   title                VARCHAR(16)          null,
   ethnic               VARCHAR(32)          null,
   home_town            VARCHAR(32)          null,
   sex                  INT2                 null,
   identity_card        VARCHAR(32)          null,
   wage                 NUMERIC(10,4)        null,
   edu                  VARCHAR(32)          null,
   birth                DATE                 null,
   engage               DATE                 null,
   phone                VARCHAR(16)          null,
   mobile_phone         VARCHAR(16)          null,
   office_sector        VARCHAR(32)          null,
   appellative          VARCHAR(32)          null,
   status               INT2                 null,
   leave                DATE                 null,
   email                VARCHAR(30)          null,
   zip_code             VARCHAR(30)          null,
   job                  VARCHAR(30)          null,
   loan                 NUMERIC(10,4)        null,
   home_addr            VARCHAR(64)          null,
   photo                VARCHAR(128)         null,
   id_photo             VARCHAR(128)         null,
   summary              VARCHAR(512)         null,
   constraint PK_STAFF primary key (id)
);

comment on table staff is
'员工表';

comment on column staff.id is
'自动编号';

comment on column staff.company_id is
'公司编号';

comment on column staff.title is
'姓名';

comment on column staff.ethnic is
'民族';

comment on column staff.home_town is
'籍贯';

comment on column staff.sex is
'性别';

comment on column staff.identity_card is
'身份证号码';

comment on column staff.wage is
'工资';

comment on column staff.edu is
'学历';

comment on column staff.birth is
'出生日期';

comment on column staff.engage is
'聘任日期';

comment on column staff.phone is
'电话号码';

comment on column staff.mobile_phone is
'手机号码';

comment on column staff.office_sector is
'任职部门';

comment on column staff.appellative is
'职务';

comment on column staff.status is
'状态';

comment on column staff.leave is
'离职时间';

comment on column staff.email is
'邮箱';

comment on column staff.zip_code is
'邮编';

comment on column staff.job is
'岗位';

comment on column staff.loan is
'借款限额';

comment on column staff.home_addr is
'家庭地址';

comment on column staff.photo is
'照片';

comment on column staff.id_photo is
'身份证照';

comment on column staff.summary is
'简介';

/*==============================================================*/
/* Index: staff_PK                                              */
/*==============================================================*/
create unique index staff_PK on staff (
id
);

/*==============================================================*/
/* Table: supplier                                              */
/*==============================================================*/
create table supplier (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   pinyin_code          VARCHAR(64)          null,
   title                VARCHAR(32)          null,
   phone                VARCHAR(16)          null,
   fax                  VARCHAR(16)          null,
   contact              VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   email                VARCHAR(32)          null,
   qq                   VARCHAR(32)          null,
   tax_id               VARCHAR(32)          null,
   bank                 VARCHAR(128)         null,
   bank_title           VARCHAR(128)         null,
   account              VARCHAR(64)          null,
   addr                 VARCHAR(64)          null,
   url                  VARCHAR(32)          null,
   manager              VARCHAR(32)          null,
   in_credit            NUMERIC(10,4)        null,
   out_credit           NUMERIC(10,4)        null,
   deadline             INT4                 null,
   status               INT2                 null,
   def                  INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_SUPPLIER primary key (id)
);

comment on table supplier is
'供货商表';

comment on column supplier.id is
'自动编号';

comment on column supplier.company_id is
'企业编号';

comment on column supplier.pinyin_code is
'拼音编码';

comment on column supplier.title is
'名称';

comment on column supplier.phone is
'电话';

comment on column supplier.fax is
'传真';

comment on column supplier.contact is
'联系人';

comment on column supplier.mobile_phone is
'手机';

comment on column supplier.email is
'邮箱';

comment on column supplier.qq is
'QQ';

comment on column supplier.tax_id is
'税号';

comment on column supplier.bank is
'开户行';

comment on column supplier.bank_title is
'开户名称';

comment on column supplier.account is
'帐号';

comment on column supplier.addr is
'地址';

comment on column supplier.url is
'网址';

comment on column supplier.manager is
'管理负责人';

comment on column supplier.in_credit is
'应收款信用额度';

comment on column supplier.out_credit is
'应付款信用额度';

comment on column supplier.deadline is
'帐期';

comment on column supplier.status is
'状态';

comment on column supplier.def is
'默认';

comment on column supplier.remark is
'备注';

/*==============================================================*/
/* Index: supplier_PK                                           */
/*==============================================================*/
create unique index supplier_PK on supplier (
id
);

