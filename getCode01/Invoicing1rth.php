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
	private $twigindex 	= 'twig.index.html';
	private $twignew	= 'twig.new.html';
	
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
                    $tcode=strtolower($content[$i]['code']);
                    $tname=$content[$i]["name"];
                    // echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";

                    pq("h5")->empty()->append($tname.'创建');
                    $rightTitle="<a href=@@path('".$tcode."',@'companyid':companyid,'userid':userid#)##>".$tname."列表</a>";
                    pq(".createNode")->empty()->append($rightTitle);

                    pq(".form-horizontal")->attr("action","@@path('".$tcode."_create',@'companyid':companyid,'userid':userid#)##");
                    pq(".form-horizontal")->empty();#清空缓存

                    for($j=0;$j<count($content[$i]['column']);$j++){
                        $colcode=strtolower($content[$i]['column'][$j]['code']);
                        $colname=$content[$i]['column'][$j]['name'];

                        // echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
                        $formFiled='
 							<div class="control-group">
 								<label class="control-label">'.$colname.'</label>
 								<div class="controls">
 									<input type="text" name="'.$colcode.'">
 								</div>
 							</div>
 					';
                        pq(".form-horizontal")->append($formFiled);
                    }

                    $createBtn='
 				<div class="form-actions">
 					<button type="submit" class="btn btn-primary">创 建</button>
 				</div>';

                    pq(".form-horizontal")->append($createBtn);
                    echo $html."\n-----------------------------------------------------\n";
                }
                phpQuery::$documents = array();
                break;
            case 'edit':
                $html=phpQuery::newDocumentFile($this->twignew);
                for ($i=0; $i< count($content); $i++){
                    $tcode=strtolower($content[$i]['code']);
                    $tname=$content[$i]["name"];
                    // echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";

                    pq("h5")->empty()->append($tname.'编辑');
                    $rightTitle="<a href=@@path('".$tcode."',@'companyid':companyid,'userid':userid#)##>".$tname."列表</a>";
                    pq(".createNode")->empty()->append($rightTitle);

                    pq(".form-horizontal")->attr("action","@@path('".$tcode."_update',@'companyid':companyid,'userid':userid,'id':entity.id#)##");
                    pq(".form-horizontal")->empty();#清空缓存

                    for($j=0;$j<count($content[$i]['column']);$j++){
                        $colcode=strtolower($content[$i]['column'][$j]['code']);
                        $colname=$content[$i]['column'][$j]['name'];
                        // echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";
                        $formFiled="
 							<div class='control-group'>
 								<label class='control-label'>".$colname."</label>
 								<div class='controls'>
 									<input type='text' name='".$colcode."' value='{{entity.".$colcode."}}'>
 								</div>
 							</div>
 					";
                        pq(".form-horizontal")->append($formFiled);
                    }

                    $createBtn='
 				<div class="form-actions">
 					<button type="submit" class="btn btn-primary">修 改</button>
 				</div>';

                    pq(".form-horizontal")->append($createBtn);
                    echo $html."\n-----------------------------------------------------\n";
                }
                phpQuery::$documents = array();
                break;
            case 'show':
                $html=phpQuery::newDocumentFile($this->twignew);
                for ($i=0; $i< count($content); $i++){
                    $tcode=strtolower($content[$i]['code']);
                    $tname=$content[$i]["name"];
                    // echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";

                    pq("h5")->empty()->append($tname.'显示');
                    $rightTitle="<a href=@@path('".$tcode."',@'companyid':companyid,'userid':userid#)##>".$tname."列表</a>";
                    pq(".createNode")->empty()->append($rightTitle);

                    pq(".widget-content")->empty();#清空缓存
                    for($j=0;$j<count($content[$i]['column']);$j++){
                        $colcode=strtolower($content[$i]['column'][$j]['code']);
                        $colname=$content[$i]['column'][$j]['name'];
                        // echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";

                        $formFiled="
 							<div class='control-group'>
 								<label class='control-label'>".$colname."</label>
 								<div class='controls'>
 									{{entity.".$colcode."}}
 								</div>
 							</div>
 					";
                        pq(".widget-content")->append($formFiled);

                    }
                    echo $html."\n-----------------------------------------------------\n";
                }
                phpQuery::$documents = array();
                break;
            default:
                $html=phpQuery::newDocumentFile($this->twigindex);

                for ($i=0; $i< count($content); $i++){
                    $tcode=strtolower($content[$i]['code']);
                    $tname=$content[$i]["name"];
                    // echo "\nTable Code：".$tcode."\nTable Name：".$tname."\n----------\n";

                    pq("h5")->empty()->append($tname);
                    $rightTitle="<a href=@@path('".$tcode."_new',@'companyid':companyid,'userid':userid#)##>".$tname."创建</a>";
                    pq(".createNode")->empty()->append($rightTitle);

                    $thead='<th><input type="checkbox" name="AllCheck"></th>';
                    $tbody='<td><input type="checkbox" name=""></td>';

                    for($j=0;$j<count($content[$i]['column']);$j++){
                        $colcode=strtolower($content[$i]['column'][$j]['code']);
                        $colname=$content[$i]['column'][$j]['name'];
                        // echo "Column Name:".$colname."\nColumn Code:".$colcode."\n";

                        $thead=$thead."<th>".$colname."</th>";
                        $tbody=$tbody."<td>{{entity.".$colcode."}}</td>";
                        pq("table thead tr:first")->empty()->append($thead);
                        pq("table tbody tr:first")->empty()->append($tbody);
                    }
                    pq("table thead tr:last")->append('<th>操作</th>');
                    $operator="
 					<td><ul class='listedit'>
 					<li><a href=@@path('".$tcode."_edit',@'companyid':companyid,'userid':userid,'id':entity.id#)##>编辑</a></li>
 					<li><a href=@@path('".$tcode."_delete',@'companyid':companyid,'userid':userid,'id':entity.id#)##>删除</a></li>
 					</ul></td>
 				";
                    pq("table tbody tr:last")->append($operator);
                    echo $html."\n-----------------------------------------------------\n";
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
}
/*
public function newAction()
{
	$entity=new Actionpowers();
	$form=$this->createForm(new ActionpowersType(),$entity);

	return $this->render('RaysWebBundle:Actionpowers:new.html.twig',array(
		'entity'=>$entity,
		'form'=>$form->createView(),
		));
}
public function createAction(Request $request)
{
	$entity=new Actionpowers();
	$form=$this->createForm(new ActionpowersType(),$entity);
	$form->bind($request);

	if($form->isValid()){
		$em=$this->getDoctrine()->getManager();
		$em->persist($entity);
		$em->flush();

		return $this->redirect($this->generateUrl('actionpowrs_show',array(
			'id'=>$entity->getId()
			)));
	}
	return $this->render('RaysWebBundle:Actionpowers:new.html.twig',array(
		'entity'=>$entity,
		'form'=>$form->createView(),
		));
}

public function editAction($id)
{
	$em=$this->getDoctrine()->getManager();
	$entity=$em->getRepository('RaysWebBundle:Actionpowers')->find($id);

	if(!$entity){
		$this->Errproc('无法定位实体');
	}
	$editform=$this->createForm(new ActionpowersType(),$entity);

	return $this->render('RaysWebBundle:Actionpowers:edit.html.twig',array(
		'entity'=>$entity,
		'editform'=>$editform->createView(),
		));
}

public function updateAction(Request $request,$id)
{
	$em=$this->getDoctrine()->getManager();
	$entity=$em->getRepository('RaysWebBundle:Actionpowers')->find($id);

	if(!$entity){
		$this->Errproc('无法定位实体');
	}
	$editform=$this->createForm(new ActionpowersType(),$entity);
	$editform->bind($request);
	if($editform->isValid()){
		$em->persist($entity);
		$em->flush();
		return $this->redirect($this->generateUrl('actionpowers_edit',array(
			'id'=>$id
			)));
	}
	return $this->render('RaysWebBundle:Actionpowers:edit.html.twig',array(
		'entity'=>$entity,
		'editform'=>$editform->createView(),
		));
}*/
?>