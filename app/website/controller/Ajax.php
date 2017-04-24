<?php
namespace app\website\controller;
use think\Request;
use think\Controller;
use app\website\model\Web;

class Ajax extends Controller
{
	public function index(){
		if(!input("?post.type")){
			$data['result'] = false;
			$data['msg'] = "未定义type";
			return $data;
		}
		$type = $_POST['type'];
		if($type=="webadd"){
			if(!input("?post.web_name")){
				$data['result'] = false;
				$data['msg'] = "网站名必须添加1";
				return $data;
			}elseif(!input("?post.web_url")){
				$data['result'] = false;
				$data['msg'] = "网站名必须添加2";
				return $data;
			}elseif(!input("?post.web_admin_url")){
				$data['result'] = false;
				$data['msg'] = "网站名必须添加3";
				return $data;
			}elseif(!input("?post.web_account")){
				$data['result'] = false;
				$data['msg'] = "网站名必须添加4";
				return $data;
			}elseif(!input("?post.web_pass")){
				$data['result'] = false;
				$data['msg'] = "网站名必须添加5";
				return $data;
			}else{
				// return "1";
				$Web = new Web($_POST);
				$Web->allowField(true)->save();
				$data['result'] = true;
				$data['msg'] = "添加成功！";
			}
			return $data;
		}elseif($type=="webupdate"){
			if(input("?post.web_id")){
				$Web = new Web();
				$Web->allowField(true)->save($_POST,['web_id'=>$_POST['web_id']]);
				$data['result'] = true;
				$data['msg'] = "更新成功！";
			}else{
				$data['result'] = false;
				$data['msg'] = "更新失败！";
			}
			return $data;
		}else{
			$data['result'] = true;
			$data['msg'] = "更新成功！";
			return $data;
		}
	}
}