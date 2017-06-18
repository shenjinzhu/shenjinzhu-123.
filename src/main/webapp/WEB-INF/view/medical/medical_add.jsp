<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<br><br>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="save" method="post" class="form-horizontal" role="form">
				<input type="hidden" name="medical_id" value="${medical.medical_id }">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">名称</label>
					<div class="col-sm-10">
						<input type="text" name="mname" value="${medical.mname}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">英文名</label>
					<div class="col-sm-10">
						<input type="text" name="ename" value="${medical.ename }" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">特性</label>
					<div class="col-sm-10">
						<input type="text" name="mcharacteristic" value="${medical.mcharacteristic }" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">主治功能</label>
					<div class="col-sm-10">
						<input type="text" name="mfunction" value="${medical.mfunction }" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">副作用</label>
					<div class="col-sm-10">
						<input type="text" name="side_effect" value="${medical.side_effect }" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">编号</label>
					<div class="col-sm-10">
						<input type="text"  name="mGrowth_envir" value="${medical.mGrowth_envir }" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">来源</label>
					<div class="col-sm-10">
						<input type="text"  name="source" value="${medical.source }" class="form-control" id="inputEmail3" />
					</div>
				</div>
				
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <input type="submit" value="提交"  class="btn btn-default"><input type="reset" value="重置"  class="btn btn-default">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>




</body>
</html>