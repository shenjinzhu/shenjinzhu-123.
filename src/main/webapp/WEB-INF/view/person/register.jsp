<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<style type="text/css">
body{background :url(<%=request.getContextPath()%>/img/bj.png)}
</style>
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/Validform_v5.3.2.js"></script>
<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		$("#login").click(Login);
		$("#sss").Validform();
	});
	
	function Login(){
		window.location.href="toLogin";
	}
	function regist(){
		var username=$("#userName").val();
		var password=$("#passWord").val();
		var age=$("#age").val();
		var email=$("#email").val();
		console.log(username+password+age+email);
		if(username&&password&&age&&email){
			 document.forms["fom"].submit();
		}else{
			$("#messageFor").html("红色部分填写错误");
		}
	
	function userNameIsNull(){
		var userName=$("#userName").val();
		$.ajax({
			url:'selectName',
			data:{userName:userName},
			postType:'JSON',
			success:function(result){
				$("#Susername").empty();
				console.log(result);
				var list= $.parseJSON(result);
				if(list[0].userName){
					$("#Susername").html("该昵称已经存在");
					console.log(result);
					return;
				}
				return;
			}
		});
	}
	}
	function Went(){
		var s=$('#question').val();
		if(s){
			console.log(s);
			$('#answer').css('display','block');
		}else{
			$('#answer').css('display','none');
		}
	}
</script>
<style type="text/css">
.Validform_checktip{
	margin-left:8px;
	line-height:20px;
	height:20px;
	overflow:hidden;
	color:#999;
	font-size:12px;
}
.Validform_right{
	color:#71b83d;
	padding-left:20px;
	background:url(../images/right.png) no-repeat left center;
}
.Validform_wrong{
	color:red;
	padding-left:20px;
	white-space:nowrap;
	background:url(../images/error.png) no-repeat left center;
}
.Validform_loading{
	padding-left:20px;
	background:url(../images/onLoad.gif) no-repeat left center;
}
.Validform_error{
	background-color:#ffe7e7;
}
#Validform_msg{color:#7d8289; font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif; width:280px; -webkit-box-shadow:2px 2px 3px #aaa; -moz-box-shadow:2px 2px 3px #aaa; background:#fff; position:absolute; top:0px; right:50px; z-index:99999; display:none;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#999999');}
#Validform_msg .iframe{position:absolute; left:0px; top:-1px; z-index:-1;}
#Validform_msg .Validform_title{line-height:25px; height:25px; text-align:left; font-weight:bold; padding:0 8px; color:#fff; position:relative; background-color:#000;}
#Validform_msg a.Validform_close:link,#Validform_msg a.Validform_close:visited{line-height:22px; position:absolute; right:8px; top:0px; color:#fff; text-decoration:none;}
#Validform_msg a.Validform_close:hover{color:#cc0;}
#Validform_msg .Validform_info{padding:8px;border:1px solid #000; border-top:none; text-align:left;}


#answer{display: none;}
</style>
</head>
<body>
<div class="bj" style="position: absolute;top:28%;left:24%;">
	
	
			<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form action="register" method="post" class="form-horizontal" role="form" id="sss" name="fom">
						<div class="form-group">
							 <label for="inputEmail3" class="col-sm-2 control-label">昵称</label>
							<div class="col-sm-10">
								<input style="width:300px;"input type="text" name="userName" id="userName" onblur="userNameIsNull();" class="form-control"  datatype="s2-13" id="username"/>
								<span id="Susername"></span>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-2 control-label" >密码</label>
							<div class="col-sm-10">
								<input style="width:300px;" type="password" name="passWord" class="form-control" datatype="s5-16" datatype="s2-13" id="passWord"/>
							</div>
						</div>
						
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-2 control-label" >年龄</label>
							<div class="col-sm-10">
								<input style="width:300px;" type="text" name="age" class="form-control" datatype="n1-2" id="age"/>
							</div>
						</div>
						
						
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-2 control-label" >性别</label>
							<div class="col-sm-10">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="sex" value="男" checked/>男 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="sex" value="女"/>女
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-2 control-label" >密保问题</label>
							<div class="col-sm-10">
								<input style="width:300px;" type="text" name="question" id="question" onchange="Went();" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-2 control-label" >答案</label>
							<div class="col-sm-10">
								<input style="width:300px;"  type="text" name="answer" id="answer" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-sm-2 control-label" >邮箱</label>
							<div class="col-sm-10">
								<input style="width:300px;"  type="text" name="email" id="email" class="form-control" />
								<span id="messageFor"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="button"  class="btn btn-default" onclick="regist();">注册</button>
								  <button type="reset" class="btn btn-default" >重置</button>
								  <button type="button" class="btn btn-default" id="login">登录</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>

</div>
</body>
</html>