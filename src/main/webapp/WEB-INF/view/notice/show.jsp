<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>公告信息</title>
	<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">	
	<style type="text/css">
		body{background-image: url("img/bj.png");}
	</style>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="breadcrumb">
				<li>
					 <a href="main_web">主页</a>
				</li>
				<li class="active">
					公告信息
				</li>
			</ul>
		</div>
	</div>
</div>
<br><br><br>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table" style="width:600px;margin: auto;">
				<thead>
					<tr>
						<th>
							主题
						</th>
						<th>
							时间
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="l">
						<tr class="error">
							<td>
			 					<a id="modal-483227" href="#modal-container-${l.notice_id }" role="button" class="btn" data-toggle="modal">${l.title}</a>						
							</td>
							<td>
								${l.time}
							</td>
						</tr>
						<div class="modal fade" id="modal-container-${l.notice_id }" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								标题：${l.title}
							</h4>
						</div>
						<div class="modal-body" style="height:300px;">
						<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${l.content }
						</div>
						<div style="float: right;" >
							${l.time}&nbsp;&nbsp;&nbsp;
						</div>
						<br>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>



</body>
</html>