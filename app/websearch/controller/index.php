<?php
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: stormhu <stormgu@foxmail.com>
// +----------------------------------------------------------------------
namespace app\websearch\controller;
use think\Controller;

class Index extends Controller
{
	public function index(){

		// $Web = new \stormgu\Web();
		$Keywords = new \app\websearch\library\Keywords();
		$keywords = $Keywords->keywordsGet(2);
		$this->assign("keywords",$keywords);

		return $this->fetch("/index");

	}

}