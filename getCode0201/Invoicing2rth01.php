<?php
/*
功能：前端页面自动生成
时间：2013年5月16日
作者：MarkThink
*/
class GenCode{
	
	/*
	定义模板文件
	*/
	private $twigindex 	= 'index.html';
	private $twignew	= 'new.html';

	private $bundle 	= 'RaysTopBundle';
	private $page 		= 200;
	private $twigdir	= 'account';

	private $tmpdir		= './temp';
	
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
	写入内容到指定的文件
	 */
	function WriteFile($FileName,$Content){
		@mkdir($this->tmpdir);
		$file=$this->tmpdir.'/'.$FileName;
		$Handle=fopen($file,'wb');//打开并创建文件
		if(is_writable($file)){//确定文件存在且可写
			if(fwrite($Handle, $Content)===false){
				die("不能写入到文件".$FileName);
			}
		}else{
			die("文件".$FileName."不可写");
		}
		fclose($Handle);
	}
	/*
	功能：后端页面处理代码
	参数
		$FileName	输入表格文件
		$action		控制生成HTML代码生成方式 
			''		默认列表页
			new		创建界面
			create	创建处理
			edit	修改界面
			update	修改处理
			delete	删除处理
			show	显示界面
	作者：MarkThink
	时间：2013-05-16
	用例：
		PHP($FileName,'new');
		PHP($FileName,'create');
		PHP($FileName,'edit');
		PHP($FileName,'update');
		PHP($FileName,'delete');
		PHP($FileName,'show');
	*/
	function SymfonyPHP($FileName,$action){
		$content=$this->BasicData($FileName);
		switch($action){
			case 'new':
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";
					$html=$tname."
public function ".$tcode."newAction(\$cid,\$uid)
{
	return \$this->render('".$this->bundle.":".$this->twigdir.":".$tcode."new.html.twig', array(
	    'cid'=>\$cid,
	    'uid'=>\$uid,
	));
}
";
					echo $html."\n-----------------------------------------------------\n";
				}
				break;
			case 'create':
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";

					$request="";$entity="";
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						$colcode=strtolower($sfcode);
						$fcolcode=$this->HumpName($content[$i]['column'][$j]['code']);
						//$colname=$content[$i]['column'][$j]['name'];
						// echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						
						$request=$request."\$".$colcode.'=$request->request->get("'.$colcode.'");'."\n\t";
						$entity=$entity."\$entity->set".$fcolcode."(\$".$colcode.");\n\t";
					}

					$html=$tname."			
public function ".$tcode."createAction(\$cid,\$uid,Request \$request)
{
	".$request."
	\$entity=new ".$humpcode."();
	".$entity."
	\$em = \$this->getDoctrine()->getManager();
	\$em->persist(\$entity);
	\$em->flush();

	return \$this->redirect(\$this->generateUrl('".$tcode."show', array(
	        'cid'=>\$cid,
	        'uid'=>\$uid,
	        'id' => \$entity->getId(),
	)));
}";

					echo $html."\n-----------------------------------------------------\n";
					
				}
				break;		
			case 'edit':
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";
					$html=$tname."
public function ".$tcode."editAction(\$cid,\$uid,\$id)
{
	\$em = \$this->getDoctrine()->getManager();
	\$entity=\$em->getRepository('".$this->bundle.":".$humpcode."')->find(\$id);
	if(!\$entity){
		return \$this->Errproc('数据获取失败');
	}

	return \$this->render('".$this->bundle.":".$this->twigdir.":".$tcode."edit.html.twig', array(
		'entity'=>\$entity,
		'cid'=>\$cid,
		'uid'=>\$uid,
	));
}
";
					echo $html."\n-----------------------------------------------------\n";
				}
				break;
			case 'update':
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";

					$request="";$entity="\t";$dql="update ".$this->bundle.":".$humpcode." t \n\t\tset ";
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						$colcode=strtolower($sfcode);
						$fcolcode=$this->HumpName($content[$i]['column'][$j]['code']);
						//$colname=$content[$i]['column'][$j]['name'];
						// echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						
						$request=$request."\$".$colcode.'=$request->request->get("'.$colcode.'");'."\n\t";
						$entity=$entity."\t'".$colcode."'=>\$".$colcode.",\n\t";
						$dql=$dql."t.".$sfcode."='\".\$updateArr['".$colcode."'].\"',\n\t\t";
					}
					$dql=rtrim(trim($dql), ',');
					$dql=$dql." \n\t\t where t.id=:id";
					$html=$tname."			
public function ".$tcode."updateAction(\$cid,\$uid,\$id,Request \$request)
{
	".$request."
	\$updateArr=array(\n".$entity.");\n
	\$em=\$this->getDoctrine()->getManager();
	\$em->getRepository('".$this->bundle.":".$humpcode."')
         ->updateEditInfo(\$updateArr,\$id);

	return \$this->redirect(\$this->generateUrl('".$tcode."', array(
	        'cid'=>\$cid,
	        'uid'=>\$uid,
	)));
}\n

public function updateEditInfo(\$updateArr,\$id)
{
    \$entity = \$this->getEntityManager()
            ->getRepository('".$this->bundle.":".$humpcode."')->find(\$id);
    if (!\$entity) {
        return \$this->Errproc('此".$tname."不存在，请核实..');
    }
    \$this->getEntityManager()
            ->createQuery(\"".$dql."\")
            ->setParameter('id',\$id)
            ->execute();
}";

					echo $html."\n-----------------------------------------------------\n";
				}
				break;			
			case 'delete':
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";
					$html=$tname."
public function ".$tcode."delAction(\$cid,\$uid,\$id)
{
	\$em = \$this->getDoctrine()->getManager();
	\$entity = \$em->getRepository('".$this->bundle.":".$humpcode."')->find(\$id);
	if (!\$entity) {
		return \$this->Errproc('此".$tname."不存在，请核实..');
	}
	\$em->remove(\$entity);
	\$em->flush();
	return \$this->redirect(\$this->generateUrl('".$tcode."',array(
		'cid'=>\$cid,
		'uid'=>\$uid,
	)));
}
";
					echo $html."\n-----------------------------------------------------\n";
				}
				break;
			case 'show':
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";
					$html=$tname."
public function ".$tcode."showAction(\$cid,\$uid,\$id)
{
	\$em = \$this->getDoctrine()->getManager();
	\$entity = \$em->getRepository('".$this->bundle.":".$humpcode."')->find(\$id);
	if (!\$entity) {
		return \$this->Errproc('此".$tname."不存在，请核实..');
	}

	return \$this->render('".$this->bundle.":".$this->twigdir.":".$tcode."show.html.twig', array(
	'entity'      => \$entity,
	'cid'=>\$cid,
	'uid'=>\$uid,
	));

}
";
					echo $html."\n-----------------------------------------------------\n";
				}
				break;
			default:
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";
					$html=$tname."
public function ".$tcode."Action(\$cid,\$uid)
{
	\$em=\$this->getDoctrine()->getManager();
	\$entities=\$em->getRepository('".$this->bundle.":".$humpcode."')->findAll();

	return \$this->render('".$this->bundle.":".$this->twigdir.":".$tcode.".html.twig',array(
		'entities'=>\$entities,
		'cid'=>\$cid,
		'uid'=>\$uid,
	));
}
";
					echo $html."\n-----------------------------------------------------\n";
				}

		}
	}
	/*
	功能：生成模板文件
	参数
		$FileName	输入表格文件
		$action		控制生成HTML代码生成方式 
			''		默认列表页
			new		新增
			edit	修改
			show	显示
	作者：MarkThink
	时间：2013-05-16
	用例：
		TwigHtml($FileName,'index');
		TwigHtml($FileName,'new');
		TwigHtml($FileName,'edit');
		TwigHtml($FileName,'show');
	*/
	function TwigHtml($FileName,$action){
		$content=$this->BasicData($FileName);
		switch($action){
			case 'new':
				$html=phpQuery::newDocumentFile($this->twignew);
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";
					$navlist="<b>
					<a class='btn btn-warning' 
					href=@@path('".$tcode."',@'cid':cid,'uid':uid#)##"."> 
					<i class='icon-plus icon-white'></i>
					".$tname."列表
					</a></b>";

					pq(".pheader")->empty()->append($navlist);
					pq(".form-horizontal")->attr("action","@@path('".$tcode."_create',@'cid':cid,'uid':uid#)##");

					$formFiled='<div class="pcontent" style="margin-top: 10px;border: 2px solid #E5E4E3;">';
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						$colcode=strtolower($sfcode);
						$colname=$content[$i]['column'][$j]['name'];

						//echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						$formFiled=$formFiled.'
								<div class="control-group">
									<label class="control-label">'.$colname.'</label>
									<div class="controls">
										<input type="text" name="'.$colcode.'">
									</div>
								</div>
						';
					}
					$createBtn='			
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">创 建</button>
					</div></div>';

					pq(".form-horizontal")->append($formFiled.$createBtn);
					$this->WriteFile($tcode.'_new.html.twig',$html);
					//echo $html."\n-----------------------------------------------------\n";
					pq(".form-horizontal")->empty();#清空缓存
				}
				phpQuery::$documents = array();
				break;
			case 'edit':
				$html=phpQuery::newDocumentFile($this->twignew);
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";

					$navlist="<b>
					<a class='btn btn-warning' 
					href=@@path('".$tcode."',@'cid':cid,'uid':uid#)##"."> 
					<i class='icon-plus icon-white'></i>
					".$tname."列表
					</a></b>";

					pq(".pheader")->empty()->append($navlist);
					pq(".form-horizontal")->attr("action","@@path('".$tcode."_update',@'cid':cid,'uid':uid,'id':entity.id#)##");

					$formFiled='<div class="pcontent" style="margin-top: 10px;border: 2px solid #E5E4E3;">';
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						$colcode=strtolower($sfcode);
						$colname=$content[$i]['column'][$j]['name'];
						// echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						$formFiled=$formFiled.'
								<div class="control-group">
									<label class="control-label">'.$colname.'</label>
									<div class="controls">
										<input type="text" name="'.$colcode.'" value="{{entity.'.$sfcode.'}}">
									</div>
								</div>
						';
					}

					$createBtn='			
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">修 改</button>
					</div></div>';

					pq(".form-horizontal")->append($formFiled.$createBtn);
					$this->WriteFile($tcode.'_edit.html.twig',$html);
					//echo $html."\n-----------------------------------------------------\n";
					pq(".form-horizontal")->empty();#清空缓存
				}
				phpQuery::$documents = array();
				break;
			case 'show':
				$html=phpQuery::newDocumentFile($this->twignew);
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";
					$navlist="<b><a class='btn btn-warning' href=@@path('".$tcode."',@'cid':cid,'uid':uid#)##"."> 
					<i class='icon-plus icon-white'></i>".$tname."列表</a></b><b><a class='btn btn-warning' 
					href=@@path('".$tcode."_new',@'cid':cid,'uid':uid#)##"."> <i class='icon-plus icon-white'></i>继续创建</a></b>";

					pq(".pheader")->empty()->append($navlist);
					pq(".form-horizontal")->remove();//删除表单元素

					$formFiled='<div class="pcontent" style="margin-top: 10px;border: 2px solid #E5E4E3;">';
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						//$colcode=strtolower($sfcode);
						$colname=$content[$i]['column'][$j]['name'];

						//echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						$formFiled=$formFiled."\n<dl class='dl-horizontal'>
						<dt>".$colname."</dt>
						<dd>{{entity.".$sfcode."}}</dd>
						\n</dl>
						";
					}
					pq(".span12:eq(1)")->append($formFiled."</div>");
					$this->WriteFile($tcode.'_show.html.twig',$html);
					//echo $html."\n-----------------------------------------------------\n";
					pq(".span12:eq(1)")->empty();#清空缓存
				}
				phpQuery::$documents = array();
				break;
			default:
				$html=phpQuery::newDocumentFile($this->twigindex);
				for ($i=0; $i< count($content); $i++){
					$humpcode=$this->HumpName($content[$i]['code']);
					$tcode=strtolower($humpcode);
					$tname=$content[$i]["name"];
					// echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";

					$navlist="<b>
					<a class='btn btn-warning' 
					href=@@path('".$tcode."_new',@'cid':cid,'uid':uid#)##"."> 
					<i class='icon-plus icon-white'></i>
					添加".$tname."
					</a></b>";

					pq(".pheader")->empty()->append($navlist);

					$thead='<th><input type="checkbox" name="AllCheck"></th>';
					$tbody='<td><input type="checkbox" name=""></td>';
				
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						//$colcode=strtolower($sfcode);
						$colname=$content[$i]['column'][$j]['name'];
						// echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						$thead=$thead."<th>".$colname."</th>";
						$tbody=$tbody."<td>{{entity.".$sfcode."}}</td>";
					}

					pq("table thead tr:first")->empty()->append($thead);
					pq("table tbody tr:first")->empty()->append($tbody);
					pq("table thead tr:last")->append('<th>操作</th>');
					$operator="
						<td><ul class='listedit'>
						<li><a href=@@path('".$tcode."_edit',@'cid':cid,'uid':uid,'id':entity.id#)##>编辑</a></li>
						<li><a href=@@path('".$tcode."_del',@'cid':cid,'uid':uid,'id':entity.id#)##>删除</a></li>
						</ul></td>
					";
					pq("table tbody tr:last")->append($operator);
					//$this->WriteFile($tcode.'_index.html.twig',$html);
					echo $html."\n-----------------------------------------------------\n";
                    die();
				}
				#资源释放
				phpQuery::$documents = array();
		}
	}

	/*
	功能：返回基础资料 - 输入文件源于基础的PostgreSQL数据库脚本
	作者：MarkThink
	时间：2013-05-16
	格式如下：
	Array
	(
    [0] => Array
        (
            [name] => 权限表
            [code] => ActionPowers
            [column] => Array
                (
                    [0] => Array
                        (
                            [name] => 自动编号
                            [code] => ID
                            [type] => SERIAL
                        )
                    [1] => Array
                        (
                            [name] => 权限字符串
                            [code] => ActionStr
                            [type] => VARCHAR(1000)
                        )
                    [2] => Array
                        (
                            [name] => 权限名称
                            [code] => ActionName
                            [type] => VARCHAR(30)
                        )
                )
        )
	)
	*/
	function BasicData($FileName){
		$Contents=$this->OpenFile($FileName);
		#获取其中一个表的数据资料
		$preg="/\* Table: (\w+)([\S\s]*?)\* Index/";
		preg_match_all($preg,$Contents,$matches);
		$output=[];//数据返回容器
		for ($i=0; $i< count($matches[0]); $i++) {
			#获取表名
			$preg="/comment on table ".$matches[1][$i]."\sis\r\n'(.*?)'/";
			$tname=$this->getName($matches[2][$i],$preg);
			#echo $tname.":".$matches[1][$i]."<br/>";
			$tableInfo=array(
				"name"=>$tname,
				"code"=>$matches[1][$i],
			);
			#获取字段值及类型
			$preg="/\s+?(\w+?)\s+?([\w\(,\)\d]+?)\s.*?,/";
			preg_match_all($preg,$matches[2][$i],$matchColumn);
			$column=[];//字段数据容器
			for ($j=0; $j< count($matchColumn[0]); $j++) {
				$preg="/comment on column ".$matches[1][$i].".".$matchColumn[1][$j]."\sis\r\n'(.*?)'/";
				$cname=$this->getName($matches[2][$i],$preg);
				#echo $cname.":".$matchColumn[1][$j]."类型：".$matchColumn[2][$j]."<br/>";
				$tempInfo=array(
					"name"=>$cname,
					"code"=>$matchColumn[1][$j],
					"type"=>$matchColumn[2][$j],
				);
				array_push($column,$tempInfo);
			}
			$tableInfo['column']=$column;
			array_push($output,$tableInfo);
		}
		return $output;
	}

	//获取字段描述
	function getName($Contents,$preg){
		preg_match($preg,$Contents,$match);
		return $match[1];
	}

	//返回驼峰形式的名字
	function HumpName($name){
		$temp=explode('_', $name);
		$html='';
		foreach ($temp as $value) {
			$html=$html.ucfirst($value);
		}
		return $html;
	}

	//返回Symfony用的实体字段格式
	function symfonyFiled($filedName){
		$temp=explode('_', $filedName);
		$html='';
		foreach ($temp as $key => $value) {
			if($key!=0){
				$html=$html.ucfirst($value);
			}else{
				$html=$html.$value;
			}
		}
		return $html;
	}
}
?>

