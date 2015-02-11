<?php
/*
功能：前端页面自动生成
时间：2013年5月16日
作者：MarkThink

ProcSQL		 	GameGoods.txt		获取存储过程调用代码
GetViewCode		GameGoodsInfo.txt	获取前端页面视图代码
PushProcedure           GameGoodsInfo.txt	获取前端页面处理代码
*/
class GenCode{
	/*
	功能：公共函数 - 打开文件并检测文件是否存在
	参数：
		$FileName	输入文本文件
	作者：MarkThink
	时间：2012-08-01
	*/
	function OpenFile($FileName){
		if(file_exists($FileName)){
			$Handle=fopen($FileName,'rb');
			$Contents=fread($Handle,filesize($FileName));
			fclose($Handle);
			return $Contents;
		}else{
			die("请检查您的输入文件是否存在！");
		}
	}
	/*
	功能：生成存储过程需要用到的参数
	参数
		$FileName	输入表格文件
		$action		控制生成SQL代码的方式 
			in	更新数据表
			out	输出参数值
			''	存储过程输入参数
	作者：MarkThink
	时间：2012-07-31
	用例：
		ProcSQL($FileName,'');		//存储过程输入参数
		ProcSQL($FileName,'in');	//更新数据表
		ProcSQL($FileName,'out');	//获取参数值
	*/
	function ProcSQL($FileName,$action){
		$Contents=$this->OpenFile($FileName);
		$preg="/\s+?(\w+?)\s+?([\w\(\)\d]+?)\s.*?\n/";
		preg_match_all($preg,$Contents,$matches);
		$OutContent="";
		$Fileds='';$Params='';//用于生成插入SQL
		for ($i=0; $i< count($matches[0]); $i++) {
			switch($action)
			{
				//1.更新数据表
				case 'in';
					$OutContent.='['.$matches[1][$i].']=@'.$matches[1][$i].",\n";
					break;
				//2.输出参数值
				case 'out':
					$OutContent.='@'.$matches[1][$i].'=['.$matches[1][$i].'],'."\n";
					break;
				//查询输出
				case 'select':
					$Fileds.="	[".$matches[1][$i]."],\n";
					break;
				//插入输出
				case 'insert':
					$Fileds.="	[".$matches[1][$i]."],\n";
					$Params.="	@".$matches[1][$i].",\n";
					break;
				//表复制
				case 'copy':
					$Fileds.="	[".$matches[1][$i]."],\n";
					break;
				//组合内存表
				case 'temptable':
					$OutContent.='	['.$matches[1][$i].']	'.$matches[2][$i].",\n";
					break;
				//3.存储过程输入参数
				default:
					$OutContent.='@'.$matches[1][$i].'	'.$matches[2][$i].",\n";		
			}
		}
		//根据条件组装输出字符串
		switch($action){
			case 'select':
				echo "查询SQL代码\n";
				echo "select ".substr($Fileds,0,strlen($Fileds)-2)."\nfrom [dbo].[数据表]\n\n";
				break;
			case 'insert':
				echo "插入SQL代码\n";
				echo "insert into [dbo].[表名](\n".substr($Fileds,0,strlen($Fileds)-2).")\nvalues(\n".substr($Params,0,strlen($Params)-2).")\n\n";
				break;
			case 'copy':
				echo "复制SQL代码\n";
				echo "insert into [dbo].[插入表名](\n".substr($Fileds,0,strlen($Fileds)-2).")\nselect ".substr($Fileds,0,strlen($Fileds)-2)."\nfrom [dbo].[查询表]\n\n";
				break;
			case 'temptable':
				echo "内存表结构代码\n";
				echo "declare @TempResult table("."\n".substr($OutContent,0,strlen($OutContent)-2)."\n)\n\n";
				break;
			case 'in':
				echo "更新数据表代码\n";
				echo "update [dbo].[表名] set\n";
				echo substr($OutContent,0,strlen($OutContent)-2)."\n\n";
				break;
			case 'out':
				echo "获取参数值代码\n";
				echo substr($OutContent,0,strlen($OutContent)-2)."\n\n";
				break;
			default:
				echo "存储过程参数代码\n";
				echo substr($OutContent,0,strlen($OutContent)-2)."\n\n";
		}
	}
	
	/*
	功能：解析SQL生成表格视图
	参数：
		$FileName	输入表格信息文件
	作者：MarkThink
	时间：2012-07-31
		GetViewCode($FileName,'Table');
	*/
	function GetViewCode($FileName,$action){
		$Contents=$this->OpenFile($FileName);
		$preg="/execute[\s\S]*?,\s*?'([\s\S]*?)',[\s\S]*?,[\s\S]*?,[\s\S]*?,[\s\S]*?,[\s\S]*?,\s'([\s\S]*?)'/";
		preg_match_all($preg,$Contents,$matches);
		switch($action){
			//构建列表头视图界面
			case 'Header':
				echo "构建头信息视图界面代码\n<table>\n	<tr>\n";
				for ($i=0; $i< count($matches[0]); $i++) {
				  echo "		<td>".$matches[1][$i]."</td>\n";
				}
				echo "	</tr>\n</table>\n\n";
				break;
			//构建创建表格视图界面
			case 'Table':
				echo "构建创建表格视图界面代码\n<table>\n	<tr>\n";
				for ($i=0; $i< count($matches[0]); $i++) {
				  echo "		<td>".$matches[1][$i]."：</td>\n";
				  echo "		<td><input type='text' name='".$matches[2][$i]."'/></td>\n";
				}
				echo "	</tr>\n</table>\n\n";
				break;
			//构建修改表格视图界面
			case 'ModifyTable':
				echo "构建修改表格视图界面代码\n<table>\n	<tr>\n";
				for ($i=0; $i< count($matches[0]); $i++) {
				  echo "		<td>".$matches[1][$i]."：</td>\n";
				  echo '		<td><input type="text" name="'.$matches[2][$i].'" value="{$'.$matches[2][$i].'}"/></td>'."\n";
				}
				echo "	</tr>\n</table>\n\n";
				break;
			//构建创建DIV视图界面
			case 'Div':
				echo "构建创建DIV视图界面代码\n <ul class='UILayout'>\n";
				for ($i=0; $i< count($matches[0]); $i++) {
				   echo "	<li><label>".$matches[1][$i]."：</label><input type='text' name='".$matches[2][$i]."'/></li>\n";
				}
				echo "</ul>\n\n";
				break;
			//构建创建DIV视图界面 作为输出字符串
			case 'RetDiv':
				$Content= "构建创建DIV视图界面代码\n <ul class='UILayout'>\n";
				for ($i=0; $i< count($matches[0]); $i++) {
				   $Content.= "	<li><label>".$matches[1][$i]."：</label><input type='text' name='".$matches[2][$i]."'/></li>\n";
				}
				$Content.= "</ul>\n\n";
				return $Content;
				break;
			//构建修改DIV视图界面
			case 'ModifyDiv':
				echo "构建修改DIV视图界面代码\n <ul class='UILayout'>\n";
				for ($i=0; $i< count($matches[0]); $i++) {
				  echo '	<li><label>'.$matches[1][$i].'：</label><input type="text" name="'.$matches[2][$i].'" value="{$'.$matches[2][$i].'}"/></li>'."\n";
				}
				echo "</ul>\n\n";
				break;
			default:
				echo "构建修改模板输出代码\n";
				for ($i=0; $i< count($matches[0]); $i++) {
					echo '$this->assign("'.$matches[2][$i].'",$'.$matches[2][$i].");\n";	
				}
				echo "\n\n";
		}
	}
	/*
	功能：获取页面内容组装存储过程参数
	参数：
		$FileName	输入表格信息文件
	作者：MarkThink
	时间：2012-08-01
	用例：PushProcedure($FileName);
	*/
	function PushProcedure($FileName){
		$Contents=$this->OpenFile($FileName);
		$preg="/execute[\s\S]*?,\s*?'([\s\S]*?)',[\s\S]*?,[\s\S]*?,[\s\S]*?,[\s\S]*?,[\s\S]*?,\s'([\s\S]*?)'/";
		preg_match_all($preg,$Contents,$matches);
		
		$Request="前端页面处理代码\n";//组装请求参数
		$Params='';//组装存储过程参数数组
		$CallNum='';//组装调用参数数量
		for ($i=0; $i< count($matches[0]); $i++) {
			$Request.='$'.$matches[2][$i].'=$_POST["'.$matches[2][$i].'"];'."\n";
			$Params.="	array(&$".$matches[2][$i].",SQLSRV_PARAM_IN),\n";
			$CallNum.="?,";
		}
		//组装存储过程调用代码
		echo $Request."\n";
		echo '$params=array('."\n".$Params.");\n\n";
		echo '$tsql="{call 存储过程名('.substr($CallNum,0,strlen($CallNum)-1).')}";'."\n";
		echo '$conn=$this->Connect($ServerIP,"数据库");'."\n";
		echo '$stmt=sqlsrv_query($conn,$tsql,$params);'."\n";
		echo 'if($stmt===false){die($this->FormatErrors(sqlsrv_errors()));}'."\n\n";
		echo '//释放资源'."\n";
		echo 'sqlsrv_free_stmt($stmt);'."\n";
		echo 'sqlsrv_close($conn);'."\n\n";
	}
	
	/*
	功能：获取输入存储过程-带注释
	参数：
		$FileCreateTable	创建表格文件
		$FileTableInfo		表格信息文件
	作者：MarkThink
	时间：2012-09-06
		GetInputProcParam($FileCreateTable,$FileTableInfo);
	*/
	function GetInputProcParam($FileCreateTable,$FileTableInfo){
		$Contents=$this->OpenFile($FileCreateTable);
		$preg="/\s+?(\w+?)\s+?([\w\(\)\d]+?)\s.*?\n/";
		preg_match_all($preg,$Contents,$matches);
		$OutContent="";
		//获取视图界面源码
		$ContentRet=$this->GetViewCode($FileTableInfo,'RetDiv');
		for ($i=0; $i< count($matches[0]); $i++) {
			//调试了很久，注意:必须要多行模式才可以匹配
			$pregcomment="/<li><label>(.*?)：<\/label><input type='text' name='".$matches[1][$i]."'\/><\/li>$/m";
			preg_match($pregcomment,$ContentRet,$matchComment);
			$OutContent.='@'.$matches[1][$i].'	'.$matches[2][$i].",	--".$matchComment[1]."\n";	
		}
		print($OutContent."\n");
		
	}
	/*
	功能：根据SQL存储过程输入参数文本生成相应的SCP文件结构
	参数：
		$FileSQL	SQL输入参数文件
	作者：MarkThink
	时间：2012-09-06
		GetSCPInfo($FileSQL);
	*/
	function GetSCPInfo($FileSQL){
		$Contents=$this->OpenFile($FileSQL);
		$preg="/请求：(\d+)[\s\S]*?功能：([\s\S]*?)\n[\s\S]*?聚集：(\d)[\s\S]*?PROCEDURE \[dbo\]\.\[(\w+?)\]\s*?\(([\s\S]*?)\n\)/";
		preg_match_all($preg,$Contents,$matches);
		$OutContent="";
		for($i=0;$i<count($matches[0]);$i++){
			$OutContent.='request = '.$matches[1][$i]."\n";		//SCP请求编号
			$OutContent.="{\n\t//存储过程名作用：".$matches[2][$i]."\n\t";//存储过程说明
			$OutContent.='spname = '.$matches[4][$i];			//存储过程名称
			$OutContent.="\n\n\t//DB TYPE\n\tdbtype = 2";			//数据库类型
			$OutContent.="\n\n\t//有无结果集\n\t";
			$OutContent.='recordset = '.$matches[3][$i];		//是否输出聚集
			$OutContent.="\n\n\t//重要度\n\tweightness = 4";
			$OutContent.="\n\n\t//输入数据结构信息\n\t";
			$OutContent.=$this->GetInputSCP($matches[5][$i],'');
			$OutContent.="\t//存储过程参数表\n\t";
			$OutContent.=$this->GetProcParamSCP($matches[5][$i]);
			$OutContent.="\n\t//输出数据结构信息\n\t";
			$OutContent.=$this->GetOutputSCP($matches[5][$i],'');
			$OutContent.="\t//用于输出结果集的数据结构信息\n\t";
			//如果有聚集输出相关字段内容
			if ($matches[3][$i]==1){
				$OutContent.=$this->GetRecordSetSCP($matches[5][$i]);
			}else{
				$OutContent.="output struct for recordset\n\t{\n\t}\n";
			}
			$OutContent.="}\n\n";
		}
		print($OutContent);
		//print_r($matches);
	}
	/*
	功能：解析聚集数据结构
	参数：
		$SQLContent	SQL字段内容
	作者：MarkThink
	时间：2012-09-07
		GetRecordSetSCP($SQLContent);
	*/
	function GetRecordSetSCP($SQLContent){
		$OutContent='';
		$OutContent.="output struct for recordset\n\t{";
		$OutContent.=$this->GetInputSCP($SQLContent,'recordset');
		$OutContent.=$this->GetOutputSCP($SQLContent,'recordset');
		$OutContent.="\n\t}\n";
		return $OutContent;
	}
	/*
	功能：解析存储过程参数表
	参数：
		$SQLContent	SQL字段内容
	作者：MarkThink
	时间：2012-09-07
		GetProcParamSCP($SQLContent);
	*/
	function GetProcParamSCP($SQLContent){
		$OutContent='store procedure'."\n\t{\n\t\t";
		$OutContent.="RETURN_VALUE\t\treturn\t\tint\t\t4\t\t-";
		$OutContent.=$this->GetInputSCP($SQLContent,'ProcParam');
		$OutContent.=$this->GetOutputSCP($SQLContent,'ProcParam');
		$OutContent.="\n\t}\n";
		return $OutContent;
	}
	
	/*
	功能：解析输出参数
	参数：
		$SQLContent		SQL字段内容
		$IsParam		是否用于存储过程参数表 true或false
	作者：MarkThink
	时间：2012-09-07
		GetOutputSCP($SQLContent,$IsParam);
	*/
	function GetOutputSCP($SQLContent,$IsParam){
		$preg="/@(\w+)\s*?([\(\)\w]*?)\s*?output/";
		preg_match_all($preg,$SQLContent,$matches);
		$OutContent='';
		switch($IsParam){
			case 'recordset':
				for($i=0;$i<count($matches[0]);$i++){
					$OutContent.="\n\t\t";
					$OutContent.=$this->GetFiledLength($matches[2][$i]);//字段长度
					$OutContent.="\t\trdset\t\t".$matches[1][$i];//字段名
				}
				break;
			case 'ProcParam':
				for($i=0;$i<count($matches[0]);$i++){
					$OutContent.="\n\t\t@".$matches[1][$i]."\t\toutput\t\t";//字段名
					$OutContent.=$this->GetFiledType($matches[2][$i])."\t\t";
					$OutContent.=$this->GetFiledLength($matches[2][$i]);//字段长度
					$OutContent.="\t\t-";
				}
				break;
			default:
				$OutContent='output struct'."\n\t{\n\t\t";
				$OutContent.="4\t\tsp\t\tRETURN_VALUE";
				for($i=0;$i<count($matches[0]);$i++){
					$OutContent.="\n\t\t";
					$OutContent.=$this->GetFiledLength($matches[2][$i]);//字段长度
					$OutContent.="\t\tsp\t\t@".$matches[1][$i];//字段名
				}
				$OutContent.="\n\t}\n\n";
				break;
		}
		return $OutContent;
	}
	
	/*
	功能：解析输入参数
		参数：
		$SQLContent		SQL字段内容
		$IsParam		是否用于存储过程参数表 true或false
	作者：MarkThink
	时间：2012-09-06
		GetInputSCP($SQLContent,$IsParam);
	*/
	function GetInputSCP($SQLContent,$IsParam){
		$preg="/@(\w+?)\s*?([\w|\(|\)]*?),/";
		preg_match_all($preg,$SQLContent,$matches);
		$OutContent='';
		switch($IsParam){
			case 'recordset':
				for($i=0;$i<count($matches[0]);$i++){
					$OutContent.="\n\t\t";
					$OutContent.=$this->GetFiledLength($matches[2][$i]);//字段长度
					$OutContent.="\t\trdset\t\t".$matches[1][$i]."\t\t";//字段名
				}
				break;
			case 'ProcParam':
				for($i=0;$i<count($matches[0]);$i++){
					$OutContent.="\n\t\t@".$matches[1][$i]."\t\tinput\t\t";//字段名
					$OutContent.=$this->GetFiledType($matches[2][$i])."\t\t";
					$OutContent.=$this->GetFiledLength($matches[2][$i]);//字段长度
					$OutContent.="\t\t".$matches[1][$i];
				}
				break;
			default:
				$OutContent.='input struct'."\n\t{";
				for($i=0;$i<count($matches[0]);$i++){
					$OutContent.="\n\t\t";
					$OutContent.=$matches[1][$i]."\t\t";//字段名
					$OutContent.=$this->GetFiledLength($matches[2][$i]);//字段长度
				}
				$OutContent.="\n\t}\n\n";
				break;
		}
		//print($OutContent);
		//print_r($matches);
		return $OutContent;
	}
	/*功能：根据字段的数据类型输出不同的长度*/
	function GetFiledLength($FiledContent){
		$OutContent='';
		$pos=strpos($FiledContent,'(');
		
		if($pos===false){
			switch($FiledContent){
				case 'tinyint':
					$OutContent.=1;
					break;
				case 'smallint':
					$OutContent.=2;
					break;
				case 'int':
					$OutContent.=4;
					break;
				case 'bigint':
					$OutContent.=8;
					break;
				case 'float':
					$OutContent=4;
					break;
				case 'smallmoney':
					$OutContent.=4;
					break;	
				case 'money':
					$OutContent.=8;
					break;
			}
		}else{
			$pattern="/\w+?\((\d+?)\)/";
			$OutContent.=preg_replace($pattern,'$1',$FiledContent);
		}
		return $OutContent;
	}
	/*功能：用于存储过程参数表 取得字段类型*/
	function GetFiledType($FiledContent){
		$OutContent='';
		$pos=strpos($FiledContent,'(');
		
		if($pos===false){
			$OutContent.=$FiledContent;
		}else{
			$pattern="/(\w+?)\(\d+?\)/";
			$OutContent.=preg_replace($pattern,'$1',$FiledContent);
		}
		return $OutContent;
	}
}
?>