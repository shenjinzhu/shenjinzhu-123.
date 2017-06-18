<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + ":"
			+ request.getServerPort() + path + "/";
	String basePath2 = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
	<!-- 聊天调用 -->
	<script type="text/javascript" src="<%=basePath2%>static/js/jQuery/jquery.js"></script>

	<script src="<%=request.getContextPath()%>/assets/js/jquery-2.1.1.min.js"></script>
	<!-- 使用cookie -->
	<script src="<%=request.getContextPath()%>/assets/js/jquery.cookie.js"></script>
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>	
	
	<!-- page scripts -->
	<script src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/moment/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/fullcalendar/js/fullcalendar.min.js"></script>
	
	<!-- theme scripts -->
	<script src="<%=request.getContextPath()%>/assets/js/SmoothScroll.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.mmenu.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/core.min.js"></script>
	
	<!-- inline scripts related to this page -->
	<script src="<%=request.getContextPath()%>/assets/js/pages/calendar.js"></script>
	
	<!-- end: JavaScript-->
<script type="text/javascript">
//聊天开始
	var path = '<%=basePath%>';
		var uid=${uid};
		if(uid==-1){
			location.href="<%=basePath2%>";
		}
		var from=uid;
		var fromName='${p.userName}';
		var to=${uid};
		var number=1;
		if ('WebSocket' in window) {
			console.log("ws://" +  path + "/ws?uid="+uid);
			websocket = new WebSocket("ws://" + path + "/ws?uid="+uid);
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket("ws://" + path + "/ws"+uid);
		} else {
			websocket = new SockJS("http://" + path + "/ws/sockjs"+uid);
		}
		websocket.onopen = function(event) {
			console.log("WebSocket:已连接");
			console.log(event);
		};
		websocket.onmessage = function(event) {
			var data=JSON.parse(event.data);
			console.log("WebSocket:收到一条消息",data);
			var textCss=data.from==-1?"sfmsg_text":"fmsg_text";	
			$("#content").append("<div class='fmsg'><label class='name'>"+data.fromName+"&nbsp;"+data.date+"</label><div class='"+textCss+"'>"+data.text+"</div></div>");
			if($("#"+data.from+"").text()){
				$("#"+data.from+"").css('color','red');
			}else{
				$("#friend").append('<div><input type="text" style="width:90px;" value="'+data.from+'" onclick="updateSend(this.value);" readonly="readonly" ><span id="'+data.from+'">名称：'+data.fromName+'</span></div><br>');
				
			}
			scrollToBottom();
		};
		websocket.onerror = function(event) {
			console.log("WebSocket:发生错误 ");
			console.log(event);
		};
		websocket.onclose = function(event) {
			console.log("WebSocket:已关闭");
			console.log(event);
		}
			function sendMsg(){
				var v=$("#msg").val();
				if(v==""){
					return;
				}else{
					var data={};
					data["from"]=from;
					data["fromName"]=fromName;
					data["to"]=to;
					data["text"]=v;
					websocket.send(JSON.stringify(data));
					$("#content").append("<div class='tmsg'><label class='name'>我&nbsp;"+new Date().Format("yyyy-MM-dd hh:mm:ss")+"</label><div class='tmsg_text'>"+data.text+"</div></div>");
					scrollToBottom();
					$("#msg").val("");
				}
			}
			
			function scrollToBottom(){
				var div = document.getElementById('content');
				div.scrollTop = div.scrollHeight;
			}
			
			Date.prototype.Format = function (fmt) { //author: meizz 
			    var o = {
			        "M+": this.getMonth() + 1, //月份 
			        "d+": this.getDate(), //日 
			        "h+": this.getHours(), //小时 
			        "m+": this.getMinutes(), //分 
			        "s+": this.getSeconds(), //秒 
			        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
			        "S": this.getMilliseconds() //毫秒 
			    };
			    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			    for (var k in o)
			    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			    return fmt;
			}
			
			function send(event){
				var code;
				 if(window.event){
					 code = window.event.keyCode; // IE
				 }else{
					 code = e.which; // Firefox
				 }
				if(code==13){ 
					sendMsg();            
				}
			}
			
			function clearAll(){
				$("#content").empty();
			}
			//改变聊天对象
			function updateSend(value){
				to=value;
				$("#to_w").html("当前聊天对象id:"+to);
				$("#chat").css('display','block');
				$("#sp").html("显示");
				$('#'+value+'').css('color','white');
			}
			function ScanBy(){
				to=$("#scan").val();
				$("#to_w").html("当前聊天对象id:"+to);
			}
			function sp(){
				if(number%2==0){
					$("#chat").css('display','none');
					$("#sp").html("显示");
				}else{
					$("#chat").css('display','block');
					$("#sp").html("关闭");
				}
				number=number+1;
			}
		
//聊天结束



$(function(){
	$("#to_w").html("当前聊天对象id:"+to);
	var  span=document.getElementById("loginname");
	if('${p.userName}'){
		span.innerHTML='${p.userName}';
	}else{
		span.innerHTML='登录   注册';
	}
	$('#showdoc').click(ShowDoc);
	//公告信息
	$('#Notice').click(Notice);
	
	if('${error}'){
		alert('${error}');
	}
	var personId=$.cookie('personId'); 
	$('#personId').html(personId);
	$('#pId')[0].value=personId;
});
function up(){
	 document.forms["fom"].submit();
}

function ShowDoc(){
	$.ajax({
		url:'showOnlineDoctor',
		success:function(result){
			var list= $.parseJSON(result);
			console.log(result);
			console.log(list.length);
			$('#showcoc').css('display','none');
			$('#firstC').css('display','block');
			var view=$('#firstC').empty();
			var cs=$(
					'<div class="container">'+
			'	<div class="row clearfix">'+
				'	<div class="col-md-12 column">'+
					'	<div class="row">'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>');
			for(var i=0;i<list.length;i++){
			var inner=$('<div class="col-md-4">'+
					'			<div class="thumbnail">'+
					'		<img alt="300x200" src="img/doctor.jpg" />'+
					'		<div class="caption">'+
					'			<h3>'+
								list[i].name+
					'			</h3>'+
					'			<p>'+
								list[i].major+
					'			</p>'+
					'			<p>'+
					'				 <a id="modal-426773" href="#modal-container-'+list[i].notice_id+'" role="button" class="btn" data-toggle="modal">查看详情</a> 点击id进行交流 <input type="text" style="width:90px;" value="'+list[i].id+'" onclick="updateSend(this.value);" readonly="readonly" >'+
					'			</p>'+
					'		</div>'+
					'	</div>'+
					'</div>'+
					'<div class="modal fade" id="modal-container-'+list[i].notice_id+'" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
					'<div class="modal-dialog">'+
					'<div class="modal-content">'+
					'<div class="modal-header">'+
					'	 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>'+
					'	<h4 class="modal-title" id="myModalLabel">'+
					'		详细内容'+
					'	</h4>'+
					'</div>'+
					'<div class="modal-body">'+
					
					'<div class="form-group">'+
					' <label for="inputPassword3" class="col-sm-2 control-label" >姓名</label>'+
					'	<div class="col-sm-10">'+
					'		<input style="width:300px;" value="'+list[i].name+'" type="text" name="question" id="question"  class="form-control" readonly="readonly"/>'+
					'	</div>'+
					'	<br>'+
					'	<br>'+
					'</div>'+
					'<div class="form-group">'+
					' <label for="inputPassword3" class="col-sm-2 control-label" >专业</label>'+
					'	<div class="col-sm-10">'+
					'		<input style="width:300px;" value="'+list[i].major+'" type="text" name="question" id="question"  class="form-control" readonly="readonly"/>'+
					'	</div>'+
					'	<br>'+
					'	<br>'+
					'</div>'+
					'<div class="form-group">'+
					' <label for="inputPassword3" class="col-sm-2 control-label" >所属医院</label>'+
					'	<div class="col-sm-10">'+
					'		<input style="width:300px;" value="'+list[i].hospital+'" type="text" name="question" id="question"  class="form-control" readonly="readonly"/>'+
					'	</div>'+
					'	<br>'+
					'	<br>'+
					'</div>'+
					'<div class="form-group">'+
					'<label for="inputPassword3" class="col-sm-2 control-label" >工作时间</label>'+
					'	<div class="col-sm-10">'+
					'		<input style="width:300px;" value="'+list[i].workTime+'" type="text" name="question" id="question"  class="form-control" readonly="readonly"/>'+
					'	</div>'+
					'	<br>'+
					'	<br>'+
					'</div>'+
					
					'</div>'+
					'<div class="modal-footer">'+
					'	 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>'+
					'</div>'+
				'</div>'+
				'</div>'+
				'</div>'
						);
				
				cs.append(inner);
				console.log(0);
			}
			view.append(cs);	
		}
	});
}

	function back(){
		$('#firstC').css('display','none');
		$('#showcoc').css('display','block');
	}
</script>
<style type="text/css">
	#loginname{font-size: 1.3em;}
	.top{background-color: #8DB6CD;text-align: center;width:85%;height:35px; margin: auto;font-size: 1.4em}
	.foot{text-align: center;}
	.cont_one{width:350px;height: 400px;display: inline;margin-left: 100px;}
	.cont_two{display: inline;width: 550px;height: 400px; margin-left:500px;}
	
	a:visited {color:black;}
a:hover{color:black;}
a:active {color:black;}
.chat{width:450px;height:350px; position: fixed;top: 100px;right: 5px;background-color: white;z-index:9099;display: none;}
	<!-- 聊天 -->
	
	textarea {
	height: 80px;
	width: 100%;
	resize: none;
	outline: none;
	background-color: white;
}

input[id=button] {
	float: right;
	margin: 5px;
	width: 50px;
	height: 35px;
	border: none;
	color: white;
	font-weight: bold;
	outline: none;
}

.clear {
	background: red;
}

.send {
	background: green;
}

.clear:active {
	background: yellow;
}

.send:active {
	background: yellow;
}

.msg {
	width: 260px;
	height: 40px;
	outline: none;
}

#content {
	border: 1px solid gray;
	width: 70%;
	height: 280px;
	overflow-y: scroll;
}

.from {
	background-color: green;
	width: 40%;
	border-radius: 10px;
	height: 30px;
	line-height: 30px;
	margin: 5px;
	float: left;
	color: white;
	padding: 5px;
	font-size: 22px;
}

.to {
	background-color: gray;
	width: 80%;
	border-radius: 10px;
	height: 30px;
	line-height: 30px;
	margin: 5px;
	float: right;
	color: white;
	padding: 5px;
	font-size: 22px;
}

.name {
	color: gray;
	font-size: 12px;
}

.tmsg_text {
	color: white;
	background-color: rgb(47, 47, 47);
	font-size: 18px;
	border-radius: 5px;
	padding: 2px;
}

.fmsg_text {
	color: white;
	background-color: rgb(66, 138, 140);
	font-size: 18px;
	border-radius: 5px;
	padding: 2px;
}

.sfmsg_text {
	color: white;
	background-color: rgb(148, 16, 16);
	font-size: 18px;
	border-radius: 5px;
	padding: 2px;
}

.tmsg {
	clear: both;
	float: right;
	width: 80%;
	text-align: right;
}

.fmsg {
	clear: both;
	float: left;
	width: 80%;
}
.friend{
text-align:center;
width:30%;
height:220px;
position: absolute;
top:0px;
right: 0px;
background-image: url("img/bj.png");
overflow-y: scroll;
}
.to_who{
	width:120px;
	height: 20px;
	position: absolute;
	top:225px;
	right: 0px;
}
.hidOrShow{
	position: fixed;
	top:75px;
	right:0px;
	width:45px;
	height:25px;
}
</style>
<!-- Import google fonts - Heading first/ text second -->
       

		<!-- 略缩图 -->
		<link href="//cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/ico/favicon.ico" type="image/x-icon" />

	    <!-- Css files -->
	    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="<%=request.getContextPath()%>/assets/css/jquery.mmenu.css" rel="stylesheet">		
		<link href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet">	
	    <link href="<%=request.getContextPath()%>/assets/css/style.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/assets/css/add-ons.min.css" rel="stylesheet">		

	    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
	
	<div class="navbar" role="navigation" style="background-color: #8B8B83">
		<div class="container-fluid">	
			<ul class="nav navbar-nav navbar-actions navbar-left" onclick="back();"><a href="#">复原</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</ul>		
			<ul class="nav navbar-nav navbar-actions navbar-left" id="Notice"><a href="notice_show">公告信息</a>
			</ul>
			<ul class="nav navbar-nav navbar-actions ">&nbsp;&nbsp;&nbsp;&nbsp;<a href="doc" target="_blank">注册成为医生</a>
			</ul>
			<ul class="nav navbar-nav navbar-actions " id="showdoc">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">在线医生</a>
			</ul>
	        <ul class="nav navbar-nav navbar-right">
				<li class="dropdown visible-md visible-lg">
				<c:if test="${p.userName!=null}">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><div class="user">
					<span id="loginname"></span>
				</c:if>
				<c:if test="${p.userName==null}">
					<a href="toLogin" class="dropdown-toggle">登录</a>
					<a href="toRegister" class="dropdown-toggle">注册</a>
				</c:if>
				</a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>当前用户ID：<span id="personId"></span>
							<c:if test="${p.iden=='2'}">普通用户</c:if>
							<c:if test="${p.iden=='3'}">医生</c:if>
							</strong>
						</li>						
						<li>
						<!--  -->
						 <a id="modal-442489" href="#modal-container-442489" role="button"  data-toggle="modal">
						 <i class="fa fa-user"></i>个人中心
						 </a>
						<!--  -->
						</li>
						<li>
							 <a id="modal-442489" href="#modal-container-442500" role="button"  data-toggle="modal">
						 <i class="fa fa-wrench"></i>修改密码
						 </a>
						
						</li>					
						<li><a href="toLogin"><i class="fa fa-sign-out"></i> 切换用户</a></li>	
	        		</ul>
	      		</li>
				<li><a href="toLogin"><i class="fa fa-power-off"></i></a></li>
			</ul>
			
		</div>
		
	</div>
	<!-- 以上为导航 --><br><br><br><br>
	<div class="top">
		<form>
		<!-- dhend -->
		<a href="news" target="_blank" style="float: left;position: absolute;left: 150px;">新闻</a>&nbsp;&nbsp;&nbsp;
		<a href="medical_show_l" style="float: left;position: absolute;left: 280px;">药物检索</a>&nbsp;&nbsp;&nbsp;
		<a href="pathology_show_l" style="float: left;position: absolute;left: 410px;">病症检索</a>&nbsp;&nbsp;&nbsp;
		<a href="commonP" target="_blank" style="float: left;position: absolute;left: 540px;">常见病症预防</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</form>
	</div>
	<!--下面是内容 -->	
	<div class="content" id="firstC"></div>
	<div class="content" id="showcoc">
	
	<br>
			<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="carousel slide" id="carousel-326751">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel-326751">
						</li>
						<li data-slide-to="1" data-target="#carousel-326751">
						</li>
						<li data-slide-to="2" data-target="#carousel-326751">
						</li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt="200" src="img/haidai.png" style="margin: auto"/>
							<div class="carousel-caption">
								<h4>
									常吃海带解决身体八大问题
								</h4>
								<p>
									海带是公认最有营养的食物，它可是碱性食物，而且价格非常便宜，多食用对健康是非常有益的，那么海带的养生功效都有哪些呢？
								</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="img/ex1.png" style="margin: auto"/>
							<div class="carousel-caption">
								<h4>
									程序员需要补充的7种营养
								</h4>
								<p>
									1.维生素A。它能构成视网膜表面的感光物质，夜盲症就是缺乏维生素A引起的。台湾马偕医院台北院区营养课课长赵强指出，长时间盯着计算机屏幕，会大量消耗维生素A。最常见富含维生素A的食物是动物内脏，但其含胆固醇较高，不适合大量食用。...
								</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="img/hongzao.png" style="margin: auto"/>
							<div class="carousel-caption">
								<h4>
									红枣的几种养生吃法
								</h4>
								<p>  
									女性要有血色看过去才健康，也因此要注意补血。那么，说到补血要怎么补才达到最佳的效果呢？
								</p>
							</div>
						</div>
					</div> <a class="left carousel-control" href="#carousel-326751" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-326751" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>
	</div>
	<div class="cont">
	<br>
		<div class="cont_two">
			<!-- 22 -->
			<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron well">
				<h2>
					45个你必须知道的医学常识
				</h2>
				<p>
					1. 正常心率：每分钟75次 健康成年人安静状态下，心率平均为每分钟75次。正常范围为每分钟60-100次。
					成人安静时心率超过100次/分钟，为心动过速；低于60次/分钟者，为心动过缓。心率可因年龄、性别及其他因素而变化，
					比如体温每升高1℃，心率可加快12-20次/分钟，女性心率比男性心率稍快，运动员的心率较慢。
					2. 正常体温：36.3℃-37.2℃（口测法） 临床上通常用口腔温度、直肠温度和腋窝温度来代表体温。口测...
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="getMore" target="_blank">了解更多</a>
				</p>
			</div>
		</div>
	</div>
</div>
			<!-- 22end -->
			
			<div class="cont_one">
			<!-- 1 -->
		<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				如何养成健康的身体
			</h3>
			<p>
				1.饮食要清淡。多吃蔬菜和蔬果，尤其是绿叶蔬菜和当季水果，<br>
2
适量维生素。维生素A对夜盲症有效果，维生素C抗坏血酸。维生素E抗衰老。<br>
3
运动适量。多做有氧运动，如瑜伽、健美操，老年多做广场舞和交际舞<br>
4
心态。保持一个良好的心态，年轻的心态，健康的心态。<br>
			</p>
		</div>
	</div>
</div>
<!-- oneend -->
		</div>
		</div>
	</div>
</div>

	<!--尾部  -->	
	
	
	<div class="foot">
		意见建议&nbsp;&nbsp;949131080@qq.com
	</div>
	<!-- 个人信息 -->
	<div class="modal fade" id="modal-container-442489" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								个人信息
							</h4>
						</div>
						<div class="modal-body">
							<!-- 表单信息 -->
			<form role="form" class="form-inline">
				<div class="form-group">
					 <label for="exampleInputEmail1">账户：</label><input type="text" readonly="readonly" name="personId" value="${p.personId}" class="form-control"/>
				</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					 <label for="exampleInputPassword1">昵称：</label><input type="text" readonly="readonly" name="userName"value="${p.userName}" class="form-control"/>
				</div><br><br>
				
				<div class="form-group">					 
					  <label for="exampleInputPassword1">性别：<input type="text" name="sex"value="${p.sex}" readonly="readonly" class="form-control" readonly="readonly"/>
				</div>&nbsp;&nbsp;
				<div class="form-group">
					 <label for="exampleInputPassword1">age：</label><input type="text" name="age"value="${p.age}" readonly="readonly" class="form-control"/>
				</div><br><br>
				<div class="form-group">
					 <label for="exampleInputPassword1">email：</label><input style=" width:380px;" type="text" name="email" readonly="readonly" value="${p.email}" class="form-control"/>
				</div>
				<br><br>
				<span id="messForup"></span>	
			</form>						
							<!-- 表单信息end -->
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <!--  <button type="button" class="btn btn-primary">修改</button>-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 修改密码 -->
		<div class="modal fade" id="modal-container-442500" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								修改密码
							</h4>
						</div>
						<div class="modal-body">
						<!-- 表单 -->
						<form role="form" class="form-inline" action="updatePwd" name="fom">
							<input type="hidden" name="personId" id="pId">
							<!-- 判断 -->
								<c:if test="${p.question != ''}">
									<div class="form-group">
									 <label for="inputPassword3" class="col-sm-2 control-label" >问题</label>
										<div class="col-sm-10">
											<input style="width:300px;" value="${p.question }" type="text" name="question" id="question"  class="form-control" readonly="readonly"/>
										</div>
										<br>
										<br>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label" >答案</label>
										<div class="col-sm-10">
										<input style="width:300px;"  type="text" name="answer" class="form-control" />
										</div>
										<br>
										<br>
									</div>
								</c:if>
							<div class="form-group">
								 <label for="inputPassword3" class="col-sm-2 control-label" >新密码</label>
								<div class="col-sm-10">
								<input style="width:300px;" type="password" name="passWord" class="form-control" />
								</div>
							</div>
								
							</form>
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary" onclick="up();">确定</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="chat" id="chat">
			<div id="content"></div>
	<div class="friend" id="friend">
		列表点数选择<br>
	</div>
	<br>
	<input type="text" placeholder="请输入要发送的信息,需要登录才能使用" id="msg" class="msg" onkeydown="send(event)">
	<input type="button" value="发送" class="send" onclick="sendMsg()"  id="button">
	<input type="button" value="清空" class="clear" onclick="clearAll()" id="button">
	<div class="to_who">
		<span id="to_w"></span><br>
		切换<input id="scan" type="text" style="width:40px;">
		<input type="button" value="确定" onclick="ScanBy();">
	</div>
		</div>
	<!-- 设置显示隐藏 -->
	<div class="hidOrShow" onclick="sp();">
		<span id="sp">显示</span>
	</div>
</body>
</html>