<?php
header('Content-type:text/html;charset=utf-8');
include('phpQuery/phpQuery.php');
include('Invoicing3rth.php');

$SqlInfo="weibu.sql";
$getCode=new GenCode();
// $getCode->TwigHtml($SqlInfo,'');
// $getCode->TwigHtml($SqlInfo,'new');
// $getCode->TwigHtml($SqlInfo,'edit');
// $getCode->TwigHtml($SqlInfo,'show');



// $getCode->SymfonyPHP($SqlInfo,'router');
// $getCode->SymfonyPHP($SqlInfo,'import');
 $getCode->SymfonyPHP($SqlInfo,'all');




