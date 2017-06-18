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
			<form action="pathologySave" method="post" class="form-horizontal" role="form">
				<input type="hidden" name="pathology_id" value="${pathology.pathology_id }">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">名称</label>
					<div class="col-sm-10">
						<input type="text" name="p_name" value="${pathology.p_name}" class="form-control" id="inputEmail3"  readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">症状</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="4" cols="4"  readonly="readonly">${pathology.sysmptom}</textarea>
						
					</div>
				</div>
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">描述</label>
					<div class="col-sm-10">
						<input type="text" name="pintroduce" value="${pathology.pintroduce}" class="form-control" id="inputEmail3" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">药物</label>
					<div class="col-sm-10">
						<input type="text" name="medical_use" value="${pathology.medical_use}" class="form-control" id="inputEmail3" readonly="readonly"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">注意事项</label>
					<div class="col-sm-10">
						<input type="text" name="matters_Needing_Attention" value="${pathology.matters_Needing_Attention}" class="form-control" id="inputEmail3" readonly="readonly"/>
					</div>
				</div>
				
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>