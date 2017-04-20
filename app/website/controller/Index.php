<?php
namespace app\website\controller;
use think\Controller;
use think\config;

class Index extends Controller
{
    public function index()
    {
    	echo Config::get("template.view_path");
        return $this->fetch("/index");
    }
}
