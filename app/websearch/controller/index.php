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
		// $url = "https://www.1688.com";
		// $array = get_headers($url,1);
		// if(preg_match('/200/',$array[0])){
		// 	echo "<pre/>";
		// 	print_r($array);
		// }else{ 
		// 	echo "无效url资源！";
		// }

		$Url = new \app\websearch\library\Url();
		// $Url->urlDel(1);
		// if($Url->urlCheck("www.baidu.com")===false){
		// 	echo "string";
		// }

		// 页面抓取测试
	$url = 'https://www.1688.com';  
$data = array('name'=>'fdipzone');  
$header = array(); 
$timeout = 5;
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

	}

}