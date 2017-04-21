<?php
// +----------------------------------------------------------------------
// | Url词相关操作函数
// +----------------------------------------------------------------------
// | Author: stormhu E:stormgu@foxmail.com
// +----------------------------------------------------------------------
namespace app\websearch\library;

class Url
{
	// +---------------------------------------------------------------
	// + 添加网址
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function urlAdd($url,$note="未备注"){
		if($this->urlCheck($url)===false){
			$data = ["url"=>$url, "note"=>$note, "status"=>0];
		}else{
			$data = ["url"=>$url, "note"=>$note];
		}
		$result = db("Url")->insert($data);
		if($result){
			return true;
		}else{
			return false;
		}
	}

	// +---------------------------------------------------------------
	// + 删除网址
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function urlDel($url_id){
		$result = db("Url")->where("url_id",$url_id)->delete();
		if($result){
			return true;
		}else{
			return false;
		}
	}

	// 通过网址获取子网址
	// public 

	// +---------------------------------------------------------------
	// + 子网址添加
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function sonurlAdd($url,$url_id){
		if($this->urlCheck($url)===false){
			$data = ["url"=>$url, "url_id"=>$url_id, "status"=>0];
		}else{
			$data = ["url"=>$url, "url_id"=>$url_id];
		}
		$result = db("url")->insert($data);
		if($result){
			return true;
		}else{
			return false;
		}
	}

	// +---------------------------------------------------------------
	// + 子网址删除
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function sonurlDel($sonurl_id){
		$result = db("Sonurl")->where("sonurl_id",$sonurl_id)->delete();
		if($result){
			return true;
		}else{
			return false;
		}
	}

}