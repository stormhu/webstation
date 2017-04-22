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

		$Web = new \stormgu\Web();
		$Url = new \app\websearch\library\Url();
		$Keywords = new \app\websearch\library\Keywords();
		$Ajax = new \app\websearch\controller\Ajax();

		$urls = $Url->urlList();
		$sonurls = $Url->sonurlList();
		$keywords = $Keywords->keywordsList();

		$this->assign("urls",$urls);
		$this->assign("keywords",$keywords);
		$this->assign("sonurls", $sonurls);
		echo db("Url")->where("parent_id","neq",0)->count();

		// $temp =  $Web->webGet("https://shop1416933982155.1688.com/page/creditdetail_remark.htm");
		// print_r($Web->webUrlCollection($temp,1,"https://shop1416933982155.1688.com/"));

		// $res = $Url->urlCollection("https://shop1416933982155.1688.com/");
		// if($res)
		// 	echo "1";
		// else
		// 	echo "0";
		return $this->fetch("/index");

		
	}

}