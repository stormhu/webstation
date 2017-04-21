<?php
// +----------------------------------------------------------------------
// | 关键词相关操作函数
// +----------------------------------------------------------------------
// | Author: stormhu E:stormgu@foxmail.com
// +----------------------------------------------------------------------
namespace app\websearch\library;

class Keywords
{
	// 添加关键词组
	public function keywordsAdd($keywords){
		$data = ['keywords'=>$keywords];
		$result = db("Keywords")->insert($data);
		if($result){
			return true;
		}else{
			return false;
		}
	}

	// 删除关键词
	public function keywordsDel($key_id){
		$result = db("Keywords")->where("key_id",$key_id)->delete();
		if($result){
			return $result;
		}else{
			return false;
		}
	}

	// 获取关键词列表
	public function keywordsList($limit=30){
		$result = db("Keywords")->column("keywords","key_id");
		return $result;
	}

	// 关键词检测(重复。。)
	public function keywordsCkeck($keywords){
		$result = db("Keywords")->where("keywords",$keywords)->find();
		if($result==null){
			return true;
		}else{
			return false;
		}
	}
}