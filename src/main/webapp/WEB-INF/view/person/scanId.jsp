<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/Validform_v5.3.2.js"></script>
<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#sub").click(Submit);
	});
	function Submit(){
		var personId=$("#personId").val();
		console.log(personId);
		if(personId){
			 document.forms["fom"].submit();
		}else{
			$("span").html("有信息未填写完整");
		}
	}

</script>
<style>
body{background-image: url("img/sqdoc.jpg");}
	.form-control{width:300px;}
</style>
</head>
<body>
	<div style="position: absolute;top:24%;left:24%;">
		<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form class="form-horizontal" method="post" role="form" name="fom" action="forget">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">账号:</label>
					<div class="col-sm-10">
						<input type="text" name="personId" id="personId"  class="form-control"/>
						<span id="span"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-default" id="sub">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</div>
</body>
</html>