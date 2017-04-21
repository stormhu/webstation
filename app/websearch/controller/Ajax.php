<?php
// +----------------------------------------------------------------------
// | 前端回应接口
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: stormhu <stormgu@foxmail.com>
// +----------------------------------------------------------------------
namespace app\websearch\controller;
use think\Controller;

class Ajax extends Controller
{
	public function keywordsInstert(){
		$keywords = $_POST['keywords'];
		$Keywords = new \app\websearch\library\Keywords();
		$res = $Keywords->keywordsInstert(2,"你好");
		if($res){
			$data['result'] = true;
			$data['msg'] = "添加成功";
		}else{
			$data['result'] = false;
			$data['msg'] = "添加失败";
		}
		return $data;
	}
}