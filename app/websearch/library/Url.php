<?php
// +----------------------------------------------------------------------
// | Url词相关操作函数
// +----------------------------------------------------------------------
// | Author: stormhu E:stormgu@foxmail.com
// +----------------------------------------------------------------------
namespace app\websearch\library;

class Url
{
	// 添加网址
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

	// 删除网址
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

	// 子网址添加
	public function sonurlAdd($sonurl,$url_id){
		if($this->urlCheck($sonurl)===false){
			$data = ["sonurl"=>$sonurl, "url_id"=>$url_id, "status"=>0];
		}else{
			$data = ["sonurl"=>$sonurl, "url_id"=>$url_id];
		}
		$result = db("Sonurl")->insert($data);
		if($result){
			return true;
		}else{
			return false;
		}
	}

	// 子网址删除
	public function sonurlDel($sonurl_id){
		$result = db("Sonurl")->where("sonurl_id",$sonurl_id)->delete();
		if($result){
			return true;
		}else{
			return false;
		}
	}

	// +-------------------------------------------------------
	// + 网址访问检测（公共函数，父、子域名都可以使用）
	// +-------------------------------------------------------
	// + -1 = url格式错误;
	// +-------------------------------------------------------
	public function urlCheck($url){
		if(strpos($url, "http")===false){
			return -1;
		}
		$array = get_headers($url,1);
		if(preg_match('/200/',$array[0])){
			return true;
		}else{ 
			return false;
		} 
	}

	// 页面获取
	public function webGet($url,$data=array(),$header=array(),$timeout=30){
		$ch = curl_init();
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查  
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	    curl_setopt($ch, CURLOPT_POST, true);
	    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
	    curl_setopt($ch, CURLOPT_ENCODING ,'gzip');

	    $response = curl_exec($ch);
	  
	    if($error=curl_error($ch)){
	        die($error);
	    }
	    curl_close($ch);
	    $response = mb_convert_encoding($response, 'utf-8', 'GBK,UTF-8,ASCII');
	    return $response;
	}
}