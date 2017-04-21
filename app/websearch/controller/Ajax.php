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
	public function keywordsAdd(){
		$keywords = $_POST['keywords'];
		$Keywords = new \app\websearch\library\Keywords();
		if($Keywords->keywordsCkeck($keywords)){
			$result = $Keywords->keywordsAdd($keywords);
			if($result){
				$data['result'] = true;
				$data['msg'] = "添加成功";
			}else{
				$data['result'] = false;
				$data['msg'] = "添加失败";
			}
		}else{
			$data['result'] = false;
			$data['msg'] = "关键词已经存在";
		}			
		return $data;
	}

	public function keywordsDel(){
		$key_id = $_POST['key_id'];
		$Keywords = new \app\websearch\library\Keywords();
		$result = $Keywords->keywordsDel($key_id);
		if($result){
			$data['result'] = true;
			$data['msg'] = "删除成功";
		}else{
			$data['result'] = false;
			$data['msg'] = "删除失败";
		}
		return $data;

	}

	public function urlAdd(){
		$url = $_POST['url'];
		$Url = new \app\websearch\library\Url();
		$result = $Url->urlAdd($url);
		if($result){
			$data['result'] = true;
			$data['msg'] = "添加成功";
		}else{
			$data['result'] = false;
			$data['msg'] = "添加失败";
		}
		return $data;
	}
	public function urlDel(){
		$url_id = $_POST['url_id'];
		$Url = new \app\websearch\library\Url();
		$result = $Url->urlDel($url_id);
		if($result){
			$data['result'] = true;
			$data['msg'] = "删除成功";
		}else{
			$data['result'] = false;
			$data['msg'] = "删除失败";
		}
		return $data;
	}

	public function refreshHtml(){
		$html_key = $_POST['html_key'];
		$html = "";
		if($html_key=="keywords"){
			$Keywords = new \app\websearch\library\Keywords();
			$keywords = $Keywords->keywordsList();
			foreach($keywords as $k1 => $v1){
				$html .='<h3 style="display:inline-block;"><span class="label label-default">'.$v1.' <span style="cursor:pointer;" onclick="keywordsDel('.$k1.')">&times;</span></span></h3>';
			}
			$data['result'] = true;
			$data['html'] = $html;
		}elseif($html_key=="urls") {
			$Url = new \app\websearch\library\Url();
			$urls = $Url->urlList();
			foreach($urls as $k1 => $v1) {
				$html .= '<tr><td>'.$v1['url_id'].'</td><td>'.$v1['url'].'</td><td>'.$v1['note'].'</td><td>'.$v1['status'].'</td><td><span style="cursor:pointer;" onclick="urlDel('.$v1['url_id'].')">&times;</span></td></tr>';
			}
			$data['result'] = true;
			$data['html'] = $html;
		}
		return $data;
	}

}