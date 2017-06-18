<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户</title>
<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<br><br>
	
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="person_UP" method="post" class="form-horizontal" role="form">
				<input type="hidden" name="personId" value="${p.personId }">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">昵称</label>
					<div class="col-sm-10">
						<input type="text" name="userName" value="${p.userName}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input type="text" name="passWord" value="${p.passWord}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">age</label>
					<div class="col-sm-10">
						<input type="text" name="age" value="${p.age}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">sex</label>
					<div class="col-sm-10">
						<input type="text" name="sex" value="${p.sex}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">email</label>
					<div class="col-sm-10">
						<input type="text" name="email" value="${p.email}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <input type="submit" value="提交"  class="btn btn-default">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
	
</body>
</html>