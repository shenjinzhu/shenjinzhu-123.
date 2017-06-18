<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>病症显示</title>

	
<link href="<%=request.getContextPath()%>/static/js/bootstrap//css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap-paginator.min.js"></script>
<style type="text/css">
		body{background-image: url("img/bj.png");}

#queryDiv {
 margin-right: auto;
 margin-left: auto;
 width:900px;
}
#textInput {
 margin-top: 10px;
}
#tableResult {
 margin-right: auto;
 margin-left: auto;
 width:900px;
}
td {
 width:150px
}
</style>
<script type='text/javascript'>    
	    var PAGESIZE = 10;
        var options = {  
            currentPage: 1,  //当前页数
            totalPages: 10,  //总页数，这里只是暂时的，后头会根据查出来的条件进行更改
            size:"normal", 
            alignment:"center",  
            itemTexts: function (type, page, current) {  
                switch (type) {  
                    case "first":  
                        return "第一页";  
                    case "prev":  
                        return "前一页";  
                    case "next":  
                        return "后一页";  
                    case "last":  
                        return "最后页";  
                    case "page":  
                        return  page;  
                }                 
            },  
            onPageClicked: function (e, originalEvent, type, page) {  
            	var sysmptom = $("#textInput").val(); //取内容
            	buildTable(sysmptom,page,PAGESIZE);//默认每页最多10条
            }  
        }  

        //获取当前项目的路径
        var urlRootContext = (function () {
            var strPath = window.document.location.pathname;
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
            return postPath;
        })();
        
       
        //生成表格
        function buildTable(sysmptom,pageNumber,pageSize) {
        	 var url =  urlRootContext + "/pathologyList.do"; //请求的网址
             var reqParams = {'sysmptom':sysmptom, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据
             $(function () {   
             	  $.ajax({
             	        type:"POST",
             	        url:url,
             	        data:reqParams,
             	        // async:false,
             	        dataType:"json",
             	        success: function(data){
             	            if(data.isError == false) {
             	           // options.totalPages = data.pages;
             	        var newoptions = {  
                        currentPage: 1,  //当前页数
                        totalPages: data.pages==0?1:data.pages,  //总页数
                        size:"normal",  
                        alignment:"center",  
                        itemTexts: function (type, page, current) {  
                        switch (type) {  
                            case "first":  
                            return "第一页";  
                            case "prev":  
                            return "前一页";  
                            case "next":  
                            return "后一页";  
                            case "last":  
                            return "最后页";  
                        case "page":  
                        return  page;  
                }                 
            },  
            onPageClicked: function (e, originalEvent, type, page) {  
            	var sysmptom = $("#textInput").val(); //取内容
            	buildTable(sysmptom,page,PAGESIZE);//默认每页最多10条
            }  
         }             	           
         $('#bottomTab').bootstrapPaginator("setOptions",newoptions); //重新设置总页面数目
         var dataList = data.dataList;
         $("#tableBody").empty();//清空表格内容
         if (dataList.length > 0 ) {
             $(dataList).each(function(){//重新生成
             	    $("#tableBody").append('<tr>');
                    $("#tableBody").append('<td>' + '<input type="checkbox" value="'+this.pathology_id+'" name="check"><br>' + '</td>');
                    $("#tableBody").append('<td>' + this.pathology_id + '</td>');
                    $("#tableBody").append('<td>' + this.p_name + '</td>');
                    $("#tableBody").append('<td>' + this.sysmptom.substring(0,20) + '</td>');
                    $("#tableBody").append('<td>' + this.pintroduce.substring(0,20) + '</td>');
                    $("#tableBody").append('<td>' + this.medical_use.substring(0,20) + '</td>');
                    $("#tableBody").append('<td>' + this.matters_Needing_Attention.substring(0,20) + '</td>');                   
                    $("#tableBody").append('</tr>');
             	    });  
             	    } else {             	            	
             	          $("#tableBody").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');
             	    }
             	    }else{
             	          alert(data.errorMsg);
             	            }
             	      },
             	        error: function(e){
             	           alert("查询失败:" + e);
             	        }
             	    });
               });
        }
        
        //渲染完就执行
        $(function() {
        	
        	//生成底部分页栏
            $('#bottomTab').bootstrapPaginator(options);     
        	
        	buildTable("",1,10);//默认空白查全部
        	
            //创建结算规则
            $("#queryButton").bind("click",function(){
            	var sysmptom = $("#textInput").val();	
            	buildTable(sysmptom,1,PAGESIZE);
            });
        });
        
        //对复选框进行操作
        $(function(){ 
        	$('#delete').click(function(){
        		var text=null;
    			text = $("input:checkbox[name='check']:checked").map(function(index,elem) {
    	            return $(elem).val();
    	        }).get().join(',');
    			var s=new Array();
    			s=text.split(",");
    			if(s.length>1){	
    			alert("只能选择一组数据删除");
    			return;
    			}
    			if(text){
    			window.location.href="pathology_delete?pathology_id="+text;
    			}
    	       // alert("选中的checkbox的值为："+text);
    		});
        	$('#update').click(function(){
        		var text=null;
        		text = $("input:checkbox[name='check']:checked").map(function(index,elem) {
    	            return $(elem).val();
    	        }).get().join(',');
    			var s=new Array();
    			s=text.split(",");
    			if(s.length>1){	
    			alert("只能选择一组数据修改");
    			return;
    			}
    			if(text){
    				
    			window.open("pathology_show?pathology_id="+text);
    			}
        	});
        	$('#add').click(function(){
        		window.location.href="pathology_toAdd";
        	});
        });
    </script>

</head>
<body>

	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="breadcrumb">
				<li>
					 <a href="main_web">主页/</a>
				</li>
				<li class="active">
					病症显示
				</li>
			</ul>
		</div>
	</div>
</div>
	<div id = "queryDiv">
		<input id = "textInput" type="text" placeholder="请输入症状" >
		<button id = "queryButton" class="btn btn-primary" type="button">查询</button>
		<input type="button" value="查看" id="update" class="btn btn-primary">
	</div>
	<form id="form1">
		<table class="table table-bordered" id = 'tableResult'>
			<thead>
				<tr>
					<th>选择</th>
					<th>序号</th>
					<th>名称</th>
					<th>症状</th>
					<th>介绍</th>
					<th>药物</th>
					<th>注意事项</th>
				</tr>
			</thead>
			<tbody id="tableBody">
			</tbody>
		</table>
		<!-- 底部分页按钮 -->
		<div id="bottomTab"></div>
	</form>
	
</body>
</html>