<?php
namespace stormgu;
class Web
{
	// +---------------------------------------------------------------
	// + 网址访问检测（公共函数，父、子域名都可以使用）
	// +---------------------------------------------------------------
	// + 参数
	// + $url: 目标网址
	// +---------------------------------------------------------------
	// + 返回值
	// + 成功返回true,失败返回false
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function webStatus($url){
		if(strpos($url, "http")===false){
			return -1;
		}
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
	    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);  // 从证书中检查SSL加密算法是否存在
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_NOBODY, 1); // 不下载
		curl_setopt($ch, CURLOPT_FAILONERROR, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_USERAGENT,"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)");
		return (curl_exec($ch)!==false) ? true : false;
	}
	// +---------------------------------------------------------------
	// + 批量网址状态检测
	// +---------------------------------------------------------------
	// + 参数
	// + $url_list: 目标网址列表（数组格式）
	// +---------------------------------------------------------------
	// + 返回值
	// + 返回检测后的新数组
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function webListStatus($url_list){
		foreach($url_list as $k1 => $v1) {
			$res = $this->webCheck($v1);
			$new_url_list[$k1]['url'] = $v1;
			$new_url_list[$k1]['status'] = $res===true?1:0;
		}
		return $new_url_list;
	}


	// +---------------------------------------------------------------
	// + curl模仿浏览器页面内容获取，支持https协议
	// +---------------------------------------------------------------
	// + 参数
	// + $url: 目标网址，必须带有http://或https://前缀
	// + $data: 抓取时要发送的post参数，数组形式
	// + $header: 头文件信息
	// + $timeout: 超时时间
	// +---------------------------------------------------------------
	// + 返回值
	// + 成功返回抓取到的页面内容，失败返回false
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function webGet($url,$data=array(),$header=array(),$timeout=30){
		$ch = curl_init();
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查  
	    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);  // 从证书中检查SSL加密算法是否存在
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	    curl_setopt($ch, CURLOPT_POST, true);
	    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
	    curl_setopt($ch, CURLOPT_FOLLOWLOCATION,1);
	    curl_setopt($ch, CURLOPT_ENCODING ,'gzip');
	    curl_setopt($ch,CURLOPT_USERAGENT,"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)");

	    $response = curl_exec($ch);
	    if($error=curl_error($ch)){
	    	if(DEBUG)
	    		die($error);
	        return false;
	    }
	    curl_close($ch);
	    $response = mb_convert_encoding($response, 'utf-8', 'GBK,UTF-8,ASCII');
	    return $response;
	}

	// +---------------------------------------------------------------
	// + 页内url采集
	// +---------------------------------------------------------------
	// + 参数
	// + $web_page: 目标页面文件流，与本类中webGet()配合
	// + $type: 采集页内网址的模式--0采集页内所有url--1采集$url域下的url
	// + $url: 与$type参数配合，url采集范围
	// +---------------------------------------------------------------
	// + 返回值
	// + 成功返回匹配数组，失败返回false
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function webUrlCollection($web_page, $type=0, $url=""){
		if($type==0){
			$res = preg_match_all("/<a href=\s*\"(.*?)\"/i", $web_page, $matches);
			if($res===false){
				return false;
			}
			return $matches[1];
		}elseif($type==1){
			if($url=="")
				return false;
			$res = preg_match_all("/<a href=\s*\"(.*?)\"/i", $web_page, $matches);
			foreach($matches[1] as $k1 => $v1) {
				$res = strpos($v1, $url);
				if($res===false){
					unset($matches[1][$k1]);
				}
			}
			$matches[1] = array_values($matches[1]);
			return $matches[1];
		}else{
			return false;
		}
	}

}