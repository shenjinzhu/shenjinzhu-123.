<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>医师申请</title>
<script src="<%=request.getContextPath()%>/assets/js/jquery-2.1.1.min.js"></script>
<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#submit").click(Submit);
		
	});
	function Submit(){
		var id=$("#id").val();
		var name=$("#name").val();
		var major=$("#major").val();
		var hospital=$("#hospital").val();
		var bianhao=$('#bianhao').val();
		console.log(id);
		if(id&&name&&major&&hospital&&bianhao){
		$.ajax({
			url:'doctor_Tobe',
			type:'post',
			data:{id:id,name:name,major:major,hospital:hospital,bianhao:bianhao},
			dataType:'JSON',
			success:function(result){
				console.log(result[0].msg);
				if(result[0].msg){
					alert(result[0].msg);
				}
				window.close();
				return;
			}
		});
		}else{
			alert("请填写完资料再提交");
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
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<input type="hidden" name="id" id="id" value="${personId }">
					 <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
					<div class="col-sm-10">
						<input type="text" name="name" id="name" value="${name}"  class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">专业:</label>
					<div class="col-sm-10">
						<input type="text" name="major" id="major" value="${major}" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">所在医院:</label>
					<div class="col-sm-10">
						<input type="text" name="hospital" id="hospital" value="${hospital}" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">证书编号:</label>
					<div class="col-sm-10">
						<input type="text" name="bianhao" id="bianhao" value="${bianhao}" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-default" id="submit">提交</button><button type="reset" class="btn btn-default">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</div>
</body>
</html>