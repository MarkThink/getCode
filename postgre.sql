/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     2013-5-22 16:52:58                           */
/*==============================================================*/

/*==============================================================*/
/* Table: ActionPowers                                          */
/*==============================================================*/
create table ActionPowers (
   ID                   SERIAL not null,
   ActionStr            VARCHAR(30)          null,
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
/* Table: Company                                               */
/*==============================================================*/
create table Company (
   ID                   SERIAL not null,
   Title                VARCHAR(100)         null,
   Genre                VARCHAR(100)         null,
   RegNumber            VARCHAR(100)         null,
   Address              VARCHAR(200)         null,
   RegCaptita           VARCHAR(30)          null,
   TradeArea            VARCHAR(500)         null,
   MajorGood            VARCHAR(100)         null,
   Brief                VARCHAR(500)         null,
   RepName              VARCHAR(30)          null,
   RepSex               VARCHAR(10)          null,
   RepTelephone         VARCHAR(30)          null,
   MobilePhone          VARCHAR(30)          null,
   ZipCode              VARCHAR(10)          null,
   CreateTimed          DATE                 null,
   constraint PK_COMPANY primary key (ID)
);

comment on table Company is
'企业表';

comment on column Company.ID is
'自动编号';

comment on column Company.Title is
'名称';

comment on column Company.Genre is
'公司类型';

comment on column Company.RegNumber is
'营业执照号码';

comment on column Company.Address is
'地址';

comment on column Company.RegCaptita is
'注册资本';

comment on column Company.TradeArea is
'经营范围';

comment on column Company.MajorGood is
'主营产品';

comment on column Company.Brief is
'企业简介';

comment on column Company.RepName is
'姓名(法定代表人)';

comment on column Company.RepSex is
'性别';

comment on column Company.RepTelephone is
'电话';

comment on column Company.MobilePhone is
'手机';

comment on column Company.ZipCode is
'邮编';

comment on column Company.CreateTimed is
'创建时间';

/*==============================================================*/
/* Index: Company_PK                                            */
/*==============================================================*/
create unique index Company_PK on Company (
ID
);

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer (
   ID                   SERIAL not null,
   CompanyID            INT4                 null,
   PinyinCode           VARCHAR(100)         null,
   Title                VARCHAR(100)         null,
   Fax                  VARCHAR(15)          null,
   Contact              VARCHAR(30)          null,
   MobilePhone          VARCHAR(30)          null,
   Email                VARCHAR(30)          null,
   QQ                   VARCHAR(20)          null,
   TaxID                VARCHAR(50)          null,
   Bank                 VARCHAR(50)          null,
   BankZip              VARCHAR(50)          null,
   Account              VARCHAR(50)          null,
   Address              VARCHAR(200)         null,
   Url                  VARCHAR(50)          null,
   Manager              VARCHAR(20)          null,
   InCredit             VARCHAR(20)          null,
   OutCredit            VARCHAR(20)          null,
   Deadline             VARCHAR(20)          null,
   Balance              VARCHAR(20)          null,
   Remark               VARCHAR(500)         null,
   constraint PK_CUSTOMER primary key (ID)
);

comment on table Customer is
'客户表';

comment on column Customer.ID is
'自动编号';

comment on column Customer.CompanyID is
'企业编号';

comment on column Customer.PinyinCode is
'拼音编码';

comment on column Customer.Title is
'名称';

comment on column Customer.Fax is
'传真';

comment on column Customer.Contact is
'联系人(仓库管理员)';

comment on column Customer.MobilePhone is
'手机';

comment on column Customer.Email is
'邮箱';

comment on column Customer.QQ is
'QQ';

comment on column Customer.TaxID is
'税号';

comment on column Customer.Bank is
'开户行';

comment on column Customer.BankZip is
'开户名称';

comment on column Customer.Account is
'帐号';

comment on column Customer.Address is
'地址';

comment on column Customer.Url is
'网址';

comment on column Customer.Manager is
'管理负责人';

comment on column Customer.InCredit is
'应收款信用额度';

comment on column Customer.OutCredit is
'应付款信用额度';

comment on column Customer.Deadline is
'帐期';

comment on column Customer.Balance is
'期初余额';

comment on column Customer.Remark is
'备注';

/*==============================================================*/
/* Index: Customer_PK                                           */
/*==============================================================*/
create unique index Customer_PK on Customer (
ID
);

/*==============================================================*/
/* Table: Goods                                                 */
/*==============================================================*/
create table Goods (
   ID                   INT4                 not null,
   CompanyID            INT4                 null,
   Title                VARCHAR(100)         null,
   PinyinCode           VARCHAR(100)         null,
   InPrice              DECIMAL(8,2)         null,
   OutPrice             DECIMAL(8,2)         null,
   LowInPrice           DECIMAL(8,2)         null,
   HigInPrice           DECIMAL(8,2)         null,
   LowOutPice           DECIMAL(8,2)         null,
   HigOutPice           DECIMAL(8,2)         null,
   MonthAvgValue        DECIMAL(8,2)         null,
   MobileAvgValue       DECIMAL(8,2)         null,
   Format               VARCHAR(30)          null,
   Weight               VARCHAR(30)          null,
   WarpFormat           VARCHAR(30)          null,
   Model                VARCHAR(30)          null,
   CatID                INT4                 null,
   Unit                 VARCHAR(30)          null,
   WarpUnit             VARCHAR(30)          null,
   Formula              VARCHAR(100)         null,
   Brand                VARCHAR(30)          null,
   PlaceOfOrigin        VARCHAR(100)         null,
   Material             VARCHAR(100)         null,
   Style                VARCHAR(100)         null,
   License              VARCHAR(100)         null,
   Health               VARCHAR(100)         null,
   Supplier             VARCHAR(100)         null,
   Shelfbit             VARCHAR(100)         null,
   GoodsPic             VARCHAR(100)         null,
   ShelfLife            VARCHAR(100)         null,
   WarningDays          INT4                 null,
   BarCode              VARCHAR(100)         null,
   InCode               VARCHAR(100)         null,
   WarpCode             VARCHAR(100)         null,
   Color                VARCHAR(100)         null,
   Attribute            VARCHAR(30)          null,
   GoodsDesc            VARCHAR(2000)        null,
   GoodsMark            VARCHAR(500)         null,
   AdvProxyPrice        DECIMAL(8,2)         null,
   VIPPrice             DECIMAL(8,2)         null,
   GeneralPrice         DECIMAL(8,2)         null,
   DistributionPrice    DECIMAL(8,2)         null,
   SellPrice            DECIMAL(8,2)         null,
   Discount             INT2                 null,
   Integral             INT2                 null,
   PromotePrice         DECIMAL(8,2)         null,
   PromoteStartTime     DATE                 null,
   PromoteEndTime       DATE                 null,
   IsPromote            INT2                 null,
   IsMemberPrice        INT2                 null,
   AddTimed             DATE                 null,
   constraint PK_GOODS primary key (ID)
);

comment on table Goods is
'商品信息表';

comment on column Goods.ID is
'自动编号';

comment on column Goods.CompanyID is
'企业编号';

comment on column Goods.Title is
'名称';

comment on column Goods.PinyinCode is
'拼音编码';

comment on column Goods.InPrice is
'采购价格';

comment on column Goods.OutPrice is
'销售价格';

comment on column Goods.LowInPrice is
'最低采购价';

comment on column Goods.HigInPrice is
'最高采购价';

comment on column Goods.LowOutPice is
'最低销售价';

comment on column Goods.HigOutPice is
'最高销售价';

comment on column Goods.MonthAvgValue is
'月平均值';

comment on column Goods.MobileAvgValue is
'移动平均值';

comment on column Goods.Format is
'商品规格';

comment on column Goods.Weight is
'商品重量';

comment on column Goods.WarpFormat is
'包装规格';

comment on column Goods.Model is
'商品型号';

comment on column Goods.CatID is
'商品类别';

comment on column Goods.Unit is
'计价单位';

comment on column Goods.WarpUnit is
'包装单位';

comment on column Goods.Formula is
'换算公式';

comment on column Goods.Brand is
'品牌';

comment on column Goods.PlaceOfOrigin is
'产地';

comment on column Goods.Material is
'商品材质';

comment on column Goods.Style is
'商品款式';

comment on column Goods.License is
'生产许可证';

comment on column Goods.Health is
'卫生合格证';

comment on column Goods.Supplier is
'供货商';

comment on column Goods.Shelfbit is
'货架位';

comment on column Goods.GoodsPic is
'产品图片';

comment on column Goods.ShelfLife is
'保质期';

comment on column Goods.WarningDays is
'预警天数';

comment on column Goods.BarCode is
'条形码';

comment on column Goods.InCode is
'内部条码';

comment on column Goods.WarpCode is
'包装条码';

comment on column Goods.Color is
'商品颜色';

comment on column Goods.Attribute is
'商品属性';

comment on column Goods.GoodsDesc is
'商品描述';

comment on column Goods.GoodsMark is
'商品备注';

comment on column Goods.AdvProxyPrice is
'高级代理销售价';

comment on column Goods.VIPPrice is
'VIP客户销售价';

comment on column Goods.GeneralPrice is
'普通客户销售价';

comment on column Goods.DistributionPrice is
'分销代理销售价';

comment on column Goods.SellPrice is
'销售销售价';

comment on column Goods.Discount is
'参加打折';

comment on column Goods.Integral is
'参加积分';

comment on column Goods.PromotePrice is
'促销价';

comment on column Goods.PromoteStartTime is
'促销开始时间';

comment on column Goods.PromoteEndTime is
'促销结束时间';

comment on column Goods.IsPromote is
'是否促销';

comment on column Goods.IsMemberPrice is
'是否享受会员价';

comment on column Goods.AddTimed is
'创建时间';

/*==============================================================*/
/* Index: Goods_PK                                              */
/*==============================================================*/
create unique index Goods_PK on Goods (
ID
);

/*==============================================================*/
/* Table: GoodsCat                                              */
/*==============================================================*/
create table GoodsCat (
   ID                   SERIAL not null,
   CompanyID            INT4                 null,
   CatName              VARCHAR(100)         null,
   PID                  INT4                 null,
   IsShow               INT2                 null,
   CatSort              INT2                 null,
   constraint PK_GOODSCAT primary key (ID)
);

comment on table GoodsCat is
'商品分类表';

comment on column GoodsCat.ID is
'自动编号';

comment on column GoodsCat.CompanyID is
'企业编号';

comment on column GoodsCat.CatName is
'类名';

comment on column GoodsCat.PID is
'父ID-对应本表的主键';

comment on column GoodsCat.IsShow is
'是否显示';

comment on column GoodsCat.CatSort is
'排序';

/*==============================================================*/
/* Index: GoodsCat_PK                                           */
/*==============================================================*/
create unique index GoodsCat_PK on GoodsCat (
ID
);

/*==============================================================*/
/* Table: GoodsUnit                                             */
/*==============================================================*/
create table GoodsUnit (
   ID                   SERIAL not null,
   UnitName             VARCHAR(20)          null,
   constraint PK_GOODSUNIT primary key (ID)
);

comment on table GoodsUnit is
'商品单位表';

comment on column GoodsUnit.ID is
'自动编号';

comment on column GoodsUnit.UnitName is
'单位名称';

/*==============================================================*/
/* Index: GoodsUnit_PK                                          */
/*==============================================================*/
create unique index GoodsUnit_PK on GoodsUnit (
ID
);

/*==============================================================*/
/* Table: MasterRole                                            */
/*==============================================================*/
create table MasterRole (
   ID                   SERIAL not null,
   CompanyID            INT4                 null,
   Title                VARCHAR(100)         null,
   Bewrite              VARCHAR(300)         null,
   ActionStr            VARCHAR(30)          null,
   constraint PK_MASTERROLE primary key (ID)
);

comment on table MasterRole is
'角色表';

comment on column MasterRole.ID is
'自动编号';

comment on column MasterRole.CompanyID is
'企业编号';

comment on column MasterRole.Title is
'名称';

comment on column MasterRole.Bewrite is
'描述';

comment on column MasterRole.ActionStr is
'权限字符串';

/*==============================================================*/
/* Index: MasterRole_PK                                         */
/*==============================================================*/
create unique index MasterRole_PK on MasterRole (
ID
);

/*==============================================================*/
/* Table: MasterUser                                            */
/*==============================================================*/
create table MasterUser (
   ID                   SERIAL not null,
   CompanyID            INT4                 null,
   RoleID               INT4                 null,
   LoginName            VARCHAR(30)          null,
   Password             VARCHAR(100)         null,
   ServingSector        VARCHAR(30)          null,
   Supervisor           VARCHAR(30)          null,
   Job                  VARCHAR(30)          null,
   JobDesc              VARCHAR(500)         null,
   RealName             VARCHAR(30)          null,
   Ethnic               VARCHAR(30)          null,
   Hometown             VARCHAR(30)          null,
   Sex                  INT2                 null,
   IDNumber             VARCHAR(30)          null,
   Edu                  VARCHAR(30)          null,
   Wage                 VARCHAR(30)          null,
   BirthDay             DATE                 null,
   EmployDay            DATE                 null,
   ExitDate             DATE                 null,
   Email                VARCHAR(30)          null,
   BorrowingLimit       DECIMAL(8,2)         null,
   SocialSecurity       INT2                 null,
   Tax                  INT2                 null,
   Address              VARCHAR(200)         null,
   StaffPic             VARCHAR(200)         null,
   IDNumberPic          VARCHAR(200)         null,
   StaffDesc            VARCHAR(500)         null,
   OfficePhone          VARCHAR(30)          null,
   HomePhone            VARCHAR(30)          null,
   MobilePhone          VARCHAR(30)          null,
   Status               INT2                 null,
   LoginNumber          INT4                 null,
   AllowIP              VARCHAR(30)          null,
   EmbarIP              VARCHAR(30)          null,
   AllowDate            VARCHAR(30)          null,
   LastLoginTime        DATE                 null,
   LastIP               VARCHAR(15)          null,
   CreateUser           VARCHAR(30)          null,
   AddTimed             DATE                 null,
   constraint PK_MASTERUSER primary key (ID)
);

comment on table MasterUser is
'用户表';

comment on column MasterUser.ID is
'自动编号';

comment on column MasterUser.CompanyID is
'企业编号';

comment on column MasterUser.RoleID is
'角色编号';

comment on column MasterUser.LoginName is
'管理员登陆名';

comment on column MasterUser.Password is
'管理员密码';

comment on column MasterUser.ServingSector is
'任职部门';

comment on column MasterUser.Supervisor is
'上级主管';

comment on column MasterUser.Job is
'员工岗位';

comment on column MasterUser.JobDesc is
'职务描述';

comment on column MasterUser.RealName is
'真实姓名';

comment on column MasterUser.Ethnic is
'民族';

comment on column MasterUser.Hometown is
'籍贯';

comment on column MasterUser.Sex is
'性别';

comment on column MasterUser.IDNumber is
'身份证号';

comment on column MasterUser.Edu is
'学历';

comment on column MasterUser.Wage is
'工资';

comment on column MasterUser.BirthDay is
'生日';

comment on column MasterUser.EmployDay is
'聘任日期';

comment on column MasterUser.ExitDate is
'离职时间';

comment on column MasterUser.Email is
'邮箱';

comment on column MasterUser.BorrowingLimit is
'借款限额';

comment on column MasterUser.SocialSecurity is
'交社保';

comment on column MasterUser.Tax is
'代扣个税';

comment on column MasterUser.Address is
'地址';

comment on column MasterUser.StaffPic is
'员工照片';

comment on column MasterUser.IDNumberPic is
'身份证照片';

comment on column MasterUser.StaffDesc is
'简介';

comment on column MasterUser.OfficePhone is
'办公室电话';

comment on column MasterUser.HomePhone is
'家庭电话';

comment on column MasterUser.MobilePhone is
'手机';

comment on column MasterUser.Status is
'状态';

comment on column MasterUser.LoginNumber is
'登录次数';

comment on column MasterUser.AllowIP is
'允许登陆的IP';

comment on column MasterUser.EmbarIP is
'禁止登陆的IP';

comment on column MasterUser.AllowDate is
'允许登陆的日期(周一至周日)';

comment on column MasterUser.LastLoginTime is
'最后登录时间';

comment on column MasterUser.LastIP is
'最后登录IP';

comment on column MasterUser.CreateUser is
'创建者';

comment on column MasterUser.AddTimed is
'创建时间';

/*==============================================================*/
/* Index: MasterUser_PK                                         */
/*==============================================================*/
create unique index MasterUser_PK on MasterUser (
ID
);

/*==============================================================*/
/* Table: Repository                                            */
/*==============================================================*/
create table Repository (
   ID                   SERIAL not null,
   CompanyID            INT4                 null,
   Title                VARCHAR(100)         null,
   RDesic               VARCHAR(1000)        null,
   Telephone            VARCHAR(30)          null,
   Address              VARCHAR(200)         null,
   Contact              VARCHAR(30)          null,
   Status               INT2                 null,
   IsDefault            INT2                 null,
   ReposDesc            VARCHAR(500)         null,
   constraint PK_REPOSITORY primary key (ID)
);

comment on table Repository is
'仓库表';

comment on column Repository.ID is
'自动编号';

comment on column Repository.CompanyID is
'企业编号';

comment on column Repository.Title is
'名称';

comment on column Repository.RDesic is
'描述';

comment on column Repository.Telephone is
'电话';

comment on column Repository.Address is
'地址';

comment on column Repository.Contact is
'联系人(仓库管理员)';

comment on column Repository.Status is
'状态';

comment on column Repository.IsDefault is
'默认发货仓库';

comment on column Repository.ReposDesc is
'备注';

/*==============================================================*/
/* Index: Repository_PK                                         */
/*==============================================================*/
create unique index Repository_PK on Repository (
ID
);

/*==============================================================*/
/* Table: Supplier                                              */
/*==============================================================*/
create table Supplier (
   ID                   SERIAL not null,
   CompanyID            INT4                 null,
   PinyinCode           VARCHAR(100)         null,
   Title                VARCHAR(100)         null,
   Fax                  VARCHAR(15)          null,
   Contact              VARCHAR(30)          null,
   MobilePhone          VARCHAR(30)          null,
   Email                VARCHAR(30)          null,
   QQ                   VARCHAR(20)          null,
   TaxID                VARCHAR(50)          null,
   Bank                 VARCHAR(50)          null,
   BankZip              VARCHAR(50)          null,
   Account              VARCHAR(50)          null,
   Address              VARCHAR(200)         null,
   Url                  VARCHAR(50)          null,
   Manager              VARCHAR(20)          null,
   InCredit             VARCHAR(20)          null,
   OutCredit            VARCHAR(20)          null,
   Deadline             VARCHAR(20)          null,
   Balance              VARCHAR(20)          null,
   Remark               VARCHAR(500)         null,
   constraint PK_SUPPLIER primary key (ID)
);

comment on table Supplier is
'供货商表';

comment on column Supplier.ID is
'自动编号';

comment on column Supplier.CompanyID is
'企业编号';

comment on column Supplier.PinyinCode is
'拼音编码';

comment on column Supplier.Title is
'名称';

comment on column Supplier.Fax is
'传真';

comment on column Supplier.Contact is
'联系人(仓库管理员)';

comment on column Supplier.MobilePhone is
'手机';

comment on column Supplier.Email is
'邮箱';

comment on column Supplier.QQ is
'QQ';

comment on column Supplier.TaxID is
'税号';

comment on column Supplier.Bank is
'开户行';

comment on column Supplier.BankZip is
'开户名称';

comment on column Supplier.Account is
'帐号';

comment on column Supplier.Address is
'地址';

comment on column Supplier.Url is
'网址';

comment on column Supplier.Manager is
'管理负责人';

comment on column Supplier.InCredit is
'应收款信用额度';

comment on column Supplier.OutCredit is
'应付款信用额度';

comment on column Supplier.Deadline is
'帐期';

comment on column Supplier.Balance is
'期初余额';

comment on column Supplier.Remark is
'备注';

/*==============================================================*/
/* Index: Supplier_PK                                           */
/*==============================================================*/
create unique index Supplier_PK on Supplier (
ID
);

