<?php
namespace app\website\Library;
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
			if(!input("?post.web_name") || $_POST['web_name']==""){
				$data['result'] = false;
				$data['msg'] = "网站名不能为空";
			}elseif(!input("?post.web_url") || $_POST['web_url']==""){
				$data['result'] = false;
				$data['msg'] = "网站URL不能为空";
			}elseif(!input("?post.web_admin_url") || $_POST['web_admin_url']==""){
				$data['result'] = false;
				$data['msg'] = "网站后台URL不能为空";
			}elseif(!input("?post.web_account") || $_POST['web_account']==""){
				$data['result'] = false;
				$data['msg'] = "网站后台账户不能为空";
			}elseif(!input("?post.web_pass") || $_POST['web_pass']==""){
				$data['result'] = false;
				$data['msg'] = "网站后台账户密码不能为空";
			}else{
				// return "1";
				$Web = new Web($_POST);
				$Web->allowField(true)->save();
				$data['result'] = true;
				$data['msg'] = "添加成功！";
			}
			return $data;
		}elseif($type=="webupdate"){
			if(input("?post.web_id") && $_POST['web_id']!=0){
				$Web = new Web();
				$Web->allowField(true)->save($_POST,['web_id'=>$_POST['web_id']]);
				$data['result'] = true;
				$data['msg'] = "更新成功！";
			}else{
				$data['result'] = false;
				$data['msg'] = "更新失败！";
			}
			return $data;
		}elseif($type=="getform"){
			$web = db("web")->where("web_id",$_POST['web_id'])->find();
			// unset($web['web_id']);
			$webname = [
				"web_id"			=>"网站id",
				"web_name"			=>"网站名",
				"web_url"			=>"URl",
				"web_admin_url"		=>"后台URL",
				"web_account"		=>"后台账户",
				"web_pass"			=>"后台密码",
				"web_icp"			=>"ICP备案号",
				"web_icp_account"	=>"ICP账户",
				"web_icp_pass"		=>"ICP密码",
				"web_icp_email"		=>"ICP邮箱",
				"web_status"		=>"网站状态",
				"domain_buildtime"	=>"域名购买时间",
				"domain_endtime"	=>"域名到期时间",
				"ftp_url"			=>"ftp链接",
				"ftp_account"		=>"ftp账号",
				"ftp_pass"			=>"ftp密码",
				"owner_name"		=>"姓名",
				"owner_phone"		=>"手机",
				"owner_qq"			=>"QQ",
			];
			if($web!=null){
				$html = "";
				foreach($web as $k1 => $v1) {
					$html .= '<div class="form-group"><label for="'.str_replace("_", "-", $k1).'" class="col-md-3 control-label">'.$webname[$k1].'</label><div class="col-md-8"><input type="text" class="form-control" id="'.str_replace("_", "-", $k1).'" name="'.str_replace("_", "-", $k1).'" value="'.$v1.'" /></div></div>';
				}
				$data['html'] = $html;
				$data['result'] = true;
			}else{
				$data['result'] = false;
				$data['msg'] = "数据库未查找到该信息";
			}
			return $data;
		}else{
			$data['result'] = true;
			$data['msg'] = "更新成功！";
			return $data;
		}
	}

	public function login(){
		if(!isset($_POST['type'])){
			$data['result'] = false;
			$data['msg'] = "未定义type";
			return $data;
		}
		// 用户名检测
		// 验证码检测
		if($_POST['type']=="login"){

		}elseif($_POST['type']=="captcha"){
			
		}
	}
}