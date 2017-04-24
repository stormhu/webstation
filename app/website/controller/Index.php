<?php
namespace app\website\controller;
use think\Controller;
// use think\Request;
use app\website\model\User;
use app\website\model\Web;


class Index extends Controller
{
    public function index()
    {
		$Web = new Web();
		$webs = Db("Web")->page("1,10")->select();
		$this->assign("webs",$webs);

		$Ajax = new Ajax();
		print_R($Ajax->index());
        return $this->fetch("/index");
    }
}
