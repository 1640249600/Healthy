<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/icon.css" />
	<script type="text/javascript" src="<%=path %>/static/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="wu-header" data-options="region:'north',border:false,split:true">
    	<div class="wu-header-left">
        	<h1>我爱健康</h1>
        </div>
        <div class="wu-header-right">
        	<p><strong class="easyui-tooltip" title="2条未读消息"><span>simon</span></strong>，欢迎您！</p>
            <p><a href="#">网站首页</a>|<a href="#">支持论坛</a>|<a href="#">帮助中心</a>|<a href="#">安全退出</a></p>
        </div>
    </div>
   
   
   	<!-- center -->
    <div id="cc" class="easyui-layout" fit="true">   
    <!-- //左边框 -->
	    <div data-options="region:'north',title:'导航菜单',split:false" style="height:100px;width:150px"></div>   
	    <div data-options="region:'west',title:'服务管理',split:false" style="width:100px;width:150px">
	    	<div id="aa" class="easyui-accordion" fit="true" >   
			    <div title="VIP管理" data-options="iconCls:'icon-reload',selected:true" style="overflow:auto;padding:10px;">   
			         <a href="<%=path %>/vip" class="menuA">客户管理</a>
			         
			    </div>   
			    <div title="会员管理" data-options="iconCls:'icon-reload'" style="padding:10px;">   
			         <a href="02_layout/VIP.jsp" class="menuA">会员管理</a>
			    </div>   
			    <div title="联系人管理" data-options="iconCls:'icon-reload'" style="padding:10px;">   
			          <a href="02_layout/Lianxi.jsp" class="menuA">联系人管理</a>
			    </div>   
			</div>  
	    </div>   
	    <div data-options="region:'center'" fit="true">
		    <div id="tt" class="easyui-tabs" fit="true">   
			    <div title="管理" data-options="closable:true" style="padding:20px;display:none;">   
			        tab1    
			    </div>   
			   
			  
			</div>  	    
	    </div>   
	</div> 	 
</body>
  
<script type="text/javascript">
  		$(function(){
  			$(".menuA").click(function(){
  				//获得超链接中的文本内容
  				var wen = $(this).html();
  				//获得请求路径
  				var url = $(this).attr("href");
  				//创建选项卡
  				createTabs(wen,url);
  				//让超链接不跳转
  				return false;	  			
  			});
  			//创建选项卡
  		function createTabs(wen,url){
  			var falg = $("#tt").tabs("exists",wen);
  				if(falg){  				
	  				//已经存在该选项卡
	  				$("#tt").tabs("select",wen)
	  			}else{
	  			//不存在该选项卡
	  				$("#tt").tabs("add",{
	  					title:wen,
	  					content:createUrl(url),
	  					closable:true,
	  					fit:true
	  				})
	  			
	  			}	 		
  		}	
  		function createUrl(url){
  		
  			return "<iframe src='"+url+"' style='border: 0;width: 80%;height: 80%;'></iframe>"
  		}
  			
  		
  });
  	
  
</script>
</html>



