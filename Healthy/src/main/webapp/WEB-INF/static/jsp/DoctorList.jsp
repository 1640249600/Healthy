<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
    <title>My JSP 'VipBuy.jsp' starting page</title>
   	<link rel="stylesheet" type="text/css" href="<%=path %>/static/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/icon.css" />
	<script type="text/javascript" src="<%=path %>/static/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/locale/easyui-lang-zh_CN.js"></script>

  </head>
  
  	<body>
  		<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar-2">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">增加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove()" plain="true">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancel()" plain="true">取消</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="reload()" plain="true">刷新</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-print" onclick="openAdd()" plain="true">打印</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-help" onclick="openEdit()" plain="true">帮助</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="remove()" plain="true">撤销</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="cancel()" plain="true">重做</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-sum" onclick="reload()" plain="true">总计</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-back" onclick="reload()" plain="true">返回</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-tip" onclick="reload()" plain="true">提示</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="reload()" plain="true">保存</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cut" onclick="reload()" plain="true">剪切</a>
        </div>
          <div class="wu-toolbar-search">
            <label>开始关系</label><input class="easyui-datebox" style="width:100px">
            <label>结束时间</label><input class="easyui-datebox" style="width:100px">
            <label>用户类型</label> 
            <select class="easyui-combobox" panelHeight="auto" style="width:100px">
                <option value="0">健康会员</option>
                <option value="1">基础会员</option>
                <option value="2">金卡会员</option>
                <option value="3">钻石卡会员</option>
                 <option value="3">白金卡会员</option>
            </select>
            <label>关键字</label><input class="wu-text" style="width:100px">
            <a href="#" class="easyui-linkbutton" iconCls="icon-search">开始搜索</a>
        </div>
     </div>
</div>
    </body>
<script type="text/javascript">
  		
</script>
</html>
