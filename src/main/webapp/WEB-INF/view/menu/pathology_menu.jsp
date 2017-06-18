<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理页</title>


		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="<%=request.getContextPath()%>/assets/css/jquery.mmenu.css" rel="stylesheet">		
		<link href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">		   
	    <link href="<%=request.getContextPath()%>/assets/css/style.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/assets/css/add-ons.min.css" rel="stylesheet">

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
	<!-- start: Header -->
	
		<div class="navbar" role="navigation">
	
		<div class="container-fluid">		
			
			<ul class="nav navbar-nav navbar-actions navbar-left">
			</ul>
			
			
	        <ul class="nav navbar-nav navbar-right">
				<li class="dropdown visible-md visible-lg">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown">${adminUser}</a>
	      		</li>
			</ul>
			
		</div>
		
	</div>
	
	<!-- end: Header -->
	
	<div class="container-fluid content">
	
		<div class="row">
				
			<!-- start: Main Menu -->
			<div class="sidebar ">
								
				<div class="sidebar-collapse">
					<div class="sidebar-header t-center">
                        <span><img class="text-logo" src="<%=request.getContextPath()%>/assets/img/logo1.png"><i class="fa fa-space-shuttle fa-3x blue"></i></span>
                    </div>										
					<div class="sidebar-menu">						
						<ul class="nav nav-sidebar">
							<li><a href="home"><i class="fa fa-laptop"></i><span class="text"> Home</span></a></li>
							<li>
								<a href="#"><i class="fa fa-file-text"></i><span class="text"> 注册用户</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">
									<li><a href="per_menu"><i class="fa fa-car"></i><span class="text"> 用户列表</span></a></li>
									
								</ul>	
							</li>
							<li>
								<a href="#"><i class="fa fa-list-alt"></i><span class="text"> 药品信息</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">
									<li><a href="med_menu"><i class="fa fa-indent"></i><span class="text"> 药品列表</span></a></li>
								</ul>
							</li>
							</li>
							<li><a href="not_menu"><i class="fa fa-table"></i><span class="text"> 公告信息</span></a></li>
							<li>
								<a href="#"><i class="fa fa-signal"></i><span class="text"> 医者</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">
									<li><a href="doctor_menu"><i class="fa fa-random"></i><span class="text"> 医者列表</span></a></li>
									<li><a href="doctor_toBemenu"><i class="fa fa-tags"></i><span class="text">审核列表</span></a></li>
								</ul>
							</li>
							<li>
								<a href="#"><i class="fa fa-briefcase"></i><span class="text"> 病症</span> <span class="fa fa-angle-down pull-right"></span></a>
								<ul class="nav sub">
									<li><a href="pat_menu"><i class="fa fa-align-left"></i><span class="text"> 病症列表</span></a></li>

								</ul>
							</li>
							
						</ul>
					</div>					
				</div>
				<div class="sidebar-footer">					
					
					<div class="sidebar-brand">
						Sjz
					</div>
					
					<ul class="sidebar-terms">
						<li><a href="index.html#">Terms</a></li>
						<li><a href="index.html#">Privacy</a></li>
						<li><a href="index.html#">Help</a></li>
						<li><a href="index.html#">About</a></li>
					</ul>
								
				</div>	
				
			</div>
			<!-- end: Main Menu -->
						
		<!-- start: Content -->
		<div class="main ">
			<div class="row">
				<div class="col-lg-12">
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="fa fa-file-text"></i>Pathology</li>
					</ol>
				</div>
			</div>
						
			<div class="row activity">
				<div class="co"><iframe class="f3"  width="100%" height="650px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="pathology"></iframe>
				</div>
				
			</div><!--/.row-->
     
					
		</div>
		<!-- end: Content -->
		<br><br><br>		


					
		
	</div><!--/container-->
		
	
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body">
					<p>Here settings can be configured...</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="clearfix"></div>
	
		
	<!-- start: JavaScript-->
	<!--[if !IE]>-->

			<script src="<%=request.getContextPath()%>/assets/js/jquery-2.1.1.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script src="<%=request.getContextPath()%>/assets/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
	<script src="<%=request.getContextPath()%>/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>	
	
	
	<!-- page scripts -->
	<script src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	
	<!-- theme scripts -->
	<script src="<%=request.getContextPath()%>/assets/js/SmoothScroll.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.mmenu.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/core.min.js"></script>
	
	<!-- inline scripts related to this page -->
	
	<!-- end: JavaScript-->
</body>
</html>