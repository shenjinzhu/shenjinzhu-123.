<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>审核页面</title>
<link href="<%=request.getContextPath()%>/static/js/bootstrap//css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap-paginator.min.js"></script>
<style type="text/css">
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
            	var name = $("#textInput").val(); //取内容
            	buildTable(name,page,PAGESIZE);//默认每页最多10条
            }  
        }  

        //获取当前项目的路径
        var urlRootContext = (function () {
            var strPath = window.document.location.pathname;
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
            return postPath;
        })();
        
       
        //生成表格
        function buildTable(name,pageNumber,pageSize) {
        	 var url =  urlRootContext + "/doctor_verification"; //请求的网址
             var reqParams = {'name':name, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据
             $(function () {   
             	  $.ajax({
             	        type:"POST",
             	        url:url,
             	        data:reqParams,
             	        //async:false,
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
            	var name = $("#textInput").val(); //取内容
            	buildTable(name,page,PAGESIZE);//默认每页最多10条
            }  
         }             	           
         $('#bottomTab').bootstrapPaginator("setOptions",newoptions); //重新设置总页面数目
         var dataList = data.dataList;
         $("#tableBody").empty();//清空表格内容
         if (dataList.length > 0 ) {
             $(dataList).each(function(){//重新生成
             	    $("#tableBody").append('<tr>');
                    $("#tableBody").append('<td>' + '<input type="checkbox" value="'+this.doctor_id+'" name="check"><br>' + '</td>');
                    $("#tableBody").append('<td>' + this.doctor_id + '</td>');
                    $("#tableBody").append('<td>' + this.name + '</td>');
                    $("#tableBody").append('<td>' + this.major + '</td>');
                    $("#tableBody").append('<td>' + this.hospital + '</td>');
                    $("#tableBody").append('<td>' + this.workTime + '</td>');                    
                    $("#tableBody").append('<td>' + this.id + '</td>');   
                    $("#tableBody").append('<td>' + this.now + '</td>'); 
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
            	var name = $("#textInput").val();	
            	buildTable(name,1,PAGESIZE);
            });
        });
        
        //对复选框进行操作
        $(function(){ 
        	$('#look').click(function(){
        		var text=null;
    			text = $("input:checkbox[name='check']:checked").map(function(index,elem) {
    	            return $(elem).val();
    	        }).get().join(',');
    			var s=new Array();
    			s=text.split(",");
    			if(s.length>1){	
    			alert("只能选择一组数据");
    			return;
    			}
    			if(text){
    			window.location.href="look_docToBe?doctor_id="+text;
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
    				
    			window.location.href="update_doc_toBe?doctor_id="+text;
    			}
        	});
        });
    </script>

</head>
<body>
	<div id = "queryDiv">
		<input id = "textInput" type="text" placeholder="请输入姓名" >
		<button id = "queryButton" class="btn btn-primary" type="button">查询</button>
		<input type="button" value="查看" id="look" class="btn btn-primary">
		<input type="button" value="修改" id="update" class="btn btn-primary">
	</div>
	<form id="form1">
		<table class="table table-bordered" id = 'tableResult'>
			<thead>
				<tr>
					<th>选择</th>
					<th>序号</th>
					<th>姓名</th>
					<th>专业</th>
					<th>医院</th>
					<th>工作时间</th>
					<th>id</th>
					<th>当前状态</th>
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