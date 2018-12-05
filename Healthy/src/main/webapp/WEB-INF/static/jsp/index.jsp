<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>大手托小手健康守护系统</title>
	
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
			    <div title="服务管理" data-options="iconCls:'icon-application-cascade'" style="overflow:auto;padding:10px;">   
			         <ul class="easyui-tree wu-side-tree">
                    <li iconCls="icon-users"><a href="<%=path %>/vip" data-icon="icon-users" class="menuA">VIP管理</a></li>
                    <li iconCls="icon-application-osx-error"><a href="<%=path %>/toEditor" data-icon="icon-application-osx-error" class="menuA">留言咨询管理</a></li>
               		<li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-cog" data-link="../jsp/temp/layout-3.html" iframe="0">平台医生电话咨询费用折扣</a></li>
               		<li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" data-link="../jsp/temp/layout-3.html" iframe="0">电话咨询管理</a></li>
               		<li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-cog" data-link="../jsp/temp/layout-3.html" iframe="0">平台医生咨询费用管理</a></li>		
                </ul>
                
			    </div>   
			    <div title="用户管理" data-options="iconCls:'icon-application-form-edit'" style="padding:10px;" data-link="<%=path %>/toOrder">   
			        <ul class="easyui-tree wu-side-tree">
			        <li iconCls="cart_full"><a href="<%=path %>/toOrder" class="menuA">订单管理</a></li>
                	<li iconCls="icon-chart-organisation"><a href="<%=path %>/toDoctorXinXi" class="menuA">医生信息管理</a></li>
                    <li iconCls="icon-users"><a href="<%=path %>/toDoctorList" class="menuA">医生资料审核管理</a></li>
                    <li iconCls="comment_dull"><a href="<%=path %>/toUsers" class="menuA">用户信息管理</a></li>
                    </ul>
			    </div>
			    
			<div title="首页管理" data-options="iconCls:'icon-creditcards'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree"> 
                	<li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="../jsp/temp/layout-3.html" iframe="0">首页图片管理</a></li>
                    <li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-users" data-link="../jsp/temp/layout-3.html" iframe="0">免费自查管理</a></li>
                    <li iconCls="icon-user-group"><a href="javascript:void(0)" data-icon="icon-user-group" data-link="../jsp/temp/layout-3.html" iframe="0">搜索标签管理</a></li>
                    <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="../jsp/temp/layout-3.html" iframe="0">电话直播管理</a></li>
                    <li iconCls="icon-cog"><a href="<%=path %>/toDepartments" class="menuA">科室筛选管理</a></li>
                    <li iconCls="icon-application-osx-error"><a href="javascript:void(0)" data-icon="icon-application-osx-error" data-link="../jsp/temp/layout-3.html" iframe="0">专家特诊项目管理</a></li>
                	<li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" data-link="../jsp/temp/layout-3.html" iframe="0">健康预警项目管理</a></li>
                </ul>
            </div>   
			  
            <div title="系统管理" data-options="iconCls:'icon-cart'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-chart-organisation"><a href="javascript:void(0)" data-icon="icon-chart-organisation" data-link="../jsp/temp/layout-3.html" iframe="0">推送管理</a></li>
                    <li iconCls="icon-users"><a href="javascript:void(0)" data-icon="icon-users" data-link="../jsp/temp/layout-3.html" iframe="0">系统用户管理</a></li>
                    <li iconCls="icon-user-group"><a href="javascript:void(0)" data-icon="icon-user-group" data-link="../jsp/temp/layout-3.html" iframe="0">用户诉讼</a></li>
                    <li iconCls="icon-book"><a href="javascript:void(0)" data-icon="icon-book" data-link="../jsp/temp/layout-3.html" iframe="0">关于我们</a></li>
                    <li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" data-link="../jsp/temp/layout-3.html" iframe="0">版本更新管理</a></li>
                    <li iconCls="icon-application-osx-error"><a href="<%=path%>/toLoc" class="menuA">日志管理</a></li>
              		 <li iconCls="icon-cog"><a href="javascript:void(0)" data-icon="icon-cog" data-link="../jsp/temp/layout-3.html" iframe="0">纠纷投诉管理</a></li>
                	 <li iconCls="icon-application-osx-error"><a href="javascript:void(0)" data-icon="icon-application-osx-error" data-link="../jsp/temp/layout-3.html" iframe="0">角色管理</a></li>
               
                </ul>
            </div>
            <div title="联系我们" data-options="iconCls:'icon-chart-curve'" style="padding:5px;">  	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-chart-organisation"><a href="<%=path %>/toTelephone" data-icon="icon-chart-organisation" class="menuA">电话</a></li>
                    <li iconCls="icon-users"><a href="<%=path %>/toMingPian" data-icon="icon-users" class="menuA">名片</a></li>
                    <li iconCls="icon-user-group"><a href="<%=path %>/toMessage" data-icon="icon-user-group" class="menuA">微博</a></li>
                    <li iconCls="icon-book"><a href="<%=path %>/toWeChat" data-icon="icon-book" class="menuA">微信公众号</a></li>
                    <li iconCls="icon-cog"><a href="<%=path %>/toWifi" data-icon="icon-cog" class="menuA">WiFi</a></li>
                    <li iconCls="icon-application-osx-error"><a href="<%=path %>/toMp4" data-icon="icon-application-osx-error" class="menuA">视频导航</a></li>
                    <li iconCls="icon-application-osx-error"><a href="<%=path %>/toBaidu" data-icon="icon-application-osx-error" class="menuA">地图导航</a></li>
                </ul>
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



