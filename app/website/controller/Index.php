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
		// $User = new User();
		// $user =  User::get(1);
		// echo $user->name;

		// $Web = new Web();
		// if(input("?post.name"))
		// 	echo "1";
		// else
		// 	echo "0";
    	$Ajax = new Ajax;
    	print_r($Ajax->index());

        return $this->fetch("/index");
    }
}
