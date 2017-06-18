<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录页面</title>
<style type="text/css">
body{background :url(<%=request.getContextPath()%>/img/bj.png)}
</style>
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#register").click(ToRegister);
		if('${Thisid}'){
			alert("注册成功，获取id为"+'${Thisid}');
		}
		if('${success}'){
			alert('${success}');
		}
	});

	
	function ToRegister(){
		window.location.href="toRegister";
	}
	function SUser(){
		if($("#personId").val()){
			return true;
		}
		return false;
	}
	function SPwd(){
		if($("#password").val()){
			return true;
		}
		return false;
	}
</script>
</head>
<body>
<div class="bj" style="position: absolute;top:28%;left:24%;">

	
			<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form action="login" method="post" class="form-horizontal" role="form" onsubmit="return SUser() +SPwd()==2">
						<div class="form-group">
							 <label for="inputEmail3" class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<input style="width:300px;" type="text" name="personId" id="personId" class="form-control" value="${personId }" onblur="SUser();"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-2 control-label" >密码</label>
							<div class="col-sm-10">
								<input style="width:300px;" type="password" name="passWord" id="password" class="form-control" onblur="SPwd();"/>
				
							<span>${error}</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit"  class="btn btn-default">登录</button>
								 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								  <button type="button"  class="btn btn-default" id="register">注册</button>
								   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								   <a href="forgId">忘记密码</a>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>

</div>
</body>
</html>