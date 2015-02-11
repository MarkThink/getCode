/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2013-06-29 15:59:28                          */
/*==============================================================*/


/*==============================================================*/
/* Table: begin_bank                                            */
/*==============================================================*/
create table begin_bank (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   begin_date           DATE                 null,
   pick_bank            INT4                 null,
   begin_money          NUMERIC(10,4)        null,
   constraint PK_BEGIN_BANK primary key (id)
);

comment on table begin_bank is
'期初银行';

comment on column begin_bank.id is
'自动编号';

comment on column begin_bank.company_id is
'企业编号';

comment on column begin_bank.begin_date is
'日期';

comment on column begin_bank.pick_bank is
'选择选择银行';

comment on column begin_bank.begin_money is
'金额';

/*==============================================================*/
/* Index: begin_bank_PK                                         */
/*==============================================================*/
create unique index begin_bank_PK on begin_bank (
id
);

/*==============================================================*/
/* Table: begin_borrow_goods                                    */
/*==============================================================*/
create table begin_borrow_goods (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   begin_date           DATE                 null,
   past_man             INT4                 null,
   begin_deadline       DATE                 null,
   constraint PK_BEGIN_BORROW_GOODS primary key (id)
);

comment on table begin_borrow_goods is
'期初借入商品';

comment on column begin_borrow_goods.id is
'自动编号';

comment on column begin_borrow_goods.company_id is
'企业编号';

comment on column begin_borrow_goods.begin_date is
'日期';

comment on column begin_borrow_goods.past_man is
'经办人';

comment on column begin_borrow_goods.begin_deadline is
'期限';

/*==============================================================*/
/* Index: begin_borrow_goods_PK                                 */
/*==============================================================*/
create unique index begin_borrow_goods_PK on begin_borrow_goods (
id
);

/*==============================================================*/
/* Table: begin_borrow_money                                    */
/*==============================================================*/
create table begin_borrow_money (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   begin_date           DATE                 null,
   supplier_account     INT4                 null,
   begin_in_money       NUMERIC(10,4)        null,
   begin_desc           VARCHAR(128)         null,
   constraint PK_BEGIN_BORROW_MONEY primary key (id)
);

comment on table begin_borrow_money is
'期初借入资金';

comment on column begin_borrow_money.id is
'自动编号';

comment on column begin_borrow_money.company_id is
'企业编号';

comment on column begin_borrow_money.begin_date is
'日期';

comment on column begin_borrow_money.supplier_account is
'帐户';

comment on column begin_borrow_money.begin_in_money is
'借入金额';

comment on column begin_borrow_money.begin_desc is
'摘要';

/*==============================================================*/
/* Index: begin_borrow_money_PK                                 */
/*==============================================================*/
create unique index begin_borrow_money_PK on begin_borrow_money (
id
);

/*==============================================================*/
/* Table: begin_depot                                           */
/*==============================================================*/
create table begin_depot (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   begin_date           DATE                 null,
   begin_depot          INT4                 null,
   begin_supply         INT4                 null,
   constraint PK_BEGIN_DEPOT primary key (id)
);

comment on table begin_depot is
'期初库存';

comment on column begin_depot.id is
'自动编号';

comment on column begin_depot.company_id is
'企业编号';

comment on column begin_depot.begin_date is
'日期';

comment on column begin_depot.begin_depot is
'选择仓库';

comment on column begin_depot.begin_supply is
'供货单位';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   good_unit            INT4                 null,
   good_price           NUMERIC(10,4)        null,
   good_num             INT4                 null,
   good_money           NUMERIC(10,4)        null,
   constraint PK_BEGIN_GOODS_ITEM primary key (id)
);

comment on table begin_goods_item is
'期初商品细目';

comment on column begin_goods_item.id is
'自动编号';

comment on column begin_goods_item.company_id is
'企业编号';

comment on column begin_goods_item.good_unit is
'单位';

comment on column begin_goods_item.good_price is
'单价';

comment on column begin_goods_item.good_num is
'数量';

comment on column begin_goods_item.good_money is
'金额';

/*==============================================================*/
/* Index: begin_goods_item_PK                                   */
/*==============================================================*/
create unique index begin_goods_item_PK on begin_goods_item (
id
);

/*==============================================================*/
/* Table: begin_loan_goods                                      */
/*==============================================================*/
create table begin_loan_goods (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   past_man             INT4                 null,
   begin_date           DATE                 null,
   constraint PK_BEGIN_LOAN_GOODS primary key (id)
);

comment on table begin_loan_goods is
'期初借出商品';

comment on column begin_loan_goods.id is
'自动编号';

comment on column begin_loan_goods.company_id is
'企业编号';

comment on column begin_loan_goods.past_man is
'经办人';

comment on column begin_loan_goods.begin_date is
'日期';

/*==============================================================*/
/* Index: begin_loan_goods_PK                                   */
/*==============================================================*/
create unique index begin_loan_goods_PK on begin_loan_goods (
id
);

/*==============================================================*/
/* Table: begin_loan_money                                      */
/*==============================================================*/
create table begin_loan_money (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   supplier_account     INT4                 null,
   begin_money          NUMERIC(10,4)        null,
   begin_desc           VARCHAR(128)         null,
   constraint PK_BEGIN_LOAN_MONEY primary key (id)
);

comment on table begin_loan_money is
'期初借出资金';

comment on column begin_loan_money.id is
'自动编号';

comment on column begin_loan_money.company_id is
'企业编号';

comment on column begin_loan_money.supplier_account is
'帐户';

comment on column begin_loan_money.begin_money is
'金额';

comment on column begin_loan_money.begin_desc is
'摘要';

/*==============================================================*/
/* Index: begin_loan_money_PK                                   */
/*==============================================================*/
create unique index begin_loan_money_PK on begin_loan_money (
id
);

/*==============================================================*/
/* Table: begin_money                                           */
/*==============================================================*/
create table begin_money (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   begin_date           DATE                 null,
   pick_account         INT4                 null,
   begin_money          NUMERIC(10,4)        null,
   constraint PK_BEGIN_MONEY primary key (id)
);

comment on table begin_money is
'期初现金';

comment on column begin_money.id is
'自动编号';

comment on column begin_money.company_id is
'企业编号';

comment on column begin_money.begin_date is
'日期';

comment on column begin_money.pick_account is
'选择帐户';

comment on column begin_money.begin_money is
'金额';

/*==============================================================*/
/* Index: begin_money_PK                                        */
/*==============================================================*/
create unique index begin_money_PK on begin_money (
id
);

/*==============================================================*/
/* Table: begin_pay_money                                       */
/*==============================================================*/
create table begin_pay_money (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   begin_date           DATE                 null,
   begin_customer       INT4                 null,
   begin_money          NUMERIC(10,4)        null,
   bad_account          INT2                 null,
   constraint PK_BEGIN_PAY_MONEY primary key (id)
);

comment on table begin_pay_money is
'期初应付款';

comment on column begin_pay_money.id is
'自动编号';

comment on column begin_pay_money.company_id is
'企业编号';

comment on column begin_pay_money.begin_date is
'日期';

comment on column begin_pay_money.begin_customer is
'客户名称';

comment on column begin_pay_money.begin_money is
'金额';

comment on column begin_pay_money.bad_account is
'坏账';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   in_date              DATE                 null,
   supplier_id          INT4                 null,
   staff_id             INT4                 null,
   pay_money            NUMERIC(10,4)        null,
   bad_account          INT2                 null,
   constraint PK_BEGIN_PREPAY_MONEY primary key (id)
);

comment on table begin_prepay_money is
'期初预付款';

comment on column begin_prepay_money.id is
'自动编号';

comment on column begin_prepay_money.company_id is
'企业编号';

comment on column begin_prepay_money.in_date is
'日期';

comment on column begin_prepay_money.supplier_id is
'供应商编号';

comment on column begin_prepay_money.staff_id is
'采购员';

comment on column begin_prepay_money.pay_money is
'预付金额';

comment on column begin_prepay_money.bad_account is
'坏账';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   begin_date           DATE                 null,
   begin_customer       INT4                 null,
   begin_salesman       INT4                 null,
   begin_pay_money      NUMERIC(10,4)        null,
   constraint PK_BEGIN_PRERECV_MONEY primary key (id)
);

comment on table begin_prerecv_money is
'期初预收款';

comment on column begin_prerecv_money.id is
'自动编号';

comment on column begin_prerecv_money.company_id is
'企业编号';

comment on column begin_prerecv_money.begin_date is
'日期';

comment on column begin_prerecv_money.begin_customer is
'客户名称';

comment on column begin_prerecv_money.begin_salesman is
'业务员';

comment on column begin_prerecv_money.begin_pay_money is
'预收金额';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   begin_date           DATE                 null,
   begin_customer       INT4                 null,
   begin_money          NUMERIC(10,4)        null,
   bad_account          INT2                 null,
   constraint PK_BEGIN_RECV_MONEY primary key (id)
);

comment on table begin_recv_money is
'期初应收款';

comment on column begin_recv_money.id is
'自动编号';

comment on column begin_recv_money.company_id is
'企业编号';

comment on column begin_recv_money.begin_date is
'日期';

comment on column begin_recv_money.begin_customer is
'客户名称';

comment on column begin_recv_money.begin_money is
'金额';

comment on column begin_recv_money.bad_account is
'坏账';

/*==============================================================*/
/* Index: begin_recv_money_PK                                   */
/*==============================================================*/
create unique index begin_recv_money_PK on begin_recv_money (
id
);

/*==============================================================*/
/* Table: classify                                              */
/*==============================================================*/
create table classify (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   classify_name        VARCHAR(32)          null,
   parent_id            INT4                 null,
   in_path              VARCHAR(128)         null,
   constraint PK_CLASSIFY primary key (id)
);

comment on table classify is
'商品分类';

comment on column classify.id is
'自动编号';

comment on column classify.company_id is
'企业编号';

comment on column classify.classify_name is
'分类名称';

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

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   depot_name           VARCHAR(32)          null,
   addr_phone           VARCHAR(32)          null,
   fax                  VARCHAR(16)          null,
   contact              VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   zip_code             VARCHAR(8)           null,
   email                VARCHAR(32)          null,
   qq                   VARCHAR(32)          null,
   tax_id               VARCHAR(32)          null,
   bank                 VARCHAR(128)         null,
   bank_title           VARCHAR(128)         null,
   account              VARCHAR(64)          null,
   customer_addr        VARCHAR(64)          null,
   manager              VARCHAR(12)          null,
   in_credit            NUMERIC(10,4)        null,
   out_credit           NUMERIC(10,4)        null,
   begin_recv           NUMERIC(10,4)        null,
   begin_send           NUMERIC(10,4)        null,
   begin_reckon_recv    NUMERIC(10,4)        null,
   begin_reckon_send    NUMERIC(10,4)        null,
   begin_swap_time      DATE                 null,
   begin_swap_scale     NUMERIC(10,4)        null,
   total_recv           NUMERIC(10,4)        null,
   total_send           NUMERIC(10,4)        null,
   well_price           NUMERIC(10,4)        null,
   total_reckon_recv    NUMERIC(10,4)        null,
   total_reckon_pay     NUMERIC(10,4)        null,
   troop_id             VARCHAR(32)          null,
   location             VARCHAR(128)         null,
   status               INT2                 null,
   def                  INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_CUSTOMER primary key (id)
);

comment on table customer is
'客户';

comment on column customer.id is
'自动编号';

comment on column customer.company_id is
'企业编号';

comment on column customer.depot_name is
'仓库名称';

comment on column customer.addr_phone is
'电话';

comment on column customer.fax is
'传真';

comment on column customer.contact is
'联系人';

comment on column customer.mobile_phone is
'手机';

comment on column customer.zip_code is
'邮编';

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

comment on column customer.customer_addr is
'客户地址';

comment on column customer.manager is
'负责人';

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

comment on column customer.begin_swap_time is
'换货期限';

comment on column customer.begin_swap_scale is
'换货比例';

comment on column customer.total_recv is
'累计应收';

comment on column customer.total_send is
'累计应付';

comment on column customer.well_price is
'适用价额';

comment on column customer.total_reckon_recv is
'累计预收';

comment on column customer.total_reckon_pay is
'累计预付';

comment on column customer.troop_id is
'战队ID';

comment on column customer.location is
'地理坐标';

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
/* Table: customer_addr                                         */
/*==============================================================*/
create table customer_addr (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   customer_id          INT4                 null,
   country              VARCHAR(16)          null,
   province             VARCHAR(16)          null,
   city                 VARCHAR(16)          null,
   area                 VARCHAR(16)          null,
   addr_phone           VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   depot_addr           VARCHAR(64)          null,
   zip_code             VARCHAR(8)           null,
   def                  INT2                 null,
   constraint PK_CUSTOMER_ADDR primary key (id)
);

comment on table customer_addr is
'客户收货地址';

comment on column customer_addr.id is
'自动编号';

comment on column customer_addr.company_id is
'企业编号';

comment on column customer_addr.customer_id is
'客户编号';

comment on column customer_addr.country is
'国家';

comment on column customer_addr.province is
'省';

comment on column customer_addr.city is
'城市';

comment on column customer_addr.area is
'区域';

comment on column customer_addr.addr_phone is
'电话';

comment on column customer_addr.mobile_phone is
'手机';

comment on column customer_addr.depot_addr is
'仓库地址';

comment on column customer_addr.zip_code is
'邮编';

comment on column customer_addr.def is
'默认';

/*==============================================================*/
/* Index: customer_addr_PK                                      */
/*==============================================================*/
create unique index customer_addr_PK on customer_addr (
id
);

/*==============================================================*/
/* Table: delivery                                              */
/*==============================================================*/
create table delivery (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   depot_name           VARCHAR(32)          null,
   delivery_url         VARCHAR(32)          null,
   status               INT2                 null,
   constraint PK_DELIVERY primary key (id)
);

comment on table delivery is
'物流';

comment on column delivery.id is
'自动编号';

comment on column delivery.company_id is
'企业编号';

comment on column delivery.depot_name is
'仓库名称';

comment on column delivery.delivery_url is
'网址';

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
   depart_name          VARCHAR(32)          null,
   status               INT2                 null,
   constraint PK_DEPARTMENT primary key (id)
);

comment on table department is
'部门';

comment on column department.id is
'自动编号';

comment on column department.company_id is
'企业编号';

comment on column department.depart_name is
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
   depot_name           VARCHAR(32)          null,
   depot_brief          VARCHAR(512)         null,
   addr_phone           VARCHAR(32)          null,
   depot_addr           VARCHAR(64)          null,
   manager              VARCHAR(12)          null,
   status               INT2                 null,
   def                  INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT primary key (id)
);

comment on table depot is
'仓库';

comment on column depot.id is
'自动编号';

comment on column depot.company_id is
'企业编号';

comment on column depot.depot_name is
'仓库名称';

comment on column depot.depot_brief is
'仓库描述';

comment on column depot.addr_phone is
'电话';

comment on column depot.depot_addr is
'仓库地址';

comment on column depot.manager is
'负责人';

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
'库存盘点单';

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
/* Table: depot_goods_assembly                                  */
/*==============================================================*/
create table depot_goods_assembly (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   as_date              DATE                 null,
   out_depot            INT4                 null,
   in_depot             INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_GOODS_ASSEMBLY primary key (id)
);

comment on table depot_goods_assembly is
'库存商品组装单';

comment on column depot_goods_assembly.id is
'自动编号';

comment on column depot_goods_assembly.company_id is
'企业编号';

comment on column depot_goods_assembly.as_date is
'日期';

comment on column depot_goods_assembly.out_depot is
'出库仓库';

comment on column depot_goods_assembly.in_depot is
'入库仓库';

comment on column depot_goods_assembly.status is
'状态';

comment on column depot_goods_assembly.remark is
'备注';

/*==============================================================*/
/* Index: depot_goods_assembly_PK                               */
/*==============================================================*/
create unique index depot_goods_assembly_PK on depot_goods_assembly (
id
);

/*==============================================================*/
/* Table: depot_goods_item                                      */
/*==============================================================*/
create table depot_goods_item (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   depot_id             INT4                 null,
   good_id              INT4                 null,
   current_depot        INT4                 null,
   uppers               INT4                 null,
   lowers               INT4                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_GOODS_ITEM primary key (id)
);

comment on table depot_goods_item is
'库存商品细目';

comment on column depot_goods_item.id is
'自动编号';

comment on column depot_goods_item.company_id is
'企业编号';

comment on column depot_goods_item.depot_id is
'仓库编号';

comment on column depot_goods_item.good_id is
'商品编号';

comment on column depot_goods_item.current_depot is
'当前库存';

comment on column depot_goods_item.uppers is
'上限数量';

comment on column depot_goods_item.lowers is
'下限数量';

comment on column depot_goods_item.remark is
'备注';

/*==============================================================*/
/* Index: depot_goods_item_PK                                   */
/*==============================================================*/
create unique index depot_goods_item_PK on depot_goods_item (
id
);

/*==============================================================*/
/* Table: depot_goods_split                                     */
/*==============================================================*/
create table depot_goods_split (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   split_date           DATE                 null,
   out_depot            INT4                 null,
   in_depot             INT4                 null,
   status               INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_DEPOT_GOODS_SPLIT primary key (id)
);

comment on table depot_goods_split is
'库存商品拆分单';

comment on column depot_goods_split.id is
'自动编号';

comment on column depot_goods_split.company_id is
'企业编号';

comment on column depot_goods_split.split_date is
'日期';

comment on column depot_goods_split.out_depot is
'出库仓库';

comment on column depot_goods_split.in_depot is
'入库仓库';

comment on column depot_goods_split.status is
'状态';

comment on column depot_goods_split.remark is
'备注';

/*==============================================================*/
/* Index: depot_goods_split_PK                                  */
/*==============================================================*/
create unique index depot_goods_split_PK on depot_goods_split (
id
);

/*==============================================================*/
/* Table: depot_in                                              */
/*==============================================================*/
create table depot_in (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   supplier_id          INT4                 null,
   in_date              DATE                 null,
   depot_name           VARCHAR(32)          null,
   in_depot             INT4                 null,
   genre                INT2                 null,
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

comment on column depot_in.supplier_id is
'供应商编号';

comment on column depot_in.in_date is
'日期';

comment on column depot_in.depot_name is
'仓库名称';

comment on column depot_in.in_depot is
'入库仓库';

comment on column depot_in.genre is
'类型';

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
/* Table: depot_lend_in                                         */
/*==============================================================*/
create table depot_lend_in (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   supplier_id          INT4                 null,
   lend_date            DATE                 null,
   past_man             INT4                 null,
   in_depot             INT4                 null,
   constraint PK_DEPOT_LEND_IN primary key (id)
);

comment on table depot_lend_in is
'库存借入单';

comment on column depot_lend_in.id is
'自动编号';

comment on column depot_lend_in.company_id is
'企业编号';

comment on column depot_lend_in.supplier_id is
'供应商编号';

comment on column depot_lend_in.lend_date is
'借入日期';

comment on column depot_lend_in.past_man is
'经办人';

comment on column depot_lend_in.in_depot is
'入库仓库';

/*==============================================================*/
/* Index: depot_lend_in_PK                                      */
/*==============================================================*/
create unique index depot_lend_in_PK on depot_lend_in (
id
);

/*==============================================================*/
/* Table: depot_lend_out                                        */
/*==============================================================*/
create table depot_lend_out (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   supplier_id          INT4                 null,
   out_date             DATE                 null,
   past_man             INT4                 null,
   out_depot            INT4                 null,
   constraint PK_DEPOT_LEND_OUT primary key (id)
);

comment on table depot_lend_out is
'库存借出单';

comment on column depot_lend_out.id is
'自动编号';

comment on column depot_lend_out.company_id is
'企业编号';

comment on column depot_lend_out.supplier_id is
'供应商编号';

comment on column depot_lend_out.out_date is
'日期';

comment on column depot_lend_out.past_man is
'经办人';

comment on column depot_lend_out.out_depot is
'出库仓库';

/*==============================================================*/
/* Index: depot_lend_out_PK                                     */
/*==============================================================*/
create unique index depot_lend_out_PK on depot_lend_out (
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
   past_man             INT4                 null,
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

comment on column depot_loss.past_man is
'经办人';

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
   in_date              DATE                 null,
   out_depot            INT4                 null,
   in_depot             INT4                 null,
   constraint PK_DEPOT_MOVE primary key (id)
);

comment on table depot_move is
'库存调拨单';

comment on column depot_move.id is
'自动编号';

comment on column depot_move.company_id is
'企业编号';

comment on column depot_move.in_date is
'日期';

comment on column depot_move.out_depot is
'出库仓库';

comment on column depot_move.in_depot is
'入库仓库';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           VARCHAR(32)          null,
   depot_type           INT2                 null,
   good_id              INT4                 null,
   good_name            VARCHAR(64)          null,
   unit                 VARCHAR(16)          null,
   price                NUMERIC(10,4)        null,
   numbers              INT4                 null,
   money                NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   discount             NUMERIC(10,4)        null,
   discount_price       NUMERIC(10,4)        null,
   discount_money       NUMERIC(10,4)        null,
   constraint PK_DEPOT_MUTUAL_GOODS_ITEM primary key (id)
);

comment on table depot_mutual_goods_item is
'库存交互商品细目';

comment on column depot_mutual_goods_item.id is
'自动编号';

comment on column depot_mutual_goods_item.company_id is
'企业编号';

comment on column depot_mutual_goods_item.receipt_id is
'单据编号';

comment on column depot_mutual_goods_item.depot_type is
'类型';

comment on column depot_mutual_goods_item.good_id is
'商品编号';

comment on column depot_mutual_goods_item.good_name is
'商品名称';

comment on column depot_mutual_goods_item.unit is
'计价单位';

comment on column depot_mutual_goods_item.price is
'单价';

comment on column depot_mutual_goods_item.numbers is
'数量';

comment on column depot_mutual_goods_item.money is
'金额';

comment on column depot_mutual_goods_item.remark is
'备注';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   out_date             DATE                 null,
   depot_name           VARCHAR(32)          null,
   out_depot            INT4                 null,
   genre                INT2                 null,
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
'日期';

comment on column depot_out.depot_name is
'仓库名称';

comment on column depot_out.out_depot is
'出库仓库';

comment on column depot_out.genre is
'类型';

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
/* Table: depot_temp_goods_item                                 */
/*==============================================================*/
create table depot_temp_goods_item (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           VARCHAR(32)          null,
   depot_type           INT2                 null,
   good_id              INT4                 null,
   good_name            VARCHAR(64)          null,
   unit                 VARCHAR(16)          null,
   price                NUMERIC(10,4)        null,
   numbers              INT4                 null,
   money                NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   discount             NUMERIC(10,4)        null,
   discount_price       NUMERIC(10,4)        null,
   discount_money       NUMERIC(10,4)        null,
   constraint PK_DEPOT_TEMP_GOODS_ITEM primary key (id)
);

comment on table depot_temp_goods_item is
'库存出入库商品细目';

comment on column depot_temp_goods_item.id is
'自动编号';

comment on column depot_temp_goods_item.company_id is
'企业编号';

comment on column depot_temp_goods_item.receipt_id is
'单据编号';

comment on column depot_temp_goods_item.depot_type is
'类型';

comment on column depot_temp_goods_item.good_id is
'商品编号';

comment on column depot_temp_goods_item.good_name is
'商品名称';

comment on column depot_temp_goods_item.unit is
'计价单位';

comment on column depot_temp_goods_item.price is
'单价';

comment on column depot_temp_goods_item.numbers is
'数量';

comment on column depot_temp_goods_item.money is
'金额';

comment on column depot_temp_goods_item.remark is
'备注';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   funds_name           VARCHAR(32)          null,
   funds_addr           VARCHAR(64)          null,
   account              VARCHAR(64)          null,
   status               INT2                 null,
   def                  INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_FUNDS primary key (id)
);

comment on table funds is
'资金帐户';

comment on column funds.id is
'自动编号';

comment on column funds.company_id is
'企业编号';

comment on column funds.funds_name is
'帐户名称';

comment on column funds.funds_addr is
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
/* Table: good_unit                                             */
/*==============================================================*/
create table good_unit (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   good_id              INT4                 null,
   unit_title           VARCHAR(32)          null,
   exchange             INT2                 null,
   barcode              VARCHAR(32)          null,
   buy_price            NUMERIC(10,4)        null,
   supply_price         NUMERIC(10,4)        null,
   retail_price         NUMERIC(10,4)        null,
   preordain_one        NUMERIC(10,4)        null,
   preordain_two        NUMERIC(10,4)        null,
   preordain_three      NUMERIC(10,4)        null,
   constraint PK_GOOD_UNIT primary key (id)
);

comment on table good_unit is
'商品单位';

comment on column good_unit.id is
'自动编号';

comment on column good_unit.company_id is
'企业编号';

comment on column good_unit.good_id is
'商品编号';

comment on column good_unit.unit_title is
'单位名称';

comment on column good_unit.exchange is
'换算关系';

comment on column good_unit.barcode is
'商品条码';

comment on column good_unit.buy_price is
'采购价';

comment on column good_unit.supply_price is
'供货价';

comment on column good_unit.retail_price is
'零售价';

comment on column good_unit.preordain_one is
'预设售价1';

comment on column good_unit.preordain_two is
'预设售价2';

comment on column good_unit.preordain_three is
'预设售价3';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   supplier_id          INT4                 null,
   good_name            VARCHAR(32)          null,
   barcode              VARCHAR(32)          null,
   formats              VARCHAR(32)          null,
   species              VARCHAR(32)          null,
   cat_id               INT4                 null,
   brand                VARCHAR(32)          null,
   goods_mark           VARCHAR(512)         null,
   add_timed            DATE                 null,
   constraint PK_GOODS primary key (id)
);

comment on table goods is
'商品';

comment on column goods.id is
'自动编号';

comment on column goods.company_id is
'企业编号';

comment on column goods.supplier_id is
'供应商编号';

comment on column goods.good_name is
'商品名称';

comment on column goods.barcode is
'商品条码';

comment on column goods.formats is
'商品规格';

comment on column goods.species is
'商品品类';

comment on column goods.cat_id is
'商品种类';

comment on column goods.brand is
'商品品牌';

comment on column goods.goods_mark is
'商品备注';

comment on column goods.add_timed is
'创建时间';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   role_name            VARCHAR(32)          null,
   bewrite              VARCHAR(512)         null,
   action_str           VARCHAR(4096)        null,
   constraint PK_MASTER_ROLE primary key (id)
);

comment on table master_role is
'角色';

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
'用户';

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
   company_id           INT4                 null,
   action_str           VARCHAR(4096)        null,
   action_name          VARCHAR(32)          null,
   action_url           VARCHAR(128)         null,
   parent_id            INT4                 null,
   in_path              VARCHAR(128)         null,
   constraint PK_POWERS primary key (id)
);

comment on table powers is
'权限';

comment on column powers.id is
'自动编号';

comment on column powers.company_id is
'企业编号';

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
/* Table: purchase_goods_item                                   */
/*==============================================================*/
create table purchase_goods_item (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           VARCHAR(32)          null,
   good_id              INT4                 null,
   depot_name           VARCHAR(32)          null,
   unit                 VARCHAR(16)          null,
   out_price            NUMERIC(10,4)        null,
   amount               INT4                 null,
   lucre                NUMERIC(10,4)        null,
   tax_rate             VARCHAR(30)          null,
   tax                  NUMERIC(10,4)        null,
   out_tax              NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_PURCHASE_GOODS_ITEM primary key (id)
);

comment on table purchase_goods_item is
'采购商品细目';

comment on column purchase_goods_item.id is
'自动编号';

comment on column purchase_goods_item.company_id is
'企业编号';

comment on column purchase_goods_item.receipt_id is
'单据编号';

comment on column purchase_goods_item.good_id is
'商品编号';

comment on column purchase_goods_item.depot_name is
'仓库名称';

comment on column purchase_goods_item.unit is
'计价单位';

comment on column purchase_goods_item.out_price is
'销售价格';

comment on column purchase_goods_item.amount is
'数量';

comment on column purchase_goods_item.lucre is
'含税金额';

comment on column purchase_goods_item.tax_rate is
'税率';

comment on column purchase_goods_item.tax is
'税额';

comment on column purchase_goods_item.out_tax is
'不含税金额';

comment on column purchase_goods_item.remark is
'备注';

/*==============================================================*/
/* Index: purchase_goods_item_PK                                */
/*==============================================================*/
create unique index purchase_goods_item_PK on purchase_goods_item (
id
);

/*==============================================================*/
/* Table: purchase_in                                           */
/*==============================================================*/
create table purchase_in (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   order_id             INT4                 null,
   receipt_id           VARCHAR(32)          null,
   buyer                INT4                 null,
   supplier_id          INT4                 null,
   in_date              DATE                 null,
   in_depot             INT4                 null,
   delivery             INT4                 null,
   shipper_id           VARCHAR(32)          null,
   fashion              INT4                 null,
   ipay_account         INT4                 null,
   benefit_lucre        NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   pay_lucre            NUMERIC(10,4)        null,
   already_cost         NUMERIC(10,4)        null,
   flow_cost            NUMERIC(10,4)        null,
   buy_cost             NUMERIC(10,4)        null,
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

comment on column purchase_in.order_id is
'订单编号';

comment on column purchase_in.receipt_id is
'单据编号';

comment on column purchase_in.buyer is
'采购员';

comment on column purchase_in.supplier_id is
'供应商编号';

comment on column purchase_in.in_date is
'日期';

comment on column purchase_in.in_depot is
'入库仓库';

comment on column purchase_in.delivery is
'货运公司';

comment on column purchase_in.shipper_id is
'货运单号';

comment on column purchase_in.fashion is
'结算方式';

comment on column purchase_in.ipay_account is
'付款帐户';

comment on column purchase_in.benefit_lucre is
'优惠金额';

comment on column purchase_in.after_lucre is
'优惠后金额';

comment on column purchase_in.pay_lucre is
'本次收款金额';

comment on column purchase_in.already_cost is
'已支付金额';

comment on column purchase_in.flow_cost is
'物流费用';

comment on column purchase_in.buy_cost is
'采购费用';

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
/* Table: purchase_invoice                                      */
/*==============================================================*/
create table purchase_invoice (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   ticket_date          DATE                 null,
   ticket_type          INT4                 null,
   company_name         VARCHAR(32)          null,
   invoice_sn           VARCHAR(32)          null,
   invoice_header       VARCHAR(32)          null,
   invoice_body         VARCHAR(512)         null,
   invoice_money        NUMERIC(10,4)        null,
   invoice_method       INT2                 null,
   constraint PK_PURCHASE_INVOICE primary key (id)
);

comment on table purchase_invoice is
'采购发票单';

comment on column purchase_invoice.id is
'自动编号';

comment on column purchase_invoice.company_id is
'企业编号';

comment on column purchase_invoice.ticket_date is
'开票日期';

comment on column purchase_invoice.ticket_type is
'开票类型';

comment on column purchase_invoice.company_name is
'公司名称';

comment on column purchase_invoice.invoice_sn is
'发票编号';

comment on column purchase_invoice.invoice_header is
'发票抬头';

comment on column purchase_invoice.invoice_body is
'发票内容';

comment on column purchase_invoice.invoice_money is
'发票金额';

comment on column purchase_invoice.invoice_method is
'开票方式';

/*==============================================================*/
/* Index: purchase_invoice_PK                                   */
/*==============================================================*/
create unique index purchase_invoice_PK on purchase_invoice (
id
);

/*==============================================================*/
/* Table: purchase_invoice_item                                 */
/*==============================================================*/
create table purchase_invoice_item (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   invoice_sn           VARCHAR(32)          null,
   in_date              DATE                 null,
   receipt_id           VARCHAR(32)          null,
   buy_money            NUMERIC(10,4)        null,
   sell_money           NUMERIC(10,4)        null,
   already_pay_money    NUMERIC(10,4)        null,
   this_receipt_money   NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_PURCHASE_INVOICE_ITEM primary key (id)
);

comment on table purchase_invoice_item is
'采购发票细目';

comment on column purchase_invoice_item.id is
'自动编号';

comment on column purchase_invoice_item.company_id is
'企业编号';

comment on column purchase_invoice_item.invoice_sn is
'发票编号';

comment on column purchase_invoice_item.in_date is
'日期';

comment on column purchase_invoice_item.receipt_id is
'单据编号';

comment on column purchase_invoice_item.buy_money is
'采购金额';

comment on column purchase_invoice_item.sell_money is
'销售金额';

comment on column purchase_invoice_item.already_pay_money is
'已付款金额';

comment on column purchase_invoice_item.this_receipt_money is
'本次开票金额';

comment on column purchase_invoice_item.remark is
'备注';

/*==============================================================*/
/* Index: purchase_invoice_item_PK                              */
/*==============================================================*/
create unique index purchase_invoice_item_PK on purchase_invoice_item (
id
);

/*==============================================================*/
/* Table: purchase_order                                        */
/*==============================================================*/
create table purchase_order (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           VARCHAR(32)          null,
   in_date              DATE                 null,
   buyer                INT4                 null,
   supplier_id          INT4                 null,
   in_depot             INT4                 null,
   pay_type             INT4                 null,
   ipay_account         INT4                 null,
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

comment on column purchase_order.in_date is
'日期';

comment on column purchase_order.buyer is
'采购员';

comment on column purchase_order.supplier_id is
'供应商编号';

comment on column purchase_order.in_depot is
'入库仓库';

comment on column purchase_order.pay_type is
'结算方式';

comment on column purchase_order.ipay_account is
'付款帐户';

comment on column purchase_order.benefit_cost is
'优惠金额';

comment on column purchase_order.after_cost is
'优惠后金额';

comment on column purchase_order.in_type is
'开票类型';

comment on column purchase_order.forecast_date is
'预计发货日期';

comment on column purchase_order.pay_promise is
'应付约定';

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
/* Table: purchase_outpay                                       */
/*==============================================================*/
create table purchase_outpay (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   in_date              DATE                 null,
   unit_title           VARCHAR(32)          null,
   inpay_money          NUMERIC(10,4)        null,
   rebate_money         NUMERIC(10,4)        null,
   deductible           NUMERIC(10,4)        null,
   already_pay_money    NUMERIC(10,4)        null,
   no_pay_money         NUMERIC(10,4)        null,
   pay_time             DATE                 null,
   constraint PK_PURCHASE_OUTPAY primary key (id)
);

comment on table purchase_outpay is
'采购应付单';

comment on column purchase_outpay.id is
'自动编号';

comment on column purchase_outpay.company_id is
'企业编号';

comment on column purchase_outpay.in_date is
'日期';

comment on column purchase_outpay.unit_title is
'单位名称';

comment on column purchase_outpay.inpay_money is
'应付款金额';

comment on column purchase_outpay.rebate_money is
'折扣金额';

comment on column purchase_outpay.deductible is
'退货抵扣';

comment on column purchase_outpay.already_pay_money is
'已付款金额';

comment on column purchase_outpay.no_pay_money is
'未付款金额';

comment on column purchase_outpay.pay_time is
'应付期限';

/*==============================================================*/
/* Index: purchase_outpay_PK                                    */
/*==============================================================*/
create unique index purchase_outpay_PK on purchase_outpay (
id
);

/*==============================================================*/
/* Table: purchase_pay                                          */
/*==============================================================*/
create table purchase_pay (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   in_date              DATE                 null,
   supplier_id          INT4                 null,
   ipay_count           NUMERIC(10,4)        null,
   pay_count            NUMERIC(10,4)        null,
   rebate_money         NUMERIC(10,4)        null,
   sell_money           NUMERIC(10,4)        null,
   ispay                INT2                 null,
   constraint PK_PURCHASE_PAY primary key (id)
);

comment on table purchase_pay is
'采购付款单';

comment on column purchase_pay.id is
'自动编号';

comment on column purchase_pay.company_id is
'企业编号';

comment on column purchase_pay.in_date is
'日期';

comment on column purchase_pay.supplier_id is
'供应商编号';

comment on column purchase_pay.ipay_count is
'预付款合计';

comment on column purchase_pay.pay_count is
'应付款合计';

comment on column purchase_pay.rebate_money is
'折扣金额';

comment on column purchase_pay.sell_money is
'销售金额';

comment on column purchase_pay.ispay is
'是否预付款支付';

/*==============================================================*/
/* Index: purchase_pay_PK                                       */
/*==============================================================*/
create unique index purchase_pay_PK on purchase_pay (
id
);

/*==============================================================*/
/* Table: purchase_receipt                                      */
/*==============================================================*/
create table purchase_receipt (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           VARCHAR(32)          null,
   good_id              INT4                 null,
   good_name            VARCHAR(64)          null,
   unit                 VARCHAR(16)          null,
   good_num             INT4                 null,
   price                NUMERIC(10,4)        null,
   money                NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   status               INT2                 null,
   barcode              VARCHAR(32)          null,
   constraint PK_PURCHASE_RECEIPT primary key (id)
);

comment on table purchase_receipt is
'采购收据';

comment on column purchase_receipt.id is
'自动编号';

comment on column purchase_receipt.company_id is
'企业编号';

comment on column purchase_receipt.receipt_id is
'单据编号';

comment on column purchase_receipt.good_id is
'商品编号';

comment on column purchase_receipt.good_name is
'商品名称';

comment on column purchase_receipt.unit is
'计价单位';

comment on column purchase_receipt.good_num is
'数量';

comment on column purchase_receipt.price is
'单价';

comment on column purchase_receipt.money is
'金额';

comment on column purchase_receipt.remark is
'备注';

comment on column purchase_receipt.status is
'状态';

comment on column purchase_receipt.barcode is
'商品条码';

/*==============================================================*/
/* Index: purchase_receipt_PK                                   */
/*==============================================================*/
create unique index purchase_receipt_PK on purchase_receipt (
id
);

/*==============================================================*/
/* Table: purchase_ret                                          */
/*==============================================================*/
create table purchase_ret (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   order_id             INT4                 null,
   receipt_id           VARCHAR(32)          null,
   buyer                INT4                 null,
   supplier_id          INT4                 null,
   ret_date             DATE                 null,
   cargo_company        INT4                 null,
   cargo_sn             VARCHAR(32)          null,
   pay_type             INT4                 null,
   in_account           INT4                 null,
   rebate_lucre         NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   recv_lucre           NUMERIC(10,4)        null,
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

comment on column purchase_ret.order_id is
'订单编号';

comment on column purchase_ret.receipt_id is
'单据编号';

comment on column purchase_ret.buyer is
'采购员';

comment on column purchase_ret.supplier_id is
'供应商编号';

comment on column purchase_ret.ret_date is
'退货日期';

comment on column purchase_ret.cargo_company is
'货运公司';

comment on column purchase_ret.cargo_sn is
'货运单号';

comment on column purchase_ret.pay_type is
'结算方式';

comment on column purchase_ret.in_account is
'退款帐户';

comment on column purchase_ret.rebate_lucre is
'折扣金额';

comment on column purchase_ret.after_lucre is
'优惠后金额';

comment on column purchase_ret.recv_lucre is
'退款金额';

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
   order_id             INT4                 null,
   good_id              INT4                 null,
   good_name            VARCHAR(32)          null,
   unit                 VARCHAR(16)          null,
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
'销售商品细目';

comment on column sell_goods_item.id is
'自动编号';

comment on column sell_goods_item.company_id is
'企业编号';

comment on column sell_goods_item.order_id is
'订单编号';

comment on column sell_goods_item.good_id is
'商品编号';

comment on column sell_goods_item.good_name is
'商品名称';

comment on column sell_goods_item.unit is
'计价单位';

comment on column sell_goods_item.out_price is
'销售价格';

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
/* Table: sell_inpay                                            */
/*==============================================================*/
create table sell_inpay (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   in_date              DATE                 null,
   unit_title           VARCHAR(32)          null,
   outpay_money         NUMERIC(10,4)        null,
   rebate_money         NUMERIC(10,4)        null,
   deductible           NUMERIC(10,4)        null,
   already_in_money     NUMERIC(10,4)        null,
   no_in_money          NUMERIC(10,4)        null,
   pay_time             DATE                 null,
   constraint PK_SELL_INPAY primary key (id)
);

comment on table sell_inpay is
'销售应收单';

comment on column sell_inpay.id is
'自动编号';

comment on column sell_inpay.company_id is
'企业编号';

comment on column sell_inpay.in_date is
'日期';

comment on column sell_inpay.unit_title is
'单位名称';

comment on column sell_inpay.outpay_money is
'应收款金额';

comment on column sell_inpay.rebate_money is
'折扣金额';

comment on column sell_inpay.deductible is
'退货抵扣';

comment on column sell_inpay.already_in_money is
'已收款金额';

comment on column sell_inpay.no_in_money is
'未收款金额';

comment on column sell_inpay.pay_time is
'应付期限';

/*==============================================================*/
/* Index: sell_inpay_PK                                         */
/*==============================================================*/
create unique index sell_inpay_PK on sell_inpay (
id
);

/*==============================================================*/
/* Table: sell_invoice                                          */
/*==============================================================*/
create table sell_invoice (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   ticket_date          DATE                 null,
   ticket_type          INT4                 null,
   company_name         VARCHAR(32)          null,
   invoice_header       VARCHAR(32)          null,
   invoice_body         VARCHAR(512)         null,
   ticket_remain        NUMERIC(10,4)        null,
   ticket_method        INT2                 null,
   constraint PK_SELL_INVOICE primary key (id)
);

comment on table sell_invoice is
'销售发票单';

comment on column sell_invoice.id is
'自动编号';

comment on column sell_invoice.company_id is
'企业编号';

comment on column sell_invoice.ticket_date is
'开票日期';

comment on column sell_invoice.ticket_type is
'开票类型';

comment on column sell_invoice.company_name is
'公司名称';

comment on column sell_invoice.invoice_header is
'发票抬头';

comment on column sell_invoice.invoice_body is
'发票内容';

comment on column sell_invoice.ticket_remain is
'开票余额';

comment on column sell_invoice.ticket_method is
'开票方式';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   invoice_sn           VARCHAR(32)          null,
   in_date              DATE                 null,
   sell_money           NUMERIC(10,4)        null,
   pay_money            NUMERIC(10,4)        null,
   already_pay_money    NUMERIC(10,4)        null,
   this_receipt_money   NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   constraint PK_SELL_INVOICE_ITEM primary key (id)
);

comment on table sell_invoice_item is
'销售发票细目';

comment on column sell_invoice_item.id is
'自动编号';

comment on column sell_invoice_item.company_id is
'企业编号';

comment on column sell_invoice_item.invoice_sn is
'发票编号';

comment on column sell_invoice_item.in_date is
'日期';

comment on column sell_invoice_item.sell_money is
'销售金额';

comment on column sell_invoice_item.pay_money is
'已支付金额';

comment on column sell_invoice_item.already_pay_money is
'已付款金额';

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
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           VARCHAR(32)          null,
   in_date              DATE                 null,
   salesman             INT4                 null,
   customer             INT4                 null,
   send_depot           INT4                 null,
   fashion              INT4                 null,
   ipay_account         INT4                 null,
   benefit_lucre        NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   ticket_type          INT4                 null,
   forecast_date        DATE                 null,
   promise              INT4                 null,
   send_time            DATE                 null,
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

comment on column sell_order.in_date is
'日期';

comment on column sell_order.salesman is
'业务员';

comment on column sell_order.customer is
'客户名称';

comment on column sell_order.send_depot is
'发货仓库';

comment on column sell_order.fashion is
'结算方式';

comment on column sell_order.ipay_account is
'付款帐户';

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

comment on column sell_order.send_time is
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
/* Table: sell_receipt                                          */
/*==============================================================*/
create table sell_receipt (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   receipt_id           VARCHAR(32)          null,
   good_id              INT4                 null,
   good_name            VARCHAR(64)          null,
   unit                 VARCHAR(16)          null,
   good_num             INT4                 null,
   price                NUMERIC(10,4)        null,
   money                NUMERIC(10,4)        null,
   remark               VARCHAR(512)         null,
   status               INT2                 null,
   barcode              VARCHAR(32)          null,
   constraint PK_SELL_RECEIPT primary key (id)
);

comment on table sell_receipt is
'销售收据单';

comment on column sell_receipt.id is
'自动编号';

comment on column sell_receipt.company_id is
'企业编号';

comment on column sell_receipt.receipt_id is
'单据编号';

comment on column sell_receipt.good_id is
'商品编号';

comment on column sell_receipt.good_name is
'商品名称';

comment on column sell_receipt.unit is
'计价单位';

comment on column sell_receipt.good_num is
'数量';

comment on column sell_receipt.price is
'单价';

comment on column sell_receipt.money is
'金额';

comment on column sell_receipt.remark is
'备注';

comment on column sell_receipt.status is
'状态';

comment on column sell_receipt.barcode is
'商品条码';

/*==============================================================*/
/* Index: sell_receipt_PK                                       */
/*==============================================================*/
create unique index sell_receipt_PK on sell_receipt (
id
);

/*==============================================================*/
/* Table: sell_recv                                             */
/*==============================================================*/
create table sell_recv (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   in_date              DATE                 null,
   outpay_supplier      INT4                 null,
   supplier_account     INT4                 null,
   ipay_out_count       NUMERIC(10,4)        null,
   pay_in_count         NUMERIC(10,4)        null,
   rebate_money         NUMERIC(10,4)        null,
   this_pay_money       NUMERIC(10,4)        null,
   ispay                INT2                 null,
   constraint PK_SELL_RECV primary key (id)
);

comment on table sell_recv is
'销售收款单';

comment on column sell_recv.id is
'自动编号';

comment on column sell_recv.company_id is
'企业编号';

comment on column sell_recv.in_date is
'日期';

comment on column sell_recv.outpay_supplier is
'付款单位';

comment on column sell_recv.supplier_account is
'帐户';

comment on column sell_recv.ipay_out_count is
'预收款合计';

comment on column sell_recv.pay_in_count is
'应收款合计';

comment on column sell_recv.rebate_money is
'折扣金额';

comment on column sell_recv.this_pay_money is
'本次收款金额';

comment on column sell_recv.ispay is
'是否预付款支付';

/*==============================================================*/
/* Index: sell_recv_PK                                          */
/*==============================================================*/
create unique index sell_recv_PK on sell_recv (
id
);

/*==============================================================*/
/* Table: sell_ret                                              */
/*==============================================================*/
create table sell_ret (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   salesman             INT4                 null,
   customer             INT4                 null,
   order_id             INT4                 null,
   receipt_id           VARCHAR(32)          null,
   ret_date             DATE                 null,
   in_depot             INT4                 null,
   freight              INT4                 null,
   freight_sn           VARCHAR(32)          null,
   bear_method          INT4                 null,
   in_account           INT4                 null,
   rebate_lucre         NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   recv_lucre           NUMERIC(10,4)        null,
   flow_lucre           NUMERIC(10,4)        null,
   ret_lucre            NUMERIC(10,4)        null,
   begin_deadline       DATE                 null,
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

comment on column sell_ret.salesman is
'业务员';

comment on column sell_ret.customer is
'客户名称';

comment on column sell_ret.order_id is
'订单编号';

comment on column sell_ret.receipt_id is
'单据编号';

comment on column sell_ret.ret_date is
'退货日期';

comment on column sell_ret.in_depot is
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
'优惠后金额';

comment on column sell_ret.recv_lucre is
'退款金额';

comment on column sell_ret.flow_lucre is
'物流费用';

comment on column sell_ret.ret_lucre is
'退货费用';

comment on column sell_ret.begin_deadline is
'期限';

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
   salesman             INT4                 null,
   customer             INT4                 null,
   order_id             INT4                 null,
   receipt_id           VARCHAR(32)          null,
   send_depot           INT4                 null,
   delivery             INT4                 null,
   shipper_id           VARCHAR(32)          null,
   flow_lucre           NUMERIC(10,4)        null,
   fashion              INT4                 null,
   ipay_account         INT4                 null,
   benefit_lucre        NUMERIC(10,4)        null,
   after_lucre          NUMERIC(10,4)        null,
   pay_lucre            NUMERIC(10,4)        null,
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

comment on column sell_send.salesman is
'业务员';

comment on column sell_send.customer is
'客户名称';

comment on column sell_send.order_id is
'订单编号';

comment on column sell_send.receipt_id is
'单据编号';

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

comment on column sell_send.ipay_account is
'付款帐户';

comment on column sell_send.benefit_lucre is
'优惠金额';

comment on column sell_send.after_lucre is
'优惠后金额';

comment on column sell_send.pay_lucre is
'本次收款金额';

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
   depot_name           VARCHAR(32)          null,
   sex                  INT2                 null,
   birth                DATE                 null,
   staff_phone          VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   office_sector        VARCHAR(32)          null,
   appellative          VARCHAR(32)          null,
   email                VARCHAR(32)          null,
   job                  VARCHAR(30)          null,
   staff_addr           VARCHAR(64)          null,
   photo                VARCHAR(128)         null,
   summary              VARCHAR(512)         null,
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
'员工';

comment on column staff.id is
'自动编号';

comment on column staff.company_id is
'企业编号';

comment on column staff.depot_name is
'仓库名称';

comment on column staff.sex is
'性别';

comment on column staff.birth is
'出生日期';

comment on column staff.staff_phone is
'电话';

comment on column staff.mobile_phone is
'手机';

comment on column staff.office_sector is
'任职部门';

comment on column staff.appellative is
'职务';

comment on column staff.email is
'邮箱';

comment on column staff.job is
'岗位';

comment on column staff.staff_addr is
'地址';

comment on column staff.photo is
'照片';

comment on column staff.summary is
'简介';

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
'状态';

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
/* Table: supplier                                              */
/*==============================================================*/
create table supplier (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   supplier_name        VARCHAR(32)          null,
   supplier_phone       VARCHAR(32)          null,
   fax                  VARCHAR(16)          null,
   contact              VARCHAR(32)          null,
   mobile_phone         VARCHAR(16)          null,
   zip_code             VARCHAR(8)           null,
   email                VARCHAR(32)          null,
   qq                   VARCHAR(32)          null,
   tax_id               VARCHAR(32)          null,
   bank                 VARCHAR(128)         null,
   bank_title           VARCHAR(128)         null,
   account              VARCHAR(64)          null,
   depot_addr           VARCHAR(64)          null,
   manager              VARCHAR(12)          null,
   in_credit            NUMERIC(10,4)        null,
   out_credit           NUMERIC(10,4)        null,
   begin_recv           NUMERIC(10,4)        null,
   begin_send           NUMERIC(10,4)        null,
   begin_reckon_recv    NUMERIC(10,4)        null,
   begin_reckon_send    NUMERIC(10,4)        null,
   begin_swap_time      DATE                 null,
   begin_swap_scale     NUMERIC(10,4)        null,
   total_recv           NUMERIC(10,4)        null,
   total_send           NUMERIC(10,4)        null,
   well_price           NUMERIC(10,4)        null,
   total_reckon_recv    NUMERIC(10,4)        null,
   total_reckon_pay     NUMERIC(10,4)        null,
   troop_id             VARCHAR(32)          null,
   location             VARCHAR(128)         null,
   status               INT2                 null,
   def                  INT2                 null,
   remark               VARCHAR(512)         null,
   constraint PK_SUPPLIER primary key (id)
);

comment on table supplier is
'供应商';

comment on column supplier.id is
'自动编号';

comment on column supplier.company_id is
'企业编号';

comment on column supplier.supplier_name is
'供应商名';

comment on column supplier.supplier_phone is
'供应商电话';

comment on column supplier.fax is
'传真';

comment on column supplier.contact is
'联系人';

comment on column supplier.mobile_phone is
'手机';

comment on column supplier.zip_code is
'邮编';

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

comment on column supplier.depot_addr is
'仓库地址';

comment on column supplier.manager is
'负责人';

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

comment on column supplier.begin_swap_time is
'换货期限';

comment on column supplier.begin_swap_scale is
'换货比例';

comment on column supplier.total_recv is
'累计应收';

comment on column supplier.total_send is
'累计应付';

comment on column supplier.well_price is
'适用价额';

comment on column supplier.total_reckon_recv is
'累计预收';

comment on column supplier.total_reckon_pay is
'累计预付';

comment on column supplier.troop_id is
'战队ID';

comment on column supplier.location is
'地理坐标';

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

/*==============================================================*/
/* Table: supplier_addr                                         */
/*==============================================================*/
create table supplier_addr (
   id                   SERIAL               not null,
   company_id           INT4                 null,
   supplier_id          INT4                 null,
   country              VARCHAR(16)          null,
   province             VARCHAR(16)          null,
   city                 VARCHAR(16)          null,
   area                 VARCHAR(16)          null,
   addr_phone           VARCHAR(16)          null,
   mobile_phone         VARCHAR(16)          null,
   supplier_addr        VARCHAR(64)          null,
   zip_code             VARCHAR(8)           null,
   def                  INT2                 null,
   constraint PK_SUPPLIER_ADDR primary key (id)
);

comment on table supplier_addr is
'供应商发货地址';

comment on column supplier_addr.id is
'自动编号';

comment on column supplier_addr.company_id is
'企业编号';

comment on column supplier_addr.supplier_id is
'供应商编号';

comment on column supplier_addr.country is
'国家';

comment on column supplier_addr.province is
'省';

comment on column supplier_addr.city is
'城市';

comment on column supplier_addr.area is
'区域';

comment on column supplier_addr.addr_phone is
'电话';

comment on column supplier_addr.mobile_phone is
'手机';

comment on column supplier_addr.supplier_addr is
'发货地址';

comment on column supplier_addr.zip_code is
'邮编';

comment on column supplier_addr.def is
'默认';

/*==============================================================*/
/* Index: supplier_addr_PK                                      */
/*==============================================================*/
create unique index supplier_addr_PK on supplier_addr (
id
);

