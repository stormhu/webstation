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

		<div class="col-md-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2>违禁词</h2>
				</div>
				<div class="panel-body">
					{foreach $keywords as $vo}
					<h3 style="display:inline-block;">{$vo}</h3>
					{/foreach}
					
				</div>
				<div class="panel-footer">
					<div class="input-group">
						<input type="text" id="keywords" class="form-control" placeholder="请输入关键词" >
						<div class="input-group-btn">
							<a href="javascript:void(0);" onclick="keywordsInstert()" class="btn btn-default">添加</a>
							<a href="javascript:void(0);" onclick="keywordsDel()" class="btn btn-default">删除</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<h1>搜索部分</h1>
		</div>
	</div>
</div>

<div class="modal fade" id="test" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


</body>

<script type="text/javascript">
	function keywordsInstert(){
		alert($("#keywords").val());

		var data = {
			keywords:$("#keywords").val()
		}
		$.ajax({
			type:"POST",
			url:"/index.php/websearch/Ajax/keywordsInstert",
			data:data,
			success: function(msg){
				if(msg.result==true){
					
				}else{

				}
				alert(msg.msg);
			}
		});
	}
	function keywordsDel(){
		$("#test").modal({
			backdrop:"123312",
		});
	}
</script>

</html>