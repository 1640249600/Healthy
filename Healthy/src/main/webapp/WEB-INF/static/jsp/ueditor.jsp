<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ueditor.jsp' starting page</title>
    
   
   
	<script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/ueditor1_4_3/ueditor.config.js"></script>
	 
	<script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/ueditor1_4_3/ueditor.all.min.js"></script>
	
	 <script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/js/jquery-1.8.0.min.js"></script>
	
	
	<script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
	
	
	
	 
   	<link rel="stylesheet" type="text/css" href="<%=path %>/static/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/icon.css" />
	
	<script type="text/javascript" src="<%=path %>/static/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="<%=path %>/static/js/jquery-1.8.0.min.js"></script>
  </head>
  
  <body>
  	<div id="xianshi"></div>
  	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-tip" id="bianji">编辑</a>
  	
  	
  
    <div style="display:none" id="editorDiv">
    	<form action="javascript:void(0)" method="post">
    		
    		<script id="editor" type="text/plain" style="width:500px;height:200px;"></script>
    			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" id="openAdd">添加</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" id="openEdit">取消</a>
	    </form>
    </div>
  </body>
  <script type="text/javascript">
  
  		var ue = UE.getEditor("editor");
  		
  		$("#bianji").click(function(){
  		
  				$("#editorDiv").show();
  		
  		
  		});
  			$("#openAdd").click(function(){
		  		var arr = [];
		       
		        arr.push(UE.getEditor('editor').getContent());
		        $("#xianshi").html(arr.join("\n"));
		        $("#editorDiv").hide();
  			});
  			
  			$("#openEdit").click(function(){
		  		$("#editorDiv").hide();
  			});
  </script>
</html>
