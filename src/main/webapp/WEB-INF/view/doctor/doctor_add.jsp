<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<br><br>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="save" method="post" class="form-horizontal" role="form">
				<input type="hidden" name="doctor_id" value="${doctor.doctor_id }">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">名称</label>
					<div class="col-sm-10">
						<input type="text" name="name" value="${doctor.name}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">专业</label>
					<div class="col-sm-10">
						<input type="text" name="major" value="${doctor.major}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">医院</label>
					<div class="col-sm-10">
						<input type="text" name="hospital" value="${doctor.hospital}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">工作时间</label>
					<div class="col-sm-10">
						<input type="text" name="workTime" value="${doctor.workTime}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">编号</label>
					<div class="col-sm-10">
						<input type="text" name="id" value="${doctor.id}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">编证书号</label>
					<div class="col-sm-10">
						<input type="text" name="bianhao" value="${doctor.bianhao}" class="form-control" id="inputEmail3" readonly="readonly" />
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