<?php
// +----------------------------------------------------------------------
// | 首页控制器
// +----------------------------------------------------------------------
// | @Author: stormhu E:stormgu@foxmail.com
// +----------------------------------------------------------------------
namespace app\website\controller;
use app\website\library\Common;
use app\website\model\User;
use app\website\model\Web;
use app\website\library\Login;


class Index extends Common
{
    public function index()
    {
		$Web = new Web();
		$webs = Db("Web")->page("1,10")->select();
		// print_r(Web::get("web_id","3"));
		$this->assign("webs",$webs);

		$login = new Login();
		// echo $_SESSION['name'];
		// print_r($_SESSION);
		// $login->login("test","666666");

		// $Ajax = new Ajax();
		// print_R($Ajax->index());

        return $this->fetch("/index");


        echo "string";
    }

}
