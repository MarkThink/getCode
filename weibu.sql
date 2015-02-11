/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2013-08-30 14:41:54                          */
/*==============================================================*/

/*==============================================================*/
/* Table: begin_bank                                            */
/*==============================================================*/
create table begin_bank (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   begin_date           DATE                 null,
   pick_bank            CHAR(24)             null,
   begin_money          NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_BEGIN_BANK primary key (id)
);

comment on table begin_bank is
'期初银行';

comment on column begin_bank.id is
'自动编号';

comment on column begin_bank.company_id is
'企业编号';

comment on column begin_bank.begin_date is
'期初日期';

comment on column begin_bank.pick_bank is
'选择选择银行';

comment on column begin_bank.begin_money is
'金额';

comment on column begin_bank.remark is
'备注';

/*==============================================================*/
/* Index: begin_bank_PK                                         */
/*==============================================================*/
create unique index begin_bank_PK on begin_bank (
id
);

/*==============================================================*/
/* Table: begin_depot                                           */
/*==============================================================*/
create table begin_depot (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   begin_date           DATE                 null,
   begin_depot          CHAR(24)             null,
   begin_supply         CHAR(24)             null,
   make_receipt         CHAR(24)             null,
   in_date              DATE                 null,
   belong_receipt       CHAR(24)             null,
   remark               VARCHAR(512)         null,
   constraint PK_BEGIN_DEPOT primary key (id)
);

comment on table begin_depot is
'期初库存';

comment on column begin_depot.id is
'自动编号';

comment on column begin_depot.company_id is
'企业编号';

comment on column begin_depot.begin_date is
'期初日期';

comment on column begin_depot.begin_depot is
'选择仓库';

comment on column begin_depot.begin_supply is
'供货单位';

comment on column begin_depot.make_receipt is
'制单人';

comment on column begin_depot.in_date is
'制单日期';

comment on column begin_depot.belong_receipt is
'上单人';

comment on column begin_depot.remark is
'备注';

/*==============================================================*/
/* Index: begin_depot_PK                                        */
/*==============================================================*/
create unique index begin_depot_PK on begin_depot (
id
);

/*==============================================================*/
/* Table: begin_goods_item                                      */
/*==============================================================*/
create table begin_goods_item (
   id                   CHAR(24)             not null,
   parent_id            CHAR(24)             null,
   good_id              CHAR(24)             null,
   good_priceid         CHAR(24)             null,
   good_name            VARCHAR(32)          null,
   barcode              VARCHAR(32)          null,
   formats              VARCHAR(32)          null,
   unit_type            INT2                 null,
   amount               INT4                 null,
   unit_price           NUMERIC(10,4)        null,
   lucre                NUMERIC(10,4)        null,
   discount             FLOAT                null,
   discount_price       NUMERIC(10,4)        null,
   discount_money       NUMERIC(10,4)        null,
   constraint PK_BEGIN_GOODS_ITEM primary key (id)
);

comment on table begin_goods_item is
'期初商品细目';

comment on column begin_goods_item.id is
'自动编号';

comment on column begin_goods_item.parent_id is
'父类编号';

comment on column begin_goods_item.good_id is
'商品编号';

comment on column begin_goods_item.good_priceid is
'价格编号';

comment on column begin_goods_item.good_name is
'商品名称';

comment on column begin_goods_item.barcode is
'商品条码';

comment on column begin_goods_item.formats is
'商品规格';

comment on column begin_goods_item.unit_type is
'单位类型(0小单位 1 中单位 2大单位)';

comment on column begin_goods_item.amount is
'数量';

comment on column begin_goods_item.unit_price is
'单价';

comment on column begin_goods_item.lucre is
'金额';

comment on column begin_goods_item.discount is
'折扣';

comment on column begin_goods_item.discount_price is
'折后单价';

comment on column begin_goods_item.discount_money is
'折后金额';

/*==============================================================*/
/* Index: begin_goods_item_PK                                   */
/*==============================================================*/
create unique index begin_goods_item_PK on begin_goods_item (
id
);

/*==============================================================*/
/* Table: begin_pay_money                                       */
/*==============================================================*/
create table begin_pay_money (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   begin_date           DATE                 null,
   begin_customer       CHAR(24)             null,
   begin_money          NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_BEGIN_PAY_MONEY primary key (id)
);

comment on table begin_pay_money is
'期初应付款';

comment on column begin_pay_money.id is
'自动编号';

comment on column begin_pay_money.company_id is
'企业编号';

comment on column begin_pay_money.begin_date is
'期初日期';

comment on column begin_pay_money.begin_customer is
'客户名称';

comment on column begin_pay_money.begin_money is
'金额';

comment on column begin_pay_money.remark is
'备注';

/*==============================================================*/
/* Index: begin_pay_money_PK                                    */
/*==============================================================*/
create unique index begin_pay_money_PK on begin_pay_money (
id
);

/*==============================================================*/
/* Table: begin_prepay_money                                    */
/*==============================================================*/
create table begin_prepay_money (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   move_date            DATE                 null,
   this_id              CHAR(24)             null,
   staff_id             CHAR(24)             null,
   pay_money            NUMERIC(10,4)        null,
   bad_account          INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_BEGIN_PREPAY_MONEY primary key (id)
);

comment on table begin_prepay_money is
'期初预付款';

comment on column begin_prepay_money.id is
'自动编号';

comment on column begin_prepay_money.company_id is
'企业编号';

comment on column begin_prepay_money.move_date is
'调拨日期';

comment on column begin_prepay_money.this_id is
'往来单位';

comment on column begin_prepay_money.staff_id is
'联系人';

comment on column begin_prepay_money.pay_money is
'预付金额';

comment on column begin_prepay_money.bad_account is
'坏账';

comment on column begin_prepay_money.remark is
'备注';

/*==============================================================*/
/* Index: begin_prepay_money_PK                                 */
/*==============================================================*/
create unique index begin_prepay_money_PK on begin_prepay_money (
id
);

/*==============================================================*/
/* Table: begin_prerecv_money                                   */
/*==============================================================*/
create table begin_prerecv_money (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   begin_date           DATE                 null,
   begin_customer       CHAR(24)             null,
   begin_salesman       CHAR(24)             null,
   begin_pay_money      NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_BEGIN_PRERECV_MONEY primary key (id)
);

comment on table begin_prerecv_money is
'期初预收款';

comment on column begin_prerecv_money.id is
'自动编号';

comment on column begin_prerecv_money.company_id is
'企业编号';

comment on column begin_prerecv_money.begin_date is
'期初日期';

comment on column begin_prerecv_money.begin_customer is
'客户名称';

comment on column begin_prerecv_money.begin_salesman is
'业务员';

comment on column begin_prerecv_money.begin_pay_money is
'预收金额';

comment on column begin_prerecv_money.remark is
'备注';

/*==============================================================*/
/* Index: begin_prerecv_money_PK                                */
/*==============================================================*/
create unique index begin_prerecv_money_PK on begin_prerecv_money (
id
);

/*==============================================================*/
/* Table: begin_recv_money                                      */
/*==============================================================*/
create table begin_recv_money (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   begin_date           DATE                 null,
   begin_customer       CHAR(24)             null,
   begin_money          NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_BEGIN_RECV_MONEY primary key (id)
);

comment on table begin_recv_money is
'期初应收款';

comment on column begin_recv_money.id is
'自动编号';

comment on column begin_recv_money.company_id is
'企业编号';

comment on column begin_recv_money.begin_date is
'期初日期';

comment on column begin_recv_money.begin_customer is
'客户名称';

comment on column begin_recv_money.begin_money is
'金额';

comment on column begin_recv_money.remark is
'备注';

/*==============================================================*/
/* Index: begin_recv_money_PK                                   */
/*==============================================================*/
create unique index begin_recv_money_PK on begin_recv_money (
id
);

/*==============================================================*/
/* Table: company                                               */
/*==============================================================*/
create table company (
   id                   CHAR(24)             not null,
   company_name         VARCHAR(32)          null,
   company_addr         VARCHAR(64)          null,
   reg_number           VARCHAR(64)          null,
   company_taxid        VARCHAR(32)          null,
   trade_area           VARCHAR(512)         null,
   reg_captita          VARCHAR(32)          null,
   major_good           VARCHAR(128)         null,
   legal_name           VARCHAR(16)          null,
   company_phone        VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   troop_id             CHAR(24)             null,
   troop_name           VARCHAR(32)          null,
   deadline             DATE                 null,
   quota                INT2                 null,
   status               INT2                 null,
   is_account           INT2                 null,
   add_timed            DATE                 null,
   constraint PK_COMPANY primary key (id)
);

comment on table company is
'基础企业';

comment on column company.id is
'自动编号';

comment on column company.company_name is
'企业名称';

comment on column company.company_addr is
'企业地址';

comment on column company.reg_number is
'营业执照';

comment on column company.company_taxid is
'税号';

comment on column company.trade_area is
'经营范围';

comment on column company.reg_captita is
'注册资本';

comment on column company.major_good is
'主营产品';

comment on column company.legal_name is
'法人代表';

comment on column company.company_phone is
'电话';

comment on column company.mobile_phone is
'手机';

comment on column company.troop_id is
'战队编号';

comment on column company.troop_name is
'战队名称';

comment on column company.deadline is
'过期时间';

comment on column company.quota is
'战队人数';

comment on column company.status is
'审核状态';

comment on column company.is_account is
'是否开帐';

comment on column company.add_timed is
'创建时间';

/*==============================================================*/
/* Index: company_PK                                            */
/*==============================================================*/
create unique index company_PK on company (
id
);

/*==============================================================*/
/* Table: currency                                              */
/*==============================================================*/
create table currency (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   code                 VARCHAR(32)          null,
   name                 VARCHAR(32)          null,
   rate                 FLOAT8               null,
   "natural"            BOOL                 null,
   constraint PK_CURRENCY primary key (id)
);

comment on table currency is
'会计币别表';

comment on column currency.id is
'自动编号';

comment on column currency.company_id is
'企业编号';

comment on column currency.code is
'编码';

comment on column currency.name is
'单位名称';

comment on column currency.rate is
'汇率';

comment on column currency."natural" is
'是否本位币';

/*==============================================================*/
/* Index: currency_PK                                           */
/*==============================================================*/
create unique index currency_PK on currency (
id
);

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   customer_name        VARCHAR(32)          null,
   customer_addr        VARCHAR(64)          null,
   bank_title           VARCHAR(128)         null,
   customer_account     VARCHAR(64)          null,
   customer_bank        VARCHAR(128)         null,
   customer_taxid       VARCHAR(32)          null,
   customer_contact     VARCHAR(32)          null,
   customer_phone       VARCHAR(32)          null,
   customer_type        INT2                 null,
   customer_receipt_addr VARCHAR(64)          null,
   in_credit            NUMERIC(10,4)        null,
   out_credit           NUMERIC(10,4)        null,
   begin_recv           NUMERIC(10,4)        null,
   begin_send           NUMERIC(10,4)        null,
   begin_reckon_recv    NUMERIC(10,4)        null,
   begin_reckon_send    NUMERIC(10,4)        null,
   location             VARCHAR(128)         null,
   status               INT2                 null,
   createDate           DATE                 null,
   constraint PK_CUSTOMER primary key (id)
);

comment on table customer is
'基础客户';

comment on column customer.id is
'自动编号';

comment on column customer.company_id is
'企业编号';

comment on column customer.customer_name is
'单位名称';

comment on column customer.customer_addr is
'地址';

comment on column customer.bank_title is
'银行户名';

comment on column customer.customer_account is
'帐号';

comment on column customer.customer_bank is
'开户行';

comment on column customer.customer_taxid is
'税号';

comment on column customer.customer_contact is
'联系人';

comment on column customer.customer_phone is
'联系电话';

comment on column customer.customer_type is
'客户类型(渠道|分销|批发|团购|企事业|其他)';

comment on column customer.customer_receipt_addr is
'收货地址';

comment on column customer.in_credit is
'应收款信用额度';

comment on column customer.out_credit is
'应付款信用额度';

comment on column customer.begin_recv is
'期初应收款';

comment on column customer.begin_send is
'期初应付款';

comment on column customer.begin_reckon_recv is
'期初预收款';

comment on column customer.begin_reckon_send is
'期初预付款';

comment on column customer.location is
'地理坐标';

comment on column customer.status is
'审核状态';

comment on column customer.createDate is
'创建时间';

/*==============================================================*/
/* Index: customer_PK                                           */
/*==============================================================*/
create unique index customer_PK on customer (
id
);

/*==============================================================*/
/* Table: customer_addr                                         */
/*==============================================================*/
create table customer_addr (
   id                   CHAR(24)             not null,
   this_id              CHAR(24)             null,
   customer_addr        VARCHAR(64)          null,
   constraint PK_CUSTOMER_ADDR primary key (id)
);

comment on table customer_addr is
'基础客户收货地址';

comment on column customer_addr.id is
'自动编号';

comment on column customer_addr.this_id is
'往来单位';

comment on column customer_addr.customer_addr is
'地址';

/*==============================================================*/
/* Index: customer_addr_PK                                      */
/*==============================================================*/
create unique index customer_addr_PK on customer_addr (
id
);

/*==============================================================*/
/* Table: cutomer_stores                                        */
/*==============================================================*/
create table cutomer_stores (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   stores_name          VARCHAR(32)          null,
   province             VARCHAR(32)          null,
   city                 VARCHAR(32)          null,
   area                 VARCHAR(32)          null,
   stores_addr          VARCHAR(32)          null,
   channel_type         VARCHAR(32)          null,
   stores_type          VARCHAR(32)          null,
   stores_system        VARCHAR(32)          null,
   stores_phone         VARCHAR(32)          null,
   add_timed            DATE                 null,
   constraint PK_CUTOMER_STORES primary key (id)
);

comment on table cutomer_stores is
'基础客户门店';

comment on column cutomer_stores.id is
'自动编号';

comment on column cutomer_stores.company_id is
'企业编号';

comment on column cutomer_stores.stores_name is
'门店名称';

comment on column cutomer_stores.province is
'省';

comment on column cutomer_stores.city is
'市';

comment on column cutomer_stores.area is
'区';

comment on column cutomer_stores.stores_addr is
'门店地址';

comment on column cutomer_stores.channel_type is
'渠道类型';

comment on column cutomer_stores.stores_type is
'门店类型';

comment on column cutomer_stores.stores_system is
'门店系统';

comment on column cutomer_stores.stores_phone is
'联系方式';

comment on column cutomer_stores.add_timed is
'创建时间';

/*==============================================================*/
/* Index: cutomer_stores_PK                                     */
/*==============================================================*/
create unique index cutomer_stores_PK on cutomer_stores (
id
);

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   depart_name          VARCHAR(32)          null,
   constraint PK_DEPARTMENT primary key (id)
);

comment on table department is
'基础部门';

comment on column department.id is
'自动编号';

comment on column department.company_id is
'企业编号';

comment on column department.depart_name is
'部门名称';

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
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   depot_id             VARCHAR(32)          null,
   depot_name           VARCHAR(32)          null,
   depot_addr           VARCHAR(64)          null,
   staff_id             CHAR(24)             null,
   staff_phone          VARCHAR(32)          null,
   constraint PK_DEPOT primary key (id)
);

comment on table depot is
'基础仓库';

comment on column depot.id is
'自动编号';

comment on column depot.company_id is
'企业编号';

comment on column depot.depot_id is
'仓库编号';

comment on column depot.depot_name is
'仓库名称';

comment on column depot.depot_addr is
'仓库地址';

comment on column depot.staff_id is
'联系人';

comment on column depot.staff_phone is
'联系方式';

/*==============================================================*/
/* Index: depot_PK                                              */
/*==============================================================*/
create unique index depot_PK on depot (
id
);

/*==============================================================*/
/* Table: depot_check                                           */
/*==============================================================*/
create table depot_check (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   check_date           DATE                 null,
   check_depot          CHAR(24)             null,
   remark               VARCHAR(512)         null,
   count_lucre          NUMERIC(10,4)        null,
   make_receipt         CHAR(24)             null,
   in_date              DATE                 null,
   status               INT2                 null,
   belong_receipt       CHAR(24)             null,
   constraint PK_DEPOT_CHECK primary key (id)
);

comment on table depot_check is
'库存盘点单';

comment on column depot_check.id is
'自动编号';

comment on column depot_check.company_id is
'企业编号';

comment on column depot_check.receipt_id is
'单据编号';

comment on column depot_check.check_date is
'盘点日期';

comment on column depot_check.check_depot is
'盘点仓库';

comment on column depot_check.remark is
'备注';

comment on column depot_check.count_lucre is
'合计金额';

comment on column depot_check.make_receipt is
'制单人';

comment on column depot_check.in_date is
'制单日期';

comment on column depot_check.status is
'审核状态';

comment on column depot_check.belong_receipt is
'上单人';

/*==============================================================*/
/* Index: depot_check_PK                                        */
/*==============================================================*/
create unique index depot_check_PK on depot_check (
id
);

/*==============================================================*/
/* Table: depot_goods_item                                      */
/*==============================================================*/
create table depot_goods_item (
   id                   CHAR(24)             not null,
   depot_id             VARCHAR(32)          null,
   good_id              CHAR(24)             null,
   depot_unit_price     NUMERIC(10,4)        null,
   big_amount           INT4                 null,
   big_money            NUMERIC(10,4)        null,
   middle_amount        INT4                 null,
   middle_money         NUMERIC(10,4)        null,
   small_amount         INT4                 null,
   samll_money          NUMERIC(10,4)        null,
   depot_money          NUMERIC(20,4)        null,
   constraint PK_DEPOT_GOODS_ITEM primary key (id)
);

comment on table depot_goods_item is
'库存商品表';

comment on column depot_goods_item.id is
'自动编号';

comment on column depot_goods_item.depot_id is
'仓库编号';

comment on column depot_goods_item.good_id is
'商品编号';

comment on column depot_goods_item.depot_unit_price is
'库存单价';

comment on column depot_goods_item.big_amount is
'大包装数量';

comment on column depot_goods_item.big_money is
'大包装单价';

comment on column depot_goods_item.middle_amount is
'中包装数量';

comment on column depot_goods_item.middle_money is
'中包装单价';

comment on column depot_goods_item.small_amount is
'小包装数量';

comment on column depot_goods_item.samll_money is
'小包装单价';

comment on column depot_goods_item.depot_money is
'库存总金额';

/*==============================================================*/
/* Index: depot_goods_item_PK                                   */
/*==============================================================*/
create unique index depot_goods_item_PK on depot_goods_item (
id
);

/*==============================================================*/
/* Table: depot_in                                              */
/*==============================================================*/
create table depot_in (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   this_id              CHAR(24)             null,
   this_addr            VARCHAR(64)          null,
   staff_id             CHAR(24)             null,
   contact_phone        VARCHAR(32)          null,
   count_lucre          NUMERIC(10,4)        null,
   in_date              DATE                 null,
   make_receipt         CHAR(24)             null,
   belong_receipt       CHAR(24)             null,
   in_depot             CHAR(24)             null,
   arrival_date         DATE                 null,
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

comment on column depot_in.receipt_id is
'单据编号';

comment on column depot_in.this_id is
'往来单位';

comment on column depot_in.this_addr is
'地址';

comment on column depot_in.staff_id is
'联系人';

comment on column depot_in.contact_phone is
'联系电话';

comment on column depot_in.count_lucre is
'合计金额';

comment on column depot_in.in_date is
'制单日期';

comment on column depot_in.make_receipt is
'制单人';

comment on column depot_in.belong_receipt is
'上单人';

comment on column depot_in.in_depot is
'到货仓库';

comment on column depot_in.arrival_date is
'到货日期';

comment on column depot_in.status is
'审核状态';

comment on column depot_in.remark is
'备注';

/*==============================================================*/
/* Index: depot_in_PK                                           */
/*==============================================================*/
create unique index depot_in_PK on depot_in (
id
);

/*==============================================================*/
/* Table: depot_limits                                          */
/*==============================================================*/
create table depot_limits (
   id                   CHAR(24)             not null,
   depot_id             VARCHAR(32)          null,
   good_id              CHAR(24)             null,
   big_upper            INT4                 null,
   big_lower            INT4                 null,
   big_optimal          INT4                 null,
   middle_upper         INT4                 null,
   middle_lower         INT4                 null,
   middle_optimal       INT4                 null,
   small_upper          INT4                 null,
   small_lower          INT4                 null,
   small_optimal        INT4                 null,
   constraint PK_DEPOT_LIMITS primary key (id)
);

comment on table depot_limits is
'库存上下限对照表';

comment on column depot_limits.id is
'自动编号';

comment on column depot_limits.depot_id is
'仓库编号';

comment on column depot_limits.good_id is
'商品编号';

comment on column depot_limits.big_upper is
'大包装上限';

comment on column depot_limits.big_lower is
'大包装下限';

comment on column depot_limits.big_optimal is
'大包装最佳存量';

comment on column depot_limits.middle_upper is
'中包装上限';

comment on column depot_limits.middle_lower is
'中包装下限';

comment on column depot_limits.middle_optimal is
'中包装最佳存量';

comment on column depot_limits.small_upper is
'小包装上限';

comment on column depot_limits.small_lower is
'小包装下限';

comment on column depot_limits.small_optimal is
'小包装最佳存量';

/*==============================================================*/
/* Index: depot_limits_PK                                       */
/*==============================================================*/
create unique index depot_limits_PK on depot_limits (
id
);

/*==============================================================*/
/* Table: depot_loss                                            */
/*==============================================================*/
create table depot_loss (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   loss_date            DATE                 null,
   loss_depot           CHAR(24)             null,
   count_lucre          NUMERIC(10,4)        null,
   make_receipt         CHAR(24)             null,
   in_date              DATE                 null,
   belong_receipt       CHAR(24)             null,
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

comment on column depot_loss.receipt_id is
'单据编号';

comment on column depot_loss.loss_date is
'报损日期';

comment on column depot_loss.loss_depot is
'报损仓库';

comment on column depot_loss.count_lucre is
'合计金额';

comment on column depot_loss.make_receipt is
'制单人';

comment on column depot_loss.in_date is
'制单日期';

comment on column depot_loss.belong_receipt is
'上单人';

comment on column depot_loss.status is
'审核状态';

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
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   move_date            DATE                 null,
   in_depot             CHAR(24)             null,
   in_depotaddr         VARCHAR(32)          null,
   depot_id             VARCHAR(32)          null,
   out_depotaddr        VARCHAR(32)          null,
   count_lucre          NUMERIC(10,4)        null,
   make_receipt         CHAR(24)             null,
   in_date              DATE                 null,
   belong_receipt       CHAR(24)             null,
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

comment on column depot_move.receipt_id is
'单据编号';

comment on column depot_move.move_date is
'调拨日期';

comment on column depot_move.in_depot is
'到货仓库';

comment on column depot_move.in_depotaddr is
'入库仓库地址';

comment on column depot_move.depot_id is
'仓库编号';

comment on column depot_move.out_depotaddr is
'出库仓库地址';

comment on column depot_move.count_lucre is
'合计金额';

comment on column depot_move.make_receipt is
'制单人';

comment on column depot_move.in_date is
'制单日期';

comment on column depot_move.belong_receipt is
'上单人';

comment on column depot_move.status is
'审核状态';

comment on column depot_move.remark is
'备注';

/*==============================================================*/
/* Index: depot_move_PK                                         */
/*==============================================================*/
create unique index depot_move_PK on depot_move (
id
);

/*==============================================================*/
/* Table: depot_mutual_goods_item                               */
/*==============================================================*/
create table depot_mutual_goods_item (
   id                   CHAR(24)             not null,
   parent_id            CHAR(24)             null,
   mutual_type          INT2                 null,
   good_id              CHAR(24)             null,
   good_priceid         CHAR(24)             null,
   good_name            VARCHAR(32)          null,
   barcode              VARCHAR(32)          null,
   formats              VARCHAR(32)          null,
   unit_type            INT2                 null,
   amount               INT4                 null,
   unit_price           NUMERIC(10,4)        null,
   lucre                NUMERIC(10,4)        null,
   discount             FLOAT                null,
   discount_price       NUMERIC(10,4)        null,
   discount_money       NUMERIC(10,4)        null,
   constraint PK_DEPOT_MUTUAL_GOODS_ITEM primary key (id)
);

comment on table depot_mutual_goods_item is
'库存交互商品';

comment on column depot_mutual_goods_item.id is
'自动编号';

comment on column depot_mutual_goods_item.parent_id is
'父类编号';

comment on column depot_mutual_goods_item.mutual_type is
'类型(0盘点1报损2报溢3调拨)';

comment on column depot_mutual_goods_item.good_id is
'商品编号';

comment on column depot_mutual_goods_item.good_priceid is
'价格编号';

comment on column depot_mutual_goods_item.good_name is
'商品名称';

comment on column depot_mutual_goods_item.barcode is
'商品条码';

comment on column depot_mutual_goods_item.formats is
'商品规格';

comment on column depot_mutual_goods_item.unit_type is
'单位类型(0小单位 1 中单位 2大单位)';

comment on column depot_mutual_goods_item.amount is
'数量';

comment on column depot_mutual_goods_item.unit_price is
'单价';

comment on column depot_mutual_goods_item.lucre is
'金额';

comment on column depot_mutual_goods_item.discount is
'折扣';

comment on column depot_mutual_goods_item.discount_price is
'折后单价';

comment on column depot_mutual_goods_item.discount_money is
'折后金额';

/*==============================================================*/
/* Index: depot_mutual_goods_item_PK                            */
/*==============================================================*/
create unique index depot_mutual_goods_item_PK on depot_mutual_goods_item (
id
);

/*==============================================================*/
/* Table: depot_out                                             */
/*==============================================================*/
create table depot_out (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   arrival_date         DATE                 null,
   this_id              CHAR(24)             null,
   this_addr            VARCHAR(32)          null,
   staff_id             CHAR(24)             null,
   contact_phone        VARCHAR(32)          null,
   count_lucre          NUMERIC(10,4)        null,
   in_date              DATE                 null,
   make_receipt         CHAR(24)             null,
   belong_receipt       CHAR(24)             null,
   depot_id             VARCHAR(32)          null,
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

comment on column depot_out.receipt_id is
'单据编号';

comment on column depot_out.arrival_date is
'到货日期';

comment on column depot_out.this_id is
'往来单位';

comment on column depot_out.this_addr is
'地址';

comment on column depot_out.staff_id is
'联系人';

comment on column depot_out.contact_phone is
'联系电话';

comment on column depot_out.count_lucre is
'合计金额';

comment on column depot_out.in_date is
'制单日期';

comment on column depot_out.make_receipt is
'制单人';

comment on column depot_out.belong_receipt is
'上单人';

comment on column depot_out.depot_id is
'仓库编号';

comment on column depot_out.status is
'审核状态';

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
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   profit_date          DATE                 null,
   profit_depot         CHAR(24)             null,
   count_lucre          NUMERIC(10,4)        null,
   make_receipt         CHAR(24)             null,
   in_date              DATE                 null,
   belong_receipt       CHAR(24)             null,
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

comment on column depot_profit.receipt_id is
'单据编号';

comment on column depot_profit.profit_date is
'报溢日期';

comment on column depot_profit.profit_depot is
'报溢仓库';

comment on column depot_profit.count_lucre is
'合计金额';

comment on column depot_profit.make_receipt is
'制单人';

comment on column depot_profit.in_date is
'制单日期';

comment on column depot_profit.belong_receipt is
'上单人';

comment on column depot_profit.status is
'审核状态';

comment on column depot_profit.remark is
'备注';

/*==============================================================*/
/* Index: depot_profit_PK                                       */
/*==============================================================*/
create unique index depot_profit_PK on depot_profit (
id
);

/*==============================================================*/
/* Table: depot_temp_goods_item                                 */
/*==============================================================*/
create table depot_temp_goods_item (
   id                   CHAR(24)             not null,
   parent_id            CHAR(24)             null,
   depot_type           INT2                 null,
   good_id              CHAR(24)             null,
   good_priceid         CHAR(24)             null,
   good_name            VARCHAR(32)          null,
   barcode              VARCHAR(32)          null,
   formats              VARCHAR(32)          null,
   unit_type            INT2                 null,
   amount               INT4                 null,
   unit_price           NUMERIC(10,4)        null,
   lucre                NUMERIC(10,4)        null,
   discount             FLOAT                null,
   discount_price       NUMERIC(10,4)        null,
   discount_money       NUMERIC(10,4)        null,
   constraint PK_DEPOT_TEMP_GOODS_ITEM primary key (id)
);

comment on table depot_temp_goods_item is
'库存出入库商品';

comment on column depot_temp_goods_item.id is
'自动编号';

comment on column depot_temp_goods_item.parent_id is
'父类编号';

comment on column depot_temp_goods_item.depot_type is
'类型(入库1 出库2)';

comment on column depot_temp_goods_item.good_id is
'商品编号';

comment on column depot_temp_goods_item.good_priceid is
'价格编号';

comment on column depot_temp_goods_item.good_name is
'商品名称';

comment on column depot_temp_goods_item.barcode is
'商品条码';

comment on column depot_temp_goods_item.formats is
'商品规格';

comment on column depot_temp_goods_item.unit_type is
'单位类型(0小单位 1 中单位 2大单位)';

comment on column depot_temp_goods_item.amount is
'数量';

comment on column depot_temp_goods_item.unit_price is
'单价';

comment on column depot_temp_goods_item.lucre is
'金额';

comment on column depot_temp_goods_item.discount is
'折扣';

comment on column depot_temp_goods_item.discount_price is
'折后单价';

comment on column depot_temp_goods_item.discount_money is
'折后金额';

/*==============================================================*/
/* Index: depot_temp_goods_item_PK                              */
/*==============================================================*/
create unique index depot_temp_goods_item_PK on depot_temp_goods_item (
id
);

/*==============================================================*/
/* Table: funds                                                 */
/*==============================================================*/
create table funds (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   funds_name           VARCHAR(32)          null,
   company_bank         VARCHAR(32)          null,
   company_bank_addr    VARCHAR(32)          null,
   company_account      VARCHAR(64)          null,
   funds_money          NUMERIC(10,4)        null,
   status               INT2                 null,
   constraint PK_FUNDS primary key (id)
);

comment on table funds is
'基础银行账户';

comment on column funds.id is
'自动编号';

comment on column funds.company_id is
'企业编号';

comment on column funds.funds_name is
'帐户名称';

comment on column funds.company_bank is
'开户行';

comment on column funds.company_bank_addr is
'开户行地址';

comment on column funds.company_account is
'账号';

comment on column funds.funds_money is
'金额';

comment on column funds.status is
'审核状态';

/*==============================================================*/
/* Index: funds_PK                                              */
/*==============================================================*/
create unique index funds_PK on funds (
id
);

/*==============================================================*/
/* Table: good_classify                                         */
/*==============================================================*/
create table good_classify (
   id                   CHAR(24)             not null,
   classify_name        VARCHAR(32)          null,
   parent_id            CHAR(24)             null,
   in_path              VARCHAR(128)         null,
   constraint PK_GOOD_CLASSIFY primary key (id)
);

comment on table good_classify is
'基础商品分类';

comment on column good_classify.id is
'自动编号';

comment on column good_classify.classify_name is
'分类名称';

comment on column good_classify.parent_id is
'父类编号';

comment on column good_classify.in_path is
'分层路径';

/*==============================================================*/
/* Index: good_classify_PK                                      */
/*==============================================================*/
create unique index good_classify_PK on good_classify (
id
);

/*==============================================================*/
/* Table: good_incode                                           */
/*==============================================================*/
create table good_incode (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   good_id              CHAR(24)             null,
   system_code          VARCHAR(32)          null,
   good_incode          VARCHAR(32)          null,
   constraint PK_GOOD_INCODE primary key (id)
);

comment on table good_incode is
'基础商品内码表';

comment on column good_incode.id is
'自动编号';

comment on column good_incode.company_id is
'企业编号';

comment on column good_incode.good_id is
'商品编号';

comment on column good_incode.system_code is
'系统编号';

comment on column good_incode.good_incode is
'系统商品内码';

/*==============================================================*/
/* Index: good_incode_PK                                        */
/*==============================================================*/
create unique index good_incode_PK on good_incode (
id
);

/*==============================================================*/
/* Table: good_price                                            */
/*==============================================================*/
create table good_price (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   good_id              CHAR(24)             null,
   unit_type            INT2                 null,
   buy_price            NUMERIC(10,4)        null,
   supply_price         NUMERIC(10,4)        null,
   retail_price         NUMERIC(10,4)        null,
   createDate           DATE                 null,
   constraint PK_GOOD_PRICE primary key (id)
);

comment on table good_price is
'基础商品价格';

comment on column good_price.id is
'自动编号';

comment on column good_price.company_id is
'企业编号';

comment on column good_price.good_id is
'商品编号';

comment on column good_price.unit_type is
'单位类型(0小单位 1 中单位 2大单位)';

comment on column good_price.buy_price is
'采购价';

comment on column good_price.supply_price is
'供货价';

comment on column good_price.retail_price is
'零售价';

comment on column good_price.createDate is
'创建时间';

/*==============================================================*/
/* Index: good_price_PK                                         */
/*==============================================================*/
create unique index good_price_PK on good_price (
id
);

/*==============================================================*/
/* Table: good_price_protect                                    */
/*==============================================================*/
create table good_price_protect (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   good_id              CHAR(24)             null,
   price_small          NUMERIC(10,4)        null,
   price_middle         NUMERIC(10,4)        null,
   price_big            NUMERIC(10,4)        null,
   isdefault            INT2                 null,
   constraint PK_GOOD_PRICE_PROTECT primary key (id)
);

comment on table good_price_protect is
'基础商品价格维护表';

comment on column good_price_protect.id is
'自动编号';

comment on column good_price_protect.company_id is
'企业编号';

comment on column good_price_protect.good_id is
'商品编号';

comment on column good_price_protect.price_small is
'小包装供价';

comment on column good_price_protect.price_middle is
'中包装供价';

comment on column good_price_protect.price_big is
'大包装供价';

comment on column good_price_protect.isdefault is
'默认设置';

/*==============================================================*/
/* Index: good_price_protect_PK                                 */
/*==============================================================*/
create unique index good_price_protect_PK on good_price_protect (
id
);

/*==============================================================*/
/* Table: good_unit                                             */
/*==============================================================*/
create table good_unit (
   id                   CHAR(24)             not null,
   name                 VARCHAR(32)          null,
   constraint PK_GOOD_UNIT primary key (id)
);

comment on table good_unit is
'基础商品单位';

comment on column good_unit.id is
'自动编号';

comment on column good_unit.name is
'单位名称';

/*==============================================================*/
/* Index: good_unit_PK                                          */
/*==============================================================*/
create unique index good_unit_PK on good_unit (
id
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods (
   id                   CHAR(24)             not null,
   good_name            VARCHAR(32)          null,
   barcode              VARCHAR(32)          null,
   formats              VARCHAR(32)          null,
   species              VARCHAR(32)          null,
   catid                CHAR(24)             null,
   good_brand           VARCHAR(32)          null,
   unit_small           CHAR(24)             null,
   unit_middle          CHAR(24)             null,
   unit_big             CHAR(24)             null,
   exchange             FLOAT8               null,
   goods_mark           VARCHAR(512)         null,
   constraint PK_GOODS primary key (id)
);

comment on table goods is
'基础商品';

comment on column goods.id is
'自动编号';

comment on column goods.good_name is
'商品名称';

comment on column goods.barcode is
'商品条码';

comment on column goods.formats is
'商品规格';

comment on column goods.species is
'商品品类';

comment on column goods.catid is
'商品种类';

comment on column goods.good_brand is
'商品品牌';

comment on column goods.unit_small is
'小包装单位';

comment on column goods.unit_middle is
'中包装单位';

comment on column goods.unit_big is
'大包装单位';

comment on column goods.exchange is
'换算系数';

comment on column goods.goods_mark is
'商品备注';

/*==============================================================*/
/* Index: goods_PK                                              */
/*==============================================================*/
create unique index goods_PK on goods (
id
);

/*==============================================================*/
/* Table: master_role                                           */
/*==============================================================*/
create table master_role (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   role_name            VARCHAR(32)          null,
   bewrite              VARCHAR(512)         null,
   action_str           VARCHAR(4096)        null,
   constraint PK_MASTER_ROLE primary key (id)
);

comment on table master_role is
'管理角色';

comment on column master_role.id is
'自动编号';

comment on column master_role.company_id is
'企业编号';

comment on column master_role.role_name is
'角色名称';

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
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   role_id              CHAR(24)             null,
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
'管理用户';

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
'审核状态';

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
   id                   CHAR(24)             not null,
   action_str           VARCHAR(4096)        null,
   action_name          VARCHAR(32)          null,
   action_url           VARCHAR(128)         null,
   parent_id            CHAR(24)             null,
   in_path              VARCHAR(128)         null,
   constraint PK_POWERS primary key (id)
);

comment on table powers is
'管理权限';

comment on column powers.id is
'自动编号';

comment on column powers.action_str is
'权限字符串';

comment on column powers.action_name is
'权限名称';

comment on column powers.action_url is
'网址链接';

comment on column powers.parent_id is
'父类编号';

comment on column powers.in_path is
'分层路径';

/*==============================================================*/
/* Index: powers_PK                                             */
/*==============================================================*/
create unique index powers_PK on powers (
id
);

/*==============================================================*/
/* Table: report_assets                                         */
/*==============================================================*/
create table report_assets (
   id                   CHAR(24)             not null,
   compnay_id           CHAR(24)             null,
   period               CHAR(2)              null,
   name                 VARCHAR(32)          null,
   rownum               INT2                 null,
   balance              NUMERIC(10,4)        null,
   prebalance           NUMERIC(10,4)        null,
   constraint PK_REPORT_ASSETS primary key (id)
);

comment on table report_assets is
'会计报表资产负债表';

comment on column report_assets.id is
'自动编号';

comment on column report_assets.compnay_id is
'企业编号';

comment on column report_assets.period is
'凭证期间';

comment on column report_assets.name is
'单位名称';

comment on column report_assets.rownum is
'行次';

comment on column report_assets.balance is
'本年累计金额';

comment on column report_assets.prebalance is
'本月累计金额';

/*==============================================================*/
/* Index: report_assets_PK                                      */
/*==============================================================*/
create unique index report_assets_PK on report_assets (
id
);

/*==============================================================*/
/* Table: report_assets_formula                                 */
/*==============================================================*/
create table report_assets_formula (
   company_id           CHAR(24)             not null,
   subject              INT4                 null,
   symbol               CHAR(1)              null,
   rule                 CHAR(1)              null,
   balance              NUMERIC(10,4)        null,
   prebalance           NUMERIC(10,4)        null,
   constraint PK_REPORT_ASSETS_FORMULA primary key (company_id)
);

comment on table report_assets_formula is
'会计报表资产负债表公式';

comment on column report_assets_formula.company_id is
'企业编号';

comment on column report_assets_formula.subject is
'项目';

comment on column report_assets_formula.symbol is
'运算方式';

comment on column report_assets_formula.rule is
'取数规则';

comment on column report_assets_formula.balance is
'本年累计金额';

comment on column report_assets_formula.prebalance is
'本月累计金额';

/*==============================================================*/
/* Index: report_assets_formula_PK                              */
/*==============================================================*/
create unique index report_assets_formula_PK on report_assets_formula (
company_id
);

/*==============================================================*/
/* Table: report_cash                                           */
/*==============================================================*/
create table report_cash (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   name                 VARCHAR(32)          null,
   rownum               INT2                 null,
   prebalance           NUMERIC(10,4)        null,
   balance              NUMERIC(10,4)        null,
   constraint PK_REPORT_CASH primary key (id)
);

comment on table report_cash is
'会计报表现金流量表';

comment on column report_cash.id is
'自动编号';

comment on column report_cash.company_id is
'企业编号';

comment on column report_cash.name is
'单位名称';

comment on column report_cash.rownum is
'行次';

comment on column report_cash.prebalance is
'本月累计金额';

comment on column report_cash.balance is
'本年累计金额';

/*==============================================================*/
/* Index: report_cash_PK                                        */
/*==============================================================*/
create unique index report_cash_PK on report_cash (
id
);

/*==============================================================*/
/* Table: report_profit                                         */
/*==============================================================*/
create table report_profit (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   name                 VARCHAR(32)          null,
   rownum               INT2                 null,
   balance              NUMERIC(10,4)        null,
   month_balance        NUMERIC(10,4)        null,
   constraint PK_REPORT_PROFIT primary key (id)
);

comment on table report_profit is
'会计报表利润表';

comment on column report_profit.id is
'自动编号';

comment on column report_profit.company_id is
'企业编号';

comment on column report_profit.name is
'单位名称';

comment on column report_profit.rownum is
'行次';

comment on column report_profit.balance is
'本年累计金额';

comment on column report_profit.month_balance is
'本月金额';

/*==============================================================*/
/* Index: report_profit_PK                                      */
/*==============================================================*/
create unique index report_profit_PK on report_profit (
id
);

/*==============================================================*/
/* Table: report_profit_formula                                 */
/*==============================================================*/
create table report_profit_formula (
   company_id           CHAR(24)             not null,
   subject              INT4                 null,
   symbol               CHAR(1)              null,
   beginning_balance    NUMERIC(10,4)        null,
   final_balance        NUMERIC(10,4)        null,
   constraint PK_REPORT_PROFIT_FORMULA primary key (company_id)
);

comment on table report_profit_formula is
'会计报表利润表公式';

comment on column report_profit_formula.company_id is
'企业编号';

comment on column report_profit_formula.subject is
'项目';

comment on column report_profit_formula.symbol is
'运算方式';

comment on column report_profit_formula.beginning_balance is
'本年累计金额';

comment on column report_profit_formula.final_balance is
'本月金额';

/*==============================================================*/
/* Index: report_profit_formula_PK                              */
/*==============================================================*/
create unique index report_profit_formula_PK on report_profit_formula (
company_id
);

/*==============================================================*/
/* Table: sell_appoint                                          */
/*==============================================================*/
create table sell_appoint (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   sell_orderid         VARCHAR(32)          null,
   depot_out            CHAR(24)             null,
   date_out             DATE                 null,
   status               INT2                 null,
   constraint PK_SELL_APPOINT primary key (id)
);

comment on table sell_appoint is
'销售派单';

comment on column sell_appoint.id is
'自动编号';

comment on column sell_appoint.company_id is
'企业编号';

comment on column sell_appoint.sell_orderid is
'订单编号';

comment on column sell_appoint.depot_out is
'出库仓库';

comment on column sell_appoint.date_out is
'出库日期';

comment on column sell_appoint.status is
'审核状态';

/*==============================================================*/
/* Index: sell_appoint_PK                                       */
/*==============================================================*/
create unique index sell_appoint_PK on sell_appoint (
id
);

/*==============================================================*/
/* Table: sell_goods_item                                       */
/*==============================================================*/
create table sell_goods_item (
   id                   CHAR(24)             not null,
   order_id             CHAR(10)             null,
   good_id              CHAR(24)             null,
   good_priceid         CHAR(24)             null,
   unit_type            INT2                 null,
   good_name            VARCHAR(32)          null,
   barcode              VARCHAR(32)          null,
   formats              VARCHAR(32)          null,
   amount               INT4                 null,
   unit_price           NUMERIC(10,4)        null,
   lucre                NUMERIC(10,4)        null,
   tax_rate             VARCHAR(30)          null,
   tax                  NUMERIC(10,4)        null,
   out_tax              NUMERIC(10,4)        null,
   is_appoint           INT2                 null,
   waive                INT2                 null,
   is_arrival           INT2                 null,
   constraint PK_SELL_GOODS_ITEM primary key (id)
);

comment on table sell_goods_item is
'销售商品细目';

comment on column sell_goods_item.id is
'自动编号';

comment on column sell_goods_item.order_id is
'订单编号';

comment on column sell_goods_item.good_id is
'商品编号';

comment on column sell_goods_item.good_priceid is
'价格编号';

comment on column sell_goods_item.unit_type is
'单位类型(0小单位 1 中单位 2大单位)';

comment on column sell_goods_item.good_name is
'商品名称';

comment on column sell_goods_item.barcode is
'商品条码';

comment on column sell_goods_item.formats is
'商品规格';

comment on column sell_goods_item.amount is
'数量';

comment on column sell_goods_item.unit_price is
'单价';

comment on column sell_goods_item.lucre is
'金额';

comment on column sell_goods_item.tax_rate is
'税率';

comment on column sell_goods_item.tax is
'税额';

comment on column sell_goods_item.out_tax is
'不含税金额';

comment on column sell_goods_item.is_appoint is
'是否派单(0未派单1已派单)';

comment on column sell_goods_item.waive is
'是否放弃(0未放弃1已放弃)';

comment on column sell_goods_item.is_arrival is
'是否到货(0未到货1已到货)';

/*==============================================================*/
/* Index: sell_goods_item_PK                                    */
/*==============================================================*/
create unique index sell_goods_item_PK on sell_goods_item (
id
);

/*==============================================================*/
/* Table: sell_ingood                                           */
/*==============================================================*/
create table sell_ingood (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   send_id              CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   status               INT2                 null,
   customer_name        VARCHAR(32)          null,
   customer_addr        VARCHAR(64)          null,
   staff_id             CHAR(24)             null,
   in_date              DATE                 null,
   depot_id             VARCHAR(32)          null,
   constraint PK_SELL_INGOOD primary key (id)
);

comment on table sell_ingood is
'销售到货';

comment on column sell_ingood.id is
'自动编号';

comment on column sell_ingood.company_id is
'企业编号';

comment on column sell_ingood.send_id is
'发货编号';

comment on column sell_ingood.receipt_id is
'单据编号';

comment on column sell_ingood.status is
'审核状态';

comment on column sell_ingood.customer_name is
'单位名称';

comment on column sell_ingood.customer_addr is
'地址';

comment on column sell_ingood.staff_id is
'联系人';

comment on column sell_ingood.in_date is
'制单日期';

comment on column sell_ingood.depot_id is
'仓库编号';

/*==============================================================*/
/* Index: sell_ingood_PK                                        */
/*==============================================================*/
create unique index sell_ingood_PK on sell_ingood (
id
);

/*==============================================================*/
/* Table: sell_invoice                                          */
/*==============================================================*/
create table sell_invoice (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   ticket_date          DATE                 null,
   invoice_sn           VARCHAR(32)          null,
   customer_name        VARCHAR(32)          null,
   ticket_type          INT4                 null,
   invoice_header       VARCHAR(32)          null,
   invoice_body         VARCHAR(512)         null,
   ticket_money         NUMERIC(10,4)        null,
   ticket_remoney       NUMERIC(10,4)        null,
   ticket_billing       NUMERIC(10,4)        null,
   this_receipt_money   NUMERIC(10,4)        null,
   status               INT2                 null,
   constraint PK_SELL_INVOICE primary key (id)
);

comment on table sell_invoice is
'财务-销售票据';

comment on column sell_invoice.id is
'自动编号';

comment on column sell_invoice.company_id is
'企业编号';

comment on column sell_invoice.ticket_date is
'开票日期';

comment on column sell_invoice.invoice_sn is
'发票/单据编号';

comment on column sell_invoice.customer_name is
'单位名称';

comment on column sell_invoice.ticket_type is
'开票类型(发票,单据)';

comment on column sell_invoice.invoice_header is
'发票抬头';

comment on column sell_invoice.invoice_body is
'发票内容';

comment on column sell_invoice.ticket_money is
'销售金额';

comment on column sell_invoice.ticket_remoney is
'已收金额';

comment on column sell_invoice.ticket_billing is
'已开票金额';

comment on column sell_invoice.this_receipt_money is
'本次开票金额';

comment on column sell_invoice.status is
'审核状态';

/*==============================================================*/
/* Index: sell_invoice_PK                                       */
/*==============================================================*/
create unique index sell_invoice_PK on sell_invoice (
id
);

/*==============================================================*/
/* Table: sell_invoice_item                                     */
/*==============================================================*/
create table sell_invoice_item (
   id                   CHAR(24)             not null,
   parent_id            CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   send_id              CHAR(24)             null,
   in_date              DATE                 null,
   sell_money           NUMERIC(10,4)        null,
   sell_remoney         NUMERIC(10,4)        null,
   sell_billing         NUMERIC(10,4)        null,
   this_receipt_money   NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_SELL_INVOICE_ITEM primary key (id)
);

comment on table sell_invoice_item is
'财务-销售票据细目';

comment on column sell_invoice_item.id is
'自动编号';

comment on column sell_invoice_item.parent_id is
'父类编号';

comment on column sell_invoice_item.receipt_id is
'单据编号';

comment on column sell_invoice_item.send_id is
'发货编号';

comment on column sell_invoice_item.in_date is
'制单日期';

comment on column sell_invoice_item.sell_money is
'销售金额';

comment on column sell_invoice_item.sell_remoney is
'已收金额';

comment on column sell_invoice_item.sell_billing is
'已开票金额';

comment on column sell_invoice_item.this_receipt_money is
'本次开票金额';

comment on column sell_invoice_item.remark is
'备注';

/*==============================================================*/
/* Index: sell_invoice_item_PK                                  */
/*==============================================================*/
create unique index sell_invoice_item_PK on sell_invoice_item (
id
);

/*==============================================================*/
/* Table: sell_order                                            */
/*==============================================================*/
create table sell_order (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   move_date            DATE                 null,
   receipt_id           VARCHAR(32)          null,
   this_id              CHAR(24)             null,
   send_addr            VARCHAR(32)          null,
   staff_id             CHAR(24)             null,
   contact_phone        VARCHAR(32)          null,
   count_goods          INT4                 null,
   count_lucre          NUMERIC(10,4)        null,
   make_receipt         CHAR(24)             null,
   belong_receipt       CHAR(24)             null,
   check_receipt        VARCHAR(32)          null,
   order_phone          VARCHAR(32)          null,
   settle_method        INT2                 null,
   status               INT2                 null,
   constraint PK_SELL_ORDER primary key (id)
);

comment on table sell_order is
'销售订单';

comment on column sell_order.id is
'自动编号';

comment on column sell_order.company_id is
'企业编号';

comment on column sell_order.move_date is
'调拨日期';

comment on column sell_order.receipt_id is
'单据编号';

comment on column sell_order.this_id is
'往来单位';

comment on column sell_order.send_addr is
'送货地址';

comment on column sell_order.staff_id is
'联系人';

comment on column sell_order.contact_phone is
'联系电话';

comment on column sell_order.count_goods is
'商品总数';

comment on column sell_order.count_lucre is
'合计金额';

comment on column sell_order.make_receipt is
'制单人';

comment on column sell_order.belong_receipt is
'上单人';

comment on column sell_order.check_receipt is
'审核人';

comment on column sell_order.order_phone is
'订货电话';

comment on column sell_order.settle_method is
'结算方式';

comment on column sell_order.status is
'审核状态';

/*==============================================================*/
/* Index: sell_order_PK                                         */
/*==============================================================*/
create unique index sell_order_PK on sell_order (
id
);

/*==============================================================*/
/* Table: sell_recv                                             */
/*==============================================================*/
create table sell_recv (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   in_date              DATE                 null,
   this_id              CHAR(24)             null,
   in_method            INT2                 null,
   fund_id              CHAR(24)             null,
   pre_payin_count      NUMERIC(10,4)        null,
   payin_count          NUMERIC(10,4)        null,
   rebate_count         NUMERIC(10,4)        null,
   this_pay_money       NUMERIC(10,4)        null,
   ispay                INT2                 null,
   staff_id             CHAR(24)             null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_SELL_RECV primary key (id)
);

comment on table sell_recv is
'财务-销售收款单';

comment on column sell_recv.id is
'自动编号';

comment on column sell_recv.company_id is
'企业编号';

comment on column sell_recv.receipt_id is
'单据编号';

comment on column sell_recv.in_date is
'制单日期';

comment on column sell_recv.this_id is
'往来单位';

comment on column sell_recv.in_method is
'结算方式';

comment on column sell_recv.fund_id is
'收款帐户';

comment on column sell_recv.pre_payin_count is
'预收款合计';

comment on column sell_recv.payin_count is
'应收款合计';

comment on column sell_recv.rebate_count is
'折扣金额合计';

comment on column sell_recv.this_pay_money is
'本次收款金额';

comment on column sell_recv.ispay is
'是否预付款支付';

comment on column sell_recv.staff_id is
'联系人';

comment on column sell_recv.status is
'审核状态';

comment on column sell_recv.remark is
'备注';

/*==============================================================*/
/* Index: sell_recv_PK                                          */
/*==============================================================*/
create unique index sell_recv_PK on sell_recv (
id
);

/*==============================================================*/
/* Table: sell_recv_item                                        */
/*==============================================================*/
create table sell_recv_item (
   id                   CHAR(24)             not null,
   parent_id            CHAR(24)             null,
   company_id           CHAR(24)             null,
   send_id              CHAR(24)             null,
   in_date              DATE                 null,
   payin                NUMERIC(10,4)        null,
   re_payin             NUMERIC(10,4)        null,
   no_payin             NUMERIC(10,4)        null,
   rebate               NUMERIC(10,4)        null,
   receipt_id           VARCHAR(32)          null,
   remark               VARCHAR(512)         null,
   constraint PK_SELL_RECV_ITEM primary key (id)
);

comment on table sell_recv_item is
'财务-销售收款细目';

comment on column sell_recv_item.id is
'自动编号';

comment on column sell_recv_item.parent_id is
'父类编号';

comment on column sell_recv_item.company_id is
'企业编号';

comment on column sell_recv_item.send_id is
'发货编号';

comment on column sell_recv_item.in_date is
'制单日期';

comment on column sell_recv_item.payin is
'应收款金额';

comment on column sell_recv_item.re_payin is
'已收款金额';

comment on column sell_recv_item.no_payin is
'未收款金额';

comment on column sell_recv_item.rebate is
'本次折扣';

comment on column sell_recv_item.receipt_id is
'单据编号';

comment on column sell_recv_item.remark is
'备注';

/*==============================================================*/
/* Index: sell_recv_item_PK                                     */
/*==============================================================*/
create unique index sell_recv_item_PK on sell_recv_item (
id
);

/*==============================================================*/
/* Table: sell_send_item                                        */
/*==============================================================*/
create table sell_send_item (
   id                   CHAR(24)             not null,
   sell_sendid          CHAR(24)             null,
   good_id              CHAR(24)             null,
   barcode              VARCHAR(32)          null,
   good_name            VARCHAR(32)          null,
   good_priceid         CHAR(24)             null,
   amount               INT4                 null,
   constraint PK_SELL_SEND_ITEM primary key (id)
);

comment on table sell_send_item is
'销售发货商品细目';

comment on column sell_send_item.id is
'自动编号';

comment on column sell_send_item.sell_sendid is
'发货单编号';

comment on column sell_send_item.good_id is
'商品编号';

comment on column sell_send_item.barcode is
'商品条码';

comment on column sell_send_item.good_name is
'商品名称';

comment on column sell_send_item.good_priceid is
'价格编号';

comment on column sell_send_item.amount is
'数量';

/*==============================================================*/
/* Index: sell_send_item_PK                                     */
/*==============================================================*/
create unique index sell_send_item_PK on sell_send_item (
id
);

/*==============================================================*/
/* Table: sell_send_plan                                        */
/*==============================================================*/
create table sell_send_plan (
   id                   CHAR(24)             not null,
   sell_sendid          CHAR(24)             null,
   sell_orderid         VARCHAR(32)          null,
   sell_receiptid       VARCHAR(32)          null,
   customer_name        VARCHAR(32)          null,
   customer_addr        VARCHAR(64)          null,
   staff_id             CHAR(24)             null,
   in_date              DATE                 null,
   constraint PK_SELL_SEND_PLAN primary key (id)
);

comment on table sell_send_plan is
'销售发货计划详情';

comment on column sell_send_plan.id is
'自动编号';

comment on column sell_send_plan.sell_sendid is
'发货单编号';

comment on column sell_send_plan.sell_orderid is
'订单编号';

comment on column sell_send_plan.sell_receiptid is
'单据编号';

comment on column sell_send_plan.customer_name is
'单位名称';

comment on column sell_send_plan.customer_addr is
'地址';

comment on column sell_send_plan.staff_id is
'联系人';

comment on column sell_send_plan.in_date is
'制单日期';

/*==============================================================*/
/* Index: sell_send_plan_PK                                     */
/*==============================================================*/
create unique index sell_send_plan_PK on sell_send_plan (
id
);

/*==============================================================*/
/* Table: sell_sendgood                                         */
/*==============================================================*/
create table sell_sendgood (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   appoint              VARCHAR(32)          null,
   vehicle              VARCHAR(32)          null,
   send_date            DATE                 null,
   amount               INT4                 null,
   make_receipt         CHAR(24)             null,
   status               INT2                 null,
   constraint PK_SELL_SENDGOOD primary key (id)
);

comment on table sell_sendgood is
'销售发货';

comment on column sell_sendgood.id is
'自动编号';

comment on column sell_sendgood.company_id is
'企业编号';

comment on column sell_sendgood.appoint is
'派单编号';

comment on column sell_sendgood.vehicle is
'发货车辆';

comment on column sell_sendgood.send_date is
'发货日期';

comment on column sell_sendgood.amount is
'数量';

comment on column sell_sendgood.make_receipt is
'制单人';

comment on column sell_sendgood.status is
'审核状态';

/*==============================================================*/
/* Index: sell_sendgood_PK                                      */
/*==============================================================*/
create unique index sell_sendgood_PK on sell_sendgood (
id
);

/*==============================================================*/
/* Table: staff                                                 */
/*==============================================================*/
create table staff (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   staff_name           VARCHAR(32)          null,
   sex                  INT2                 null,
   birth                DATE                 null,
   staff_phone          VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   email                VARCHAR(32)          null,
   alias                VARCHAR(32)          null,
   mid                  VARCHAR(32)          null,
   avatar               VARCHAR(128)         null,
   invitation           INT2                 null,
   invitationDate       DATE                 null,
   activated            INT2                 null,
   activatedDate        DATE                 null,
   binding              INT2                 null,
   status               INT2                 null,
   clientid             VARCHAR(64)          null,
   createDate           DATE                 null,
   constraint PK_STAFF primary key (id)
);

comment on table staff is
'基础员工';

comment on column staff.id is
'自动编号';

comment on column staff.company_id is
'企业编号';

comment on column staff.staff_name is
'员工名称';

comment on column staff.sex is
'性别';

comment on column staff.birth is
'出生日期';

comment on column staff.staff_phone is
'联系方式';

comment on column staff.mobile_phone is
'手机';

comment on column staff.email is
'邮箱';

comment on column staff.alias is
'别名';

comment on column staff.mid is
'手机端ID';

comment on column staff.avatar is
'手机端头像';

comment on column staff.invitation is
'自主注册';

comment on column staff.invitationDate is
'邀请时间';

comment on column staff.activated is
'激活状态';

comment on column staff.activatedDate is
'激活时间';

comment on column staff.binding is
'绑定状态';

comment on column staff.status is
'审核状态';

comment on column staff.clientid is
'个推id';

comment on column staff.createDate is
'创建时间';

/*==============================================================*/
/* Index: staff_PK                                              */
/*==============================================================*/
create unique index staff_PK on staff (
id
);

/*==============================================================*/
/* Table: stock_goods_item                                      */
/*==============================================================*/
create table stock_goods_item (
   id                   CHAR(24)             not null,
   order_id             CHAR(10)             null,
   good_id              CHAR(24)             null,
   good_priceid         CHAR(24)             null,
   unit_type            INT2                 null,
   good_name            VARCHAR(32)          null,
   barcode              VARCHAR(32)          null,
   formats              VARCHAR(32)          null,
   amount               INT4                 null,
   unit_price           NUMERIC(10,4)        null,
   lucre                NUMERIC(10,4)        null,
   tax_rate             VARCHAR(30)          null,
   tax                  NUMERIC(10,4)        null,
   out_tax              NUMERIC(10,4)        null,
   waive                INT2                 null,
   is_in_depot          INT2                 null,
   is_arrival           INT2                 null,
   constraint PK_STOCK_GOODS_ITEM primary key (id)
);

comment on table stock_goods_item is
'采购商品细目';

comment on column stock_goods_item.id is
'自动编号';

comment on column stock_goods_item.order_id is
'订单编号';

comment on column stock_goods_item.good_id is
'商品编号';

comment on column stock_goods_item.good_priceid is
'价格编号';

comment on column stock_goods_item.unit_type is
'单位类型(0小单位 1 中单位 2大单位)';

comment on column stock_goods_item.good_name is
'商品名称';

comment on column stock_goods_item.barcode is
'商品条码';

comment on column stock_goods_item.formats is
'商品规格';

comment on column stock_goods_item.amount is
'数量';

comment on column stock_goods_item.unit_price is
'单价';

comment on column stock_goods_item.lucre is
'金额';

comment on column stock_goods_item.tax_rate is
'税率';

comment on column stock_goods_item.tax is
'税额';

comment on column stock_goods_item.out_tax is
'不含税金额';

comment on column stock_goods_item.waive is
'是否放弃(0未放弃1已放弃)';

comment on column stock_goods_item.is_in_depot is
'是否入库(0未入库1已入库)';

comment on column stock_goods_item.is_arrival is
'是否到货(0未到货1已到货)';

/*==============================================================*/
/* Index: stock_goods_item_PK                                   */
/*==============================================================*/
create unique index stock_goods_item_PK on stock_goods_item (
id
);

/*==============================================================*/
/* Table: stock_in                                              */
/*==============================================================*/
create table stock_in (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   orderid              CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   this_id              CHAR(24)             null,
   this_addr            VARCHAR(64)          null,
   staff_id             CHAR(24)             null,
   status               INT2                 null,
   stock_date           DATE                 null,
   constraint PK_STOCK_IN primary key (id)
);

comment on table stock_in is
'采购到货单';

comment on column stock_in.id is
'自动编号';

comment on column stock_in.company_id is
'企业编号';

comment on column stock_in.orderid is
'订单编号';

comment on column stock_in.receipt_id is
'单据编号';

comment on column stock_in.this_id is
'往来单位';

comment on column stock_in.this_addr is
'地址';

comment on column stock_in.staff_id is
'联系人';

comment on column stock_in.status is
'审核状态';

comment on column stock_in.stock_date is
'采购日期';

/*==============================================================*/
/* Index: stock_in_PK                                           */
/*==============================================================*/
create unique index stock_in_PK on stock_in (
id
);

/*==============================================================*/
/* Table: stock_invoice                                         */
/*==============================================================*/
create table stock_invoice (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   ticket_date          DATE                 null,
   ticket_type          INT4                 null,
   invoice_header       VARCHAR(32)          null,
   invoice_body         VARCHAR(512)         null,
   supplier_name        VARCHAR(32)          null,
   invoice_sn           VARCHAR(32)          null,
   ticket_money         NUMERIC(10,4)        null,
   ticket_remoney       NUMERIC(10,4)        null,
   ticket_billing       NUMERIC(10,4)        null,
   this_receipt_money   NUMERIC(10,4)        null,
   status               INT2                 null,
   constraint PK_STOCK_INVOICE primary key (id)
);

comment on table stock_invoice is
'财务-采购票据';

comment on column stock_invoice.id is
'自动编号';

comment on column stock_invoice.company_id is
'企业编号';

comment on column stock_invoice.ticket_date is
'开票日期';

comment on column stock_invoice.ticket_type is
'开票类型(发票,单据)';

comment on column stock_invoice.invoice_header is
'发票抬头';

comment on column stock_invoice.invoice_body is
'发票内容';

comment on column stock_invoice.supplier_name is
'单位名称';

comment on column stock_invoice.invoice_sn is
'发票/单据编号';

comment on column stock_invoice.ticket_money is
'销售金额';

comment on column stock_invoice.ticket_remoney is
'已收金额';

comment on column stock_invoice.ticket_billing is
'已开票金额';

comment on column stock_invoice.this_receipt_money is
'本次开票金额';

comment on column stock_invoice.status is
'审核状态';

/*==============================================================*/
/* Index: stock_invoice_PK                                      */
/*==============================================================*/
create unique index stock_invoice_PK on stock_invoice (
id
);

/*==============================================================*/
/* Table: stock_invoice_item                                    */
/*==============================================================*/
create table stock_invoice_item (
   id                   CHAR(24)             not null,
   parent_id            CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   in_id                CHAR(24)             null,
   in_date              DATE                 null,
   buy_money            NUMERIC(10,4)        null,
   buy_remoney          NUMERIC(10,4)        null,
   buy_billing          NUMERIC(10,4)        null,
   this_receipt_money   NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_STOCK_INVOICE_ITEM primary key (id)
);

comment on table stock_invoice_item is
'财务-采购票据细目';

comment on column stock_invoice_item.id is
'自动编号';

comment on column stock_invoice_item.parent_id is
'父类编号';

comment on column stock_invoice_item.receipt_id is
'单据编号';

comment on column stock_invoice_item.in_id is
'到货单编号';

comment on column stock_invoice_item.in_date is
'制单日期';

comment on column stock_invoice_item.buy_money is
'采购金额';

comment on column stock_invoice_item.buy_remoney is
'已收金额';

comment on column stock_invoice_item.buy_billing is
'已开票金额';

comment on column stock_invoice_item.this_receipt_money is
'本次开票金额';

comment on column stock_invoice_item.remark is
'备注';

/*==============================================================*/
/* Index: stock_invoice_item_PK                                 */
/*==============================================================*/
create unique index stock_invoice_item_PK on stock_invoice_item (
id
);

/*==============================================================*/
/* Table: stock_order                                           */
/*==============================================================*/
create table stock_order (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   move_date            DATE                 null,
   receipt_id           VARCHAR(32)          null,
   this_id              CHAR(24)             null,
   contact_phone        VARCHAR(32)          null,
   contact_man          VARCHAR(32)          null,
   buyer_addr           VARCHAR(32)          null,
   check_receipt        VARCHAR(32)          null,
   count_goods          INT4                 null,
   count_lucre          NUMERIC(10,4)        null,
   make_receipt         CHAR(24)             null,
   belong_receipt       CHAR(24)             null,
   settle_method        INT2                 null,
   status               INT2                 null,
   constraint PK_STOCK_ORDER primary key (id)
);

comment on table stock_order is
'采购订单';

comment on column stock_order.id is
'自动编号';

comment on column stock_order.company_id is
'企业编号';

comment on column stock_order.move_date is
'调拨日期';

comment on column stock_order.receipt_id is
'单据编号';

comment on column stock_order.this_id is
'往来单位';

comment on column stock_order.contact_phone is
'联系电话';

comment on column stock_order.contact_man is
'联系人';

comment on column stock_order.buyer_addr is
'地址';

comment on column stock_order.check_receipt is
'审核人';

comment on column stock_order.count_goods is
'商品总数';

comment on column stock_order.count_lucre is
'合计金额';

comment on column stock_order.make_receipt is
'制单人';

comment on column stock_order.belong_receipt is
'上单人';

comment on column stock_order.settle_method is
'结算方式';

comment on column stock_order.status is
'审核状态';

/*==============================================================*/
/* Index: stock_order_PK                                        */
/*==============================================================*/
create unique index stock_order_PK on stock_order (
id
);

/*==============================================================*/
/* Table: stock_pay                                             */
/*==============================================================*/
create table stock_pay (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   receipt_id           VARCHAR(32)          null,
   out_date             DATE                 null,
   this_id              CHAR(24)             null,
   in_method            INT2                 null,
   fund_id              CHAR(24)             null,
   pre_payout_count     NUMERIC(10,4)        null,
   payout_count         NUMERIC(10,4)        null,
   rebate_count         NUMERIC(10,4)        null,
   this_pay_money       NUMERIC(10,4)        null,
   ispay                INT2                 null,
   staff_id             CHAR(24)             null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_STOCK_PAY primary key (id)
);

comment on table stock_pay is
'财务-采购付款';

comment on column stock_pay.id is
'自动编号';

comment on column stock_pay.company_id is
'企业编号';

comment on column stock_pay.receipt_id is
'单据编号';

comment on column stock_pay.out_date is
'付款日期';

comment on column stock_pay.this_id is
'往来单位';

comment on column stock_pay.in_method is
'结算方式';

comment on column stock_pay.fund_id is
'收款帐户';

comment on column stock_pay.pre_payout_count is
'预付款合计';

comment on column stock_pay.payout_count is
'应付款合计';

comment on column stock_pay.rebate_count is
'折扣金额合计';

comment on column stock_pay.this_pay_money is
'本次收款金额';

comment on column stock_pay.ispay is
'是否预付款支付';

comment on column stock_pay.staff_id is
'联系人';

comment on column stock_pay.status is
'审核状态';

comment on column stock_pay.remark is
'备注';

/*==============================================================*/
/* Index: stock_pay_PK                                          */
/*==============================================================*/
create unique index stock_pay_PK on stock_pay (
id
);

/*==============================================================*/
/* Table: stock_pay_item                                        */
/*==============================================================*/
create table stock_pay_item (
   id                   CHAR(24)             not null,
   parent_id            CHAR(24)             null,
   in_id                CHAR(24)             null,
   in_date              DATE                 null,
   payout               NUMERIC(10,4)        null,
   re_payout            NUMERIC(10,4)        null,
   no_payout            NUMERIC(10,4)        null,
   rebate               NUMERIC(10,4)        null,
   receipt_id           VARCHAR(32)          null,
   remark               VARCHAR(512)         null,
   constraint PK_STOCK_PAY_ITEM primary key (id)
);

comment on table stock_pay_item is
'财务-采购付款细目';

comment on column stock_pay_item.id is
'自动编号';

comment on column stock_pay_item.parent_id is
'父类编号';

comment on column stock_pay_item.in_id is
'到货单编号';

comment on column stock_pay_item.in_date is
'制单日期';

comment on column stock_pay_item.payout is
'应付款金额';

comment on column stock_pay_item.re_payout is
'已付款金额';

comment on column stock_pay_item.no_payout is
'未付款金额';

comment on column stock_pay_item.rebate is
'本次折扣';

comment on column stock_pay_item.receipt_id is
'单据编号';

comment on column stock_pay_item.remark is
'备注';

/*==============================================================*/
/* Index: stock_pay_item_PK                                     */
/*==============================================================*/
create unique index stock_pay_item_PK on stock_pay_item (
id
);

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
create table subject (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   placcuontId          INT4                 null,
   limited              INT4                 null,
   root_id              CHAR(24)             null,
   parent_id            CHAR(24)             null,
   group_id             INT4                 null,
   group_name           VARCHAR(32)          null,
   class_id             INT4                 null,
   helperCode           VARCHAR(32)          null,
   number               INT4                 null,
   name                 VARCHAR(32)          null,
   full_name            VARCHAR(32)          null,
   detail               INT2                 null,
   detailType           VARCHAR(12)          null,
   isBank               BOOL                 null,
   dc                   INT2                 null,
   dcType               VARCHAR(12)          null,
   level                INT4                 null,
   isItem               BOOL                 null,
   dept                 INT4                 null,
   supplier             INT4                 null,
   custom               INT4                 null,
   emp                  INT4                 null,
   project              INT4                 null,
   inventory            INT4                 null,
   itemClassID          INT4                 null,
   itemClassName        VARCHAR(32)          null,
   isQtyaux             BOOL                 null,
   unit                 VARCHAR(32)          null,
   isCur                BOOL                 null,
   cur                  VARCHAR(12)          null,
   isCash               BOOL                 null,
   isRateadj            BOOL                 null,
   isJrnl               BOOL                 null,
   isLast               BOOL                 null,
   isDelete             BOOL                 null,
   isTrans              BOOL                 null,
   is_used              INT2                 null,
   is_customer          INT2                 null,
   constraint PK_SUBJECT primary key (id)
);

comment on table subject is
'会计科目表';

comment on column subject.id is
'自动编号';

comment on column subject.company_id is
'企业编号';

comment on column subject.placcuontId is
'未知';

comment on column subject.limited is
'限定/非限定';

comment on column subject.root_id is
'根类别';

comment on column subject.parent_id is
'父类编号';

comment on column subject.group_id is
'科目类别-例:101';

comment on column subject.group_name is
'科目类别名称-例:流动资产';

comment on column subject.class_id is
'资源编号-资产 负债 权益 成本 损益';

comment on column subject.helperCode is
'科目助记码';

comment on column subject.number is
'凭证号';

comment on column subject.name is
'单位名称';

comment on column subject.full_name is
'科目全名';

comment on column subject.detail is
'是否明细';

comment on column subject.detailType is
'是否明细名称-是/否';

comment on column subject.isBank is
'银行类科目';

comment on column subject.dc is
'借贷方向';

comment on column subject.dcType is
'余额方向名称 借/贷';

comment on column subject.level is
'科目层级';

comment on column subject.isItem is
'辅助核算';

comment on column subject.dept is
'部门';

comment on column subject.supplier is
'供应商';

comment on column subject.custom is
'客户';

comment on column subject.emp is
'职员';

comment on column subject.project is
'项目';

comment on column subject.inventory is
'存货';

comment on column subject.itemClassID is
'辅助分类编号';

comment on column subject.itemClassName is
'辅助分类名称';

comment on column subject.isQtyaux is
'数量核算';

comment on column subject.unit is
'单位';

comment on column subject.isCur is
'外币核算';

comment on column subject.cur is
'外币';

comment on column subject.isCash is
'现金类科目';

comment on column subject.isRateadj is
'期末调汇';

comment on column subject.isJrnl is
'isJrnl';

comment on column subject.isLast is
'isLast';

comment on column subject.isDelete is
'isDelete';

comment on column subject.isTrans is
'是否往来核算';

comment on column subject.is_used is
'是否有业务发生';

comment on column subject.is_customer is
'是否用户添加';

/*==============================================================*/
/* Index: subject_PK                                            */
/*==============================================================*/
create unique index subject_PK on subject (
id
);

/*==============================================================*/
/* Table: subject_group                                         */
/*==============================================================*/
create table subject_group (
   subject_classid      INT4                 not null,
   subject_groupid      INT4                 not null,
   name                 VARCHAR(32)          null,
   dc                   INT2                 null,
   cash                 BOOL                 null,
   sortno               DECIMAL(18,10)       null,
   constraint PK_SUBJECT_GROUP primary key (subject_classid, subject_groupid)
);

comment on table subject_group is
'会计科目类别表';

comment on column subject_group.subject_classid is
'大类内码';

comment on column subject_group.subject_groupid is
'类别内码';

comment on column subject_group.name is
'单位名称';

comment on column subject_group.dc is
'借贷方向';

comment on column subject_group.cash is
'现金科目';

comment on column subject_group.sortno is
'排序序号';

/*==============================================================*/
/* Index: subject_group_PK                                      */
/*==============================================================*/
create unique index subject_group_PK on subject_group (
subject_classid,
subject_groupid
);

/*==============================================================*/
/* Table: supplier                                              */
/*==============================================================*/
create table supplier (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   supplier_name        VARCHAR(32)          null,
   this_addr            VARCHAR(64)          null,
   bank_title           VARCHAR(128)         null,
   supplier_account     VARCHAR(64)          null,
   supplier_bank        VARCHAR(128)         null,
   supplier_taxid       VARCHAR(32)          null,
   supplier_contact     VARCHAR(32)          null,
   supplier_phone       VARCHAR(32)          null,
   supplier_ship_addr   VARCHAR(64)          null,
   in_credit            NUMERIC(10,4)        null,
   out_credit           NUMERIC(10,4)        null,
   begin_recv           NUMERIC(10,4)        null,
   begin_send           NUMERIC(10,4)        null,
   begin_reckon_recv    NUMERIC(10,4)        null,
   begin_reckon_send    NUMERIC(10,4)        null,
   location             VARCHAR(128)         null,
   status               INT2                 null,
   createDate           DATE                 null,
   constraint PK_SUPPLIER primary key (id)
);

comment on table supplier is
'基础供应商';

comment on column supplier.id is
'自动编号';

comment on column supplier.company_id is
'企业编号';

comment on column supplier.supplier_name is
'单位名称';

comment on column supplier.this_addr is
'地址';

comment on column supplier.bank_title is
'银行户名';

comment on column supplier.supplier_account is
'帐号';

comment on column supplier.supplier_bank is
'开户行';

comment on column supplier.supplier_taxid is
'税号';

comment on column supplier.supplier_contact is
'联系人';

comment on column supplier.supplier_phone is
'电话';

comment on column supplier.supplier_ship_addr is
'发货地址';

comment on column supplier.in_credit is
'应收款信用额度';

comment on column supplier.out_credit is
'应付款信用额度';

comment on column supplier.begin_recv is
'期初应收款';

comment on column supplier.begin_send is
'期初应付款';

comment on column supplier.begin_reckon_recv is
'期初预收款';

comment on column supplier.begin_reckon_send is
'期初预付款';

comment on column supplier.location is
'地理坐标';

comment on column supplier.status is
'审核状态';

comment on column supplier.createDate is
'创建时间';

/*==============================================================*/
/* Index: supplier_PK                                           */
/*==============================================================*/
create unique index supplier_PK on supplier (
id
);

/*==============================================================*/
/* Table: voucher                                               */
/*==============================================================*/
create table voucher (
   id                   CHAR(24)             not null,
   company_id           CHAR(24)             null,
   groupid              CHAR(24)             null,
   number               INT4                 null,
   voucherno            VARCHAR(32)          null,
   attachments          INT4                 null,
   date                 DATE                 null,
   year                 CHAR(4)              null,
   period               CHAR(2)              null,
   yearperiod           CHAR(6)              null,
   entries              TEXT                 null,
   debittotal           NUMERIC(10,4)        null,
   credittotal          NUMERIC(10,4)        null,
   explanation          VARCHAR(32)          null,
   internalind          VARCHAR(32)          null,
   transtype            VARCHAR(32)          null,
   username             VARCHAR(32)          null,
   checked              INT2                 null,
   checkname            VARCHAR(32)          null,
   posted               INT2                 null,
   modifytime           DATE                 null,
   ownerid              CHAR(24)             null,
   checkerid            CHAR(24)             null,
   constraint PK_VOUCHER primary key (id)
);

comment on table voucher is
'会计凭证表';

comment on column voucher.id is
'自动编号';

comment on column voucher.company_id is
'企业编号';

comment on column voucher.groupid is
'凭证字编号';

comment on column voucher.number is
'凭证号';

comment on column voucher.voucherno is
'凭证字号';

comment on column voucher.attachments is
'附单据';

comment on column voucher.date is
'凭证日期';

comment on column voucher.year is
'凭证年份';

comment on column voucher.period is
'凭证期间';

comment on column voucher.yearperiod is
'凭证年期';

comment on column voucher.entries is
'分录数';

comment on column voucher.debittotal is
'贷方总额';

comment on column voucher.credittotal is
'借方总额';

comment on column voucher.explanation is
'摘要';

comment on column voucher.internalind is
'单据类型';

comment on column voucher.transtype is
'业务类型';

comment on column voucher.username is
'制单人';

comment on column voucher.checked is
'是否审核';

comment on column voucher.checkname is
'审核人';

comment on column voucher.posted is
'是否过账';

comment on column voucher.modifytime is
'操作时间';

comment on column voucher.ownerid is
'凭证拥有人ID';

comment on column voucher.checkerid is
'凭证审核人ID';

/*==============================================================*/
/* Index: voucher_PK                                            */
/*==============================================================*/
create unique index voucher_PK on voucher (
id
);

/*==============================================================*/
/* Table: voucher_item                                          */
/*==============================================================*/
create table voucher_item (
   id                   CHAR(24)             not null,
   voucherid            CHAR(24)             null,
   explanation          VARCHAR(32)          null,
   accountid            CHAR(24)             null,
   account_number       INT4                 null,
   account_name         VARCHAR(32)          null,
   dc                   INT2                 null,
   amount               INT4                 null,
   itemClassID          INT4                 null,
   itemClassName        VARCHAR(32)          null,
   itemid               INT4                 null,
   itemnumber           VARCHAR(32)          null,
   itemname             VARCHAR(32)          null,
   customid             CHAR(24)             null,
   customnumber         VARCHAR(32)          null,
   customname           VARCHAR(32)          null,
   deptid               CHAR(24)             null,
   deptnumber           VARCHAR(32)          null,
   deptname             VARCHAR(32)          null,
   supplierid           CHAR(24)             null,
   suppliernumber       VARCHAR(32)          null,
   suppliername         VARCHAR(32)          null,
   empid                CHAR(24)             null,
   empnumber            VARCHAR(32)          null,
   empname              VARCHAR(32)          null,
   inventoryid          CHAR(24)             null,
   projectid            CHAR(24)             null,
   projectnumber        VARCHAR(32)          null,
   projectname          VARCHAR(32)          null,
   qty                  NUMERIC(10,4)        null,
   unit                 VARCHAR(32)          null,
   price                NUMERIC(10,4)        null,
   cur                  VARCHAR(12)          null,
   rate                 FLOAT8               null,
   amountfor            NUMERIC(10,4)        null,
   settlecode           INT4                 null,
   settleno             VARCHAR(32)          null,
   settledate           DATE                 null,
   transbal             NUMERIC(10,4)        null,
   transbalfor          NUMERIC(10,4)        null,
   transdate            DATE                 null,
   transno              VARCHAR(32)          null,
   match                INT2                 null,
   qtyAux               BOOL                 null,
   trans                BOOL                 null,
   entryId              INT4                 null,
   transId              INT4                 null,
   control              BOOL                 null,
   accountId2           INT4                 null,
   acctcur              VARCHAR(12)          null,
   limited              INT4                 null,
   constraint PK_VOUCHER_ITEM primary key (id)
);

comment on table voucher_item is
'会计凭证分录表';

comment on column voucher_item.id is
'自动编号';

comment on column voucher_item.voucherid is
'凭证ID';

comment on column voucher_item.explanation is
'摘要';

comment on column voucher_item.accountid is
'科目ID';

comment on column voucher_item.account_number is
'科目编码';

comment on column voucher_item.account_name is
'科目名称';

comment on column voucher_item.dc is
'借贷方向';

comment on column voucher_item.amount is
'数量';

comment on column voucher_item.itemClassID is
'辅助分类编号';

comment on column voucher_item.itemClassName is
'辅助分类名称';

comment on column voucher_item.itemid is
'自定义核算项目ID';

comment on column voucher_item.itemnumber is
'自定义核算项目编码';

comment on column voucher_item.itemname is
'自定义核算项目名称';

comment on column voucher_item.customid is
'客户ID';

comment on column voucher_item.customnumber is
'客户编码';

comment on column voucher_item.customname is
'客户名称';

comment on column voucher_item.deptid is
'部门ID';

comment on column voucher_item.deptnumber is
'部门编码';

comment on column voucher_item.deptname is
'部门名称';

comment on column voucher_item.supplierid is
'供应商ID';

comment on column voucher_item.suppliernumber is
'供应商编码';

comment on column voucher_item.suppliername is
'供应商名称';

comment on column voucher_item.empid is
'职员ID';

comment on column voucher_item.empnumber is
'职员编码';

comment on column voucher_item.empname is
'职员名称';

comment on column voucher_item.inventoryid is
'存货ID';

comment on column voucher_item.projectid is
'项目ID';

comment on column voucher_item.projectnumber is
'项目编码';

comment on column voucher_item.projectname is
'项目名称';

comment on column voucher_item.qty is
'余额数量';

comment on column voucher_item.unit is
'单位';

comment on column voucher_item.price is
'余额单价';

comment on column voucher_item.cur is
'外币';

comment on column voucher_item.rate is
'汇率';

comment on column voucher_item.amountfor is
'原币';

comment on column voucher_item.settlecode is
'结算方式';

comment on column voucher_item.settleno is
'结算号';

comment on column voucher_item.settledate is
'结算日期';

comment on column voucher_item.transbal is
'往来核销金额本币';

comment on column voucher_item.transbalfor is
'往来核销金额原币';

comment on column voucher_item.transdate is
'往来日期';

comment on column voucher_item.transno is
'往来编号';

comment on column voucher_item.match is
'往来核销状态，1为已核销，0为未核销,-1为部分核销';

comment on column voucher_item.qtyAux is
'是否数量金额辅助核算 对应科目上的isQtyaux';

comment on column voucher_item.trans is
'是否往来核算 对应科目上的isTrans';

comment on column voucher_item.entryId is
'凭证分录序号';

comment on column voucher_item.transId is
'往来核销ID';

comment on column voucher_item.control is
'往来受控';

comment on column voucher_item.accountId2 is
'对方科目ID';

comment on column voucher_item.acctcur is
'对方币别';

comment on column voucher_item.limited is
'限定/非限定';

/*==============================================================*/
/* Index: voucher_item_PK                                       */
/*==============================================================*/
create unique index voucher_item_PK on voucher_item (
id
);

/*==============================================================*/
/* Table: voucher_word                                          */
/*==============================================================*/
create table voucher_word (
   groupid              CHAR(24)             not null,
   company_id           CHAR(24)             null,
   name                 VARCHAR(32)          null,
   prefix               VARCHAR(32)          null,
   isdefault            INT2                 null,
   constraint PK_VOUCHER_WORD primary key (groupid)
);

comment on table voucher_word is
'会计凭证字表';

comment on column voucher_word.groupid is
'凭证字编号';

comment on column voucher_word.company_id is
'企业编号';

comment on column voucher_word.name is
'单位名称';

comment on column voucher_word.prefix is
'打印标题';

comment on column voucher_word.isdefault is
'默认设置';

/*==============================================================*/
/* Index: voucher_word_PK                                       */
/*==============================================================*/
create unique index voucher_word_PK on voucher_word (
groupid
);

