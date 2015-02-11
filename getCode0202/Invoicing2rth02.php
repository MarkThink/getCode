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

	private $bundle 	= 'RaysWebBundle';
	private $page 		= 200;
	private $twigdir	= 'account';

	private $tmpdir		= './temp';

    private $routerPrefix = 'web_';//路由前缀
	
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
			case 'import':
				$output='';
                for ($i=0; $i< count($content); $i++){
                    $ename=$this->getEntityName($content[$i]['code']);
                    $tname=$content[$i]["name"];
					$output.='use Rays/WebBundle/Entity/'.$ename.';//'.$tname."\n";
				}
				echo $output;
				break;
            case 'router':
                $output='';
                for ($i=0; $i< count($content); $i++){
                    $humpcode=$this->HumpName($content[$i]['code']);
                    $tcode=strtolower($humpcode);
                    $tname=$content[$i]["name"];
                    $output.='#'.$tname.'
'.$tcode.':
    pattern:  /'.$tcode.'
    defaults: { _controller: '.$this->bundle.':Basic:'.$tcode.'}

'.$tcode.'_grid:
    pattern:  /'.$tcode.'_grid
    defaults: { _controller: '.$this->bundle.':Basic:'.$tcode.'_grid }

'.$tcode.'_new:
    pattern:  /'.$tcode.'_new
    defaults: { _controller: '.$this->bundle.':Basic:'.$tcode.'_new }

'.$tcode.'_create:
    pattern:  /'.$tcode.'_create
    defaults: { _controller: '.$this->bundle.':Basic:'.$tcode.'_create }

'.$tcode.'_edit:
    pattern:  /{id}/'.$tcode.'_edit
    defaults: { _controller: '.$this->bundle.':Basic:'.$tcode.'_edit }

'.$tcode.'_update:
    pattern:  /{id}/'.$tcode.'_update
    defaults: { _controller: '.$this->bundle.':Basic:'.$tcode.'_update }

'.$tcode.'_del:
    pattern:  /{id}/'.$tcode.'_del
    defaults: { _controller: '.$this->bundle.':Basic:'.$tcode.'_del }

'.$tcode.'_show:
    pattern:  /{id}/'.$tcode.'_show
    defaults: { _controller: '.$this->bundle.':Basic:'.$tcode.'_show }
'."\n";
                }
                echo $output;
                break;
            case 'all':
                for ($i=0; $i< count($content); $i++){
                    $ename=$this->getEntityName($content[$i]['code']);
                    $tcode=strtolower($ename);
                    $tname=$content[$i]["name"];
                    $datatable="";$request="";$entity="";$update="";$dql='update '.$this->bundle.':'.$ename.' t set ';
                    for($j=0;$j<count($content[$i]['column']);$j++){
                        $fcolcode=$this->HumpName($content[$i]['column'][$j]['code']);
                        $sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
                        $colcode=strtolower($sfcode);
                        $colname=$content[$i]['column'][$j]['name'];
                        if($colcode!='id'){
                            $datatable.='"'.$colname.'"=>"x.'.$sfcode.'",'."\n\t\t";
                            $request.='$'.$colcode.'=$request->request->get("'.$colcode.'");'."\n    ";
                            $entity.='$entity->set'.$fcolcode.'($'.$colcode.');'."\n    ";
                            $update.='"'.$colcode.'"=>$'.$colcode.','."\n    ";
                            if($j!=count($content[$i]['column'])-1){
                                $dql.="\n\t".'t.'.$sfcode.'=\'".$updateArr["'.$colcode.'"]."\',';
                            }else{
                                $dql.="\n\t".'t.'.$sfcode.'=\'".$updateArr["'.$colcode.'"]."\'';
                            }
                        }
                    }
                    $dql.=" \n\t where t.id=:id";
                    $datatable.='"_identifier_"=>"x.id"';
                    $output='
<?php
//'.$tname.'初始化数据表
private function '.$tcode.'Datatable(){
    $datatable = $this->get("datatable");
    return $datatable->setEntity("'.$this->bundle.':'.$ename.'","x")
        ->setFields(array(
        '.$datatable.'
        ))
        ->setHasAction(true);
}
//'.$tname.'获取数据内容
public function '.$tcode.'_gridAction(){
    return $this->'.$tcode.'Datatable()->execute();
}
//'.$tname.'内容显示列表
public function '.$tcode.'Action($cid, $uid) {
    $this->'.$tcode.'Datatable();
    return $this->render("'.$this->bundle.':basic:'.$tcode.'.html.twig", array(
        "cid" => $cid,
        "uid" => $uid,
    ));
}
//'.$tname.'内容创建视图
public function '.$tcode.'_newAction($cid, $uid) {
    return $this->render("'.$this->bundle.':basic:'.$tcode.'.new.html.twig", array(
                "cid" => $cid,
                "uid" => $uid,
    ));
}
//'.$tname.'内容创建代码
public function '.$tcode.'_createAction($cid, $uid, Request $request) {
    '.$request.'
    $entity = new '.$ename.'();
    '.$entity.'
    $em = $this->getDoctrine()->getManager();
    $em->persist($entity);
    $em->flush();

    return $this->redirect($this->generateUrl("'.$tcode.'_show", array(
                        "cid" => $cid,
                        "uid" => $uid,
                        "id" => $entity->getId(),
    )));
}
//'.$tname.'内容编辑视图
public function '.$tcode.'_editAction($cid, $uid, $id) {
    $em = $this->getDoctrine()->getManager();
    $entity = $em->getRepository("'.$this->bundle.':'.$ename.'")->find($id);
    if (!$entity) {
        return $this->Errproc("'.$tname.'数据获取失败");
    }
    return $this->render("'.$this->bundle.':basic:'.$tcode.'.edit.html.twig", array(
                "entity" => $entity,
                "cid" => $cid,
                "uid" => $uid,
    ));
}
//'.$tname.'内容编辑更新代码
public function '.$tcode.'_updateAction($cid, $uid, $id, Request $request) {
    '.$request.'
    $updateArr = array(
    '.$update.'
    );

    $em = $this->getDoctrine()->getManager();
    $em->getRepository("RaysTopBundle:'.$ename.'")
            ->updateEditInfo($updateArr, $id);

    return $this->redirect($this->generateUrl("'.$tcode.'", array(
                        "cid" => $cid,
                        "uid" => $uid,
    )));
}
//'.$tname.'实体库编辑更新代码
public function updateEditInfo($updateArr,$id)
{
    $entity = $this->getEntityManager()
            ->getRepository("'.$this->bundle.':'.$ename.'")->find($id);
    if (!$entity) {
        return $this->Errproc("此'.$tname.'不存在，请核实..");
    }
    $this->getEntityManager()
            ->createQuery("'.$dql.'")
            ->setParameter("id",$id)
            ->execute();
}
//'.$tname.'内容显示视图
public function '.$tcode.'_showAction($cid, $uid, $id) {
    $em = $this->getDoctrine()->getManager();
    $entity = $em->getRepository("'.$this->bundle.':'.$ename.'")->find($id);
    if (!$entity) {
        return $this->Errproc("此'.$tname.'不存在，请核实..");
    }

    return $this->render("'.$this->bundle.':basic:'.$tcode.'.show.html.twig", array(
                "entity" => $entity,
                "cid" => $cid,
                "uid" => $uid,
    ));
}
//'.$tname.'内容删除代码
public function '.$tcode.'_delAction($cid, $uid, $id) {
    $em = $this->getDoctrine()->getManager();
    $entity = $em->getRepository("'.$this->bundle.':'.$ename.'")->find($id);
    if (!$entity) {
        return $this->Errproc("此'.$tname.'不存在，请核实..");
    }
    $em->remove($entity);
    $em->flush();
    return $this->redirect($this->generateUrl("'.$tcode.'", array(
                        "cid" => $cid,
                        "uid" => $uid,
    )));
}
';
                    $this->WriteFile($ename.'Controller.php',$output);
                    //echo $output;
                }
                break;
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
					href=@@path('".$routerPrefix.$tcode."',@'cid':cid,'uid':uid#)##".">
					<i class='icon-list icon-white'></i>
					".$tname."列表
					</a></b>";

					pq(".pheader")->empty()->append($navlist);
					pq(".form-horizontal")->attr("action","@@path('".$routerPrefix.$tcode."_create',@'cid':cid,'uid':uid#)##");
					$formFiled='<div class="pcontent" style="margin-top: 10px;border: 2px solid #E5E4E3;"><ul class="foxlist">';
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						$colcode=strtolower($sfcode);
						$colname=$content[$i]['column'][$j]['name'];

						//echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						$formFiled=$formFiled.'
								<li>
								<div class="control-group">
									<label class="control-label">'.$colname.'</label>
									<div class="controls">
										<input type="text" name="'.$colcode.'">
									</div>
								</div>
								</li>
						';
					}
					$createBtn='			
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">创 建</button>
					</div></ul></div>';

					pq(".form-horizontal")->append($formFiled.$createBtn);
                    $patterns[0]="/title %\}(.*?)\{%/";
                    $replacements[0]="title %}".$tname."创建{%";
                    $output=preg_replace($patterns, $replacements, $html);
					$this->WriteFile($tcode.'.new.html.twig',$output);
					//echo $output."\n-----------------------------------------------------\n";
					pq(".form-horizontal")->empty();#清空缓存
                    //die();
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
					<i class='icon-list icon-white'></i>
					".$tname."列表
					</a></b>";

					pq(".pheader")->empty()->append($navlist);
					pq(".form-horizontal")->attr("action","@@path('".$tcode."_update',@'cid':cid,'uid':uid,'id':entity.id#)##");

					$formFiled='<div class="pcontent" style="margin-top: 10px;border: 2px solid #E5E4E3;"><ul class="foxlist">';
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						$colcode=strtolower($sfcode);
						$colname=$content[$i]['column'][$j]['name'];
						// echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						$formFiled=$formFiled.'
						       <li>
								<div class="control-group">
									<label class="control-label">'.$colname.'</label>
									<div class="controls">
										<input type="text" name="'.$colcode.'" value="{{entity.'.$sfcode.'}}">
									</div>
								</div>
								</li>
						';
					}

					$createBtn='			
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">修 改</button>
					</div></ul></div>';

					pq(".form-horizontal")->append($formFiled.$createBtn);
                    $patterns[0]="/title %\}(.*?)\{%/";
                    $replacements[0]="title %}".$tname."更新{%";
                    $output=preg_replace($patterns, $replacements, $html);
					$this->WriteFile($tcode.'.edit.html.twig',$output);
					//echo $output."\n-----------------------------------------------------\n";
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
					<i class='icon-list icon-white'></i>".$tname."列表</a></b><b><a class='btn btn-warning'
					href=@@path('".$tcode."_new',@'cid':cid,'uid':uid#)##"."> <i class='icon-plus icon-white'></i>继续创建</a></b>";

					pq(".pheader")->empty()->append($navlist);
					pq(".form-horizontal")->remove();//删除表单元素

					$formFiled='<div class="pcontent" style="margin-top: 10px;border: 2px solid #E5E4E3;">';
					for($j=0;$j<count($content[$i]['column']);$j++){
						$sfcode=$this->symfonyFiled($content[$i]['column'][$j]['code']);
						//$colcode=strtolower($sfcode);
						$colname=$content[$i]['column'][$j]['name'];

						//echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
						$formFiled=$formFiled."
                            <dl class='dl-horizontal'>
                            <dt>".$colname."</dt>
                            <dd>{{entity.".$sfcode."}}</dd>
                            </dl>
						";
					}
					pq(".span12:eq(1)")->append($formFiled."</div>");
                    $patterns[0]="/title %\}(.*?)\{%/";
                    $replacements[0]="title %}".$tname."显示{%";
                    $output=preg_replace($patterns, $replacements, $html);
					$this->WriteFile($tcode.'.show.html.twig',$output);
					//echo $output."\n-----------------------------------------------------\n";
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

                    $patterns[0]="/title %\}(.*?)\{%/";
                    $patterns[1]="/'edit_route' : 'company_edit'/";
                    $patterns[2]="/'delete_route' : 'company_del'/";
                    $patterns[3]="/'sAjaxSource' : path\('company_grid'/";

                    $replacements[0]="title %}".$tname."管理{%";
                    $replacements[1]="'edit_route' : '".$tcode."_edit'";
                    $replacements[2]="'delete_route' : '".$tcode."_del'";
                    $replacements[3]="'sAjaxSource' : path('".$tcode."_grid'";

                    $output=preg_replace($patterns, $replacements, $html);
					$this->WriteFile($tcode.'.html.twig',$output);
					//echo $output."\n-----------------------------------------------------\n";
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
    //返回Symfony实体名
    function getEntityName($name){
        $temp=explode('_', $name);
        $html='';
        foreach ($temp as $value) {
            $html.=$value;
        }
        return ucfirst($html);
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

