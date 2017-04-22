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
			return false;
			// $data = ["url"=>$url, "note"=>$note, "status"=>0];
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
		if($result!=0){
			return true;
		}else{
			return false;
		}
	}

	// +---------------------------------------------------------------
	// + 获取网址列表
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function urlList($page=1,$limit=10){
		$result = db("Url")->page($page)->limit($limit)->where("parent_id",'0')->select();
		return $result;
	}

	public function sonurlList($page=1,$limit=10){
		// if($parent_id==""){
		// 	$result = db("Url")->where("parent_id", 'neq' ,'0')->select();
		// }else{
		// 	$result = db("Url")->where("parent_id",$parent_id)->select();
		// }
		$result = db("Url")->page($page)->limit($limit)->where("parent_id", 'neq' ,0)->select();
		return $result;
	}

	// +---------------------------------------------------------------
	// + 检测网址
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function urlCheck($url){
		if(strpos($url, "http")===false){
			return false;
		}else{
			if(db("Url")->where("url",$url)->find()==null){
				return true;
			}else{
				return false;
			}
		}
	}



	// +---------------------------------------------------------------
	// + 采集子网址
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function urlCollection($url){
		$url_id = db("Url")->where("url",$url)->value("url_id");
		$parent_id = db("Url")->where("url_id",$url_id)->value("parent_id");
		$Web = new \stormgu\Web();
		$web_html = $Web->webGet($url);
		if($parent_id){
			$url = db("Url")->where("url_id",$parent_id)->value("url");
		}
		$sonurls = $Web->webUrlCollection($web_html,1,$url);
		if($sonurls===false||count($sonurls)==0){
			return false;
		}
		$sonurls = $this->urlListCheck($sonurls);
		foreach($sonurls as $k1 => $v1){
			if(db("Url")->where("url",$v1['url'])->find()==null){
				$data = ['parent_id'=>$url_id, 'url'=>$v1['url'], 'status'=>$v1['status']];
				db("Url")->insert($data);
			}
		}
		db("Url")->where("url_id",$url_id)->setField("collection",1);
		return true;
	}

	// +---------------------------------------------------------------
	// + 批量网址状态检测
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function urlListCheck($url_list){
		$Web = new \stormgu\Web();
		$url_list = array_unique($url_list);
		foreach($url_list as $k1 => $v1) {
			$res = $Web->webCheck($v1);
			$new_url_list[$k1]['url'] = $v1;
			$new_url_list[$k1]['status'] = $res===true?1:0;
		}
		return $new_url_list;
	}

	// +---------------------------------------------------------------
	// + 子网址添加
	// +---------------------------------------------------------------
	// + Author: stormhu <stormhu@foxmail.com> 
	// +---------------------------------------------------------------
	public function sonurlAdd($url,$url_id,$status=1){
		if($this->urlCheck($url)===false){
			return false;
		}else{
			$data = ["url"=>$url, "url_id"=>$url_id, "status",$status];
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