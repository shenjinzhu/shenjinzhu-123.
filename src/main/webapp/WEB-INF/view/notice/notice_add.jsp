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
			<form action="noticeSave" method="post" class="form-horizontal" role="form">
				<input type="hidden" name="notice_id" value="${notice.notice_id }">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-10">
						<input type="text" name="title" value="${notice.title}" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">内容</label>
					<div class="col-sm-10">
						<textarea  rows="3" cols="20" name="content"  class="form-control">${notice.content}
						</textarea>
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