<?php
// +----------------------------------------------------------------------
// | 公共类
// +----------------------------------------------------------------------
// | Author: stormhu E:stormgu@foxmail.com
// +----------------------------------------------------------------------
namespace app\website\library;
use think\Controller;
use think\Session;

class Common extends Controller
{
	/**
	 **	@name common构造函数
	 ** @Author stormhu <stormhu@foxmail.com>
	 ** @verision 构造函数通过SESSION检测登录状态
	 **/
	function __construct(){
		parent::__construct();
		// 登录检测
		$name = Session::get("name");
		$sign = Session::get("sign");
		$temp_sign = md5(db("user")->where("name",$name)->value("pass"));
		if(!($sign===$temp_sign)){
			// $this->success("ok","");
			// echo "请登录";
		}else{
			// echo "已登录";
		}
	}
}