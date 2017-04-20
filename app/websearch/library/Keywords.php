<?php
// +----------------------------------------------------------------------
// | 关键词相关操作函数
// +----------------------------------------------------------------------
// | Author: stormhu E:stormgu@foxmail.com
// +----------------------------------------------------------------------
namespace app\websearch\library;

class Keywords
{
	// 插入关键词
	public function keywordsInsert($key_id,$keywords){
		// 获取原数据库词
		$old_keyword = $this->keywordsGet($key_id,"string");
		$new_keyword = $old_keyword." ".$keywords;
		// $new_keyword = implode(" ", $new_keyword);
		$result = db("Keywords")->where("key_id",$key_id)->setField("keywords",$new_keyword);
		if($result){
			return true;
		}else{
			return false;
		}
	}

	// 添加关键词组
	public function keywordsAdd($name,$keywords){
		$data = ['name'=>$name,'keywords'=>$keywords];
		$result = db("Keywords")->insert($data);
		if($result){
			return true;
		}else{
			return false;
		}
	}

	// 删除关键词
	public function keywordsDel($key_id,$keywords="0"){
		if($keywords=="0"){
			$result = db("Keywords")->where("key_id",$key_id)->delete();
			if($result){
				return true;
			}else{
				return false;
			}
		}else{
			// 暂时没有完善
			return true;
		}
	}

	// 获取关键词
	public function keywordsGet($key_id,$type="array"){
		if($type=="array"){
			$keywords = db("Keywords")->where("key_id",$key_id)->value("keywords");
			$keywords = explode(" ", $keywords);
			return $keywords;
		}elseif($type="string") {
			$keywords = db("Keywords")->where("key_id",$key_id)->value("keywords");
			return $keywords;
		}else{
			return -1;
		}
	}

	// 关键词检测(重复。。)
}