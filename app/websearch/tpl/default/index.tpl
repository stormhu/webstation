<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="__STATIC__/webstation/default/css/bootstrap.min.css">
	<script type="text/javascript" src="__STATIC__/webstation/default/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="__STATIC__/webstation/default/js/bootstrap.min.js"></script>
	<title>网站内容搜索</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="min-height:100px;">
			<div class="">
				
			</div>
		</div>
		<div class="col-md-5">
			<div class="panel panel-default">
				<!-- 关键词 begin -->
				<div class="panel-heading">
					<h2>违禁词</h2>
					<div class="input-group">
						<input type="text" id="keywords" class="form-control" placeholder="请输入关键词" >
						<div class="input-group-btn">
							<a class="btn btn-default" onclick="keywordsAdd('keywords_body')" >添加</a>
						</div>
					</div>
				</div>
				<div id="keywords_body" class="panel-body">
					{foreach name="keywords" item="v" key="k" }
					<h3 style="display:inline-block;"><span class="label label-default">{$v} <span style="cursor:pointer;" onclick="keywordsDel({$k},'keywords_body')">&times;</span></span></h3>
					{/foreach}
				</div>
				<!-- 关键词 end -->
				<!-- 网站列表 begin -->
				<div class="panel-heading">
					<h2>网址列表</h2>
					<div class="input-group">
						<input type="text" id="url" class="form-control" placeholder="以http://开头" >
						<div class="input-group-btn">
							<a class="btn btn-default" onclick="urlAdd('urls_tbody')" >添加</a>
						</div>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>URL</th>
							<th>备注</th>
							<th>状态</th>
							<th>采集</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="urls_tbody">
						{foreach $urls as $v}
						<tr>
							<td>{$v.url_id}</td>
							<td>{$v.url}</td>
							<td>{$v.note}</td>
							<td>{$v.status}</td>
							<td>{$v.collection}</td>
							<td><span style="cursor:pointer;" onclick="urlDel({$v.url_id},'urls_tbody')">&times;</span></td>
						</tr>
						{/foreach}
					</tbody>
				</table>
				<!-- 网站列表 end -->
			</div>
		</div>

		<div class="col-md-7">
			<!-- 自网址查询 -->
			<div class="panel panel-default" >
				<div class="panel-heading">
					<h2>网址采集表</h2>
					<a class="btn btn-default" onclick="urlCollection()">采集</a>
				</div>
				<div class="panel-body" >
					<table class="table" >
						<thead>
							<tr>
								<th>ID</th>
								<th>父ID</th>
								<th>URL</th>
								<th>状态</th>
								<th>采集</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="sonurls_tbody">
							{foreach $sonurls as $v }
							<tr>
								<td>{$v.url_id}</td>
								<td>{$v.parent_id}</td>
								<td>{$v.url}</td>
								<td>{$v.status}</td>
								<td>{$v.collection}</td>
								<td><span style="cursor:pointer;" onclick="sonurlDel({$v.url_id},'sonurls_tbody')">&times;</span></td>
							</tr>
							{/foreach}
						</tbody>
					</table>
					<nav aria-label="...">
					  <ul class="pager">
					    <li><a href="#">Previous</a></li>
					    <li><a href="#">Next</a></li>
					  </ul>
					</nav>
				</div>
					
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2>匹配日志表</h2>
				</div>
				<table></table>
			</div>
		</div>
	</div>
</div>
</body>

<script type="text/javascript">
	// 关键词增加
	function keywordsAdd(div_id){
		var data = {
			keywords:$("#keywords").val()
		}
		$.ajax({
			type:"POST",
			url:"/index.php/websearch/Ajax/keywordsAdd",
			data:data,
			success:function(msg){
				refreshHtml("keywords",div_id);
			}
		});
	}
	// 关键词删除
	function keywordsDel(key_id,div_id){
		var data = {
			key_id:key_id,
		}
		$.ajax({
			type:"POST",
			url:"/index.php/websearch/Ajax/keywordsDel",
			data:data,
			success: function(msg){
				refreshHtml("keywords",div_id);
			}
		});
	}
	// url添加
	function urlAdd(div_id){
		var data = {
			url:$("#url").val(),
		}
		$.ajax({
			type:"POST",
			url:"/index.php/websearch/Ajax/urlAdd",
			data:data,
			success: function(msg){
				refreshHtml("urls",div_id);
			}
		});
	}
	// url删除
	function urlDel(url_id, div_id){
		var data = {
			url_id:url_id,
		}
		$.ajax({
			type:"POST",
			url:"/index.php/websearch/Ajax/urlDel",
			data:data,
			success: function(msg){
				refreshHtml("urls",div_id);
			}
		});
	}

	function sonurlDel(url_id, div_id){
		var data = {
			url_id:url_id,
		}
		$.ajax({
			type:"POST",
			url:"/index.php/websearch/Ajax/urlDel",
			data:data,
			success: function(msg){
				refreshHtml("sonurls",div_id);
			}
		});
	}

	// 刷新局部区域
	function refreshHtml(html_key,div_id){
		var data = {
			html_key:html_key,
		}
		$.ajax({
			type:"POST",
			url:"/index.php/websearch/Ajax/refreshHtml",
			data:data,
			success: function(msg){
				if(msg.result){
					$("#"+div_id).html(msg.html);
				}
			}
		});
	}
	function urlCollection(){
		$.ajax({
			type:"POST",
			url:"/index.php/websearch/Ajax/urlCollection",
			success: function(msg){
				refreshHtml("sonurls","sonurls_tbody");
			}
		});
	}
</script>

</html>