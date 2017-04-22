<?php
namespace app\website\controller;
use think\Controller;
use app\website\model\User;

class Index extends Controller
{
    public function index()
    {
		$User = new User();
		$user =  User::get(1);
		echo $user->name;

        // return $this->fetch("/index");
    }
}
