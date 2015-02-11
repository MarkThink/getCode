<?php
header('Content-type:text/html;charset=utf-8');
include('getCodebak.class.php');
/*
TableView		GameGoodsInfo.txt	获取前端页面视图代码
PushProcedure           GameGoodsInfo.txt       获取前端页面处理代码

ProcSQL		 	GameGoods.txt		获取存储过程调用代码
--------------------------------------------------------
$getCode=new GenCode();

$getCode->TableView($TableInfo);	//获取视图界面
$getCode->PushProcedure($TableInfo);	//获取处理代码

$getCode->ProcSQL($CreateTable,'');	//存储过程输入参数
$getCode->ProcSQL($CreateTable,'in');	//更新数据表
$getCode->ProcSQL($CreateTable,'out');	//获取参数值
---------------------------------------------------------
Actor.txt			ActorInfo.txt			角色
ActorTemplate.txt		ActorTemplateInfo.txt           角色模板
ActorLog.txt			ActorLogInfo.txt		角色日志
GameGoods.txt			GameGoodsInfo.txt		物品
GamePet.txt			GamePetInfo.txt			宠物
GamePetGoods.txt		GamePetGoodsInfo.txt            宠物物品

浏览器查看：
view-source:http://www.think.com/handgame/gencode/getcode.php
*/

//角色
//$CreateTable="Actor.txt";
//$TableInfo="ActorInfo.txt";

//角色模板
//$CreateTable="ActorTemplate.txt";
//$TableInfo="ActorTemplateInfo.txt";
//
//角色日志
//$CreateTable="ActorLog.txt";
//$TableInfo="ActorLogInfo.txt";

//物品
//$CreateTable="GameGoods.txt";
//$TableInfo="GameGoodsInfo.txt";

//宠物
//$CreateTable="GamePet.txt";
//$TableInfo="GamePetInfo.txt";

//宠物物品
//$CreateTable="GamePetGoods.txt";
//$TableInfo="GamePetGoodsInfo.txt";

//邮件
//$CreateTable="GameEmail.txt";
//$TableInfo="GameEmailInfo.txt";

//市场
//$CreateTable="Market.txt";
//$TableInfo="MarketInfo.txt";

//好友聊天
//$CreateTable="FriendChat.txt";
//$TableInfo="FriendChatInfo.txt";

//权限节点
//$CreateTable="Powers.txt";
//$TableInfo="PowersInfo.txt";

//游戏订单数据表
//$CreateTable="Gameorder.txt";
//$TableInfo="GameorderInfo.txt";

//CMD轮询数据表
//$CreateTable="Gamecmd.txt";
//$TableInfo="GamecmdInfo.txt";

//系统消息数据表
$CreateTable="GamePet.txt";
$TableInfo="GamePetInfo.txt";

//SQL生成SCP文件结构
//$SQL2SCP="sql2scp.txt";

$getCode=new GenCode();
//$getCode->GetSCPInfo($SQL2SCP);
$getCode->GetInputProcParam($CreateTable,$TableInfo);

// $getCode->GetViewCode($TableInfo,'Header');
// $getCode->GetViewCode($TableInfo,'Table');
// $getCode->GetViewCode($TableInfo,'ModifyTable');
// $getCode->GetViewCode($TableInfo,'Div');
// $getCode->GetViewCode($TableInfo,'ModifyDiv');
// $getCode->GetViewCode($TableInfo,'');
// $getCode->PushProcedure($TableInfo);

// $getCode->ProcSQL($CreateTable,'');
// $getCode->ProcSQL($CreateTable,'in');
// $getCode->ProcSQL($CreateTable,'out');
// $getCode->ProcSQL($CreateTable,'select');
// $getCode->ProcSQL($CreateTable,'insert');
// $getCode->ProcSQL($CreateTable,'copy');
// $getCode->ProcSQL($CreateTable,'temptable');





