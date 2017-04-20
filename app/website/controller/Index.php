<?php
namespace app\webstation\controller;
use think\Controller;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch(APP_PATH."/webstation/tpl/default/test.tpl");
    }
}
