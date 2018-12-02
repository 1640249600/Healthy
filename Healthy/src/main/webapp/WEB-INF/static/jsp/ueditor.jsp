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
	src="<%=path%>/static/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
	
	<script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/js/jquery-1.8.0.min.js"></script>
  </head>
  
  <body>
    <div id="ueditorDiv" >
    	<form action="javascript:void(0)" method="post">
    		
    		<script id="editor" type="text/plain" style="width:500px;height:200px;"></script>
    		<a id="save" href="" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"></a>
    		<a id="close" href="" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"></a>
    	</form>
    
    
    </div>
  </body>
  <script type="text/javascript">
  alert("ssss");
  		var ue = UE.getEditor("editor")
  </script>
</html>
