<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
    <title>用户管理</title>
   	<link rel="stylesheet" type="text/css" href="<%=path %>/static/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/icon.css" />
	<script type="text/javascript" src="<%=path %>/static/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/locale/easyui-lang-zh_CN.js"></script>

  </head>
  
  <body>
    <div class="easyui-layout" data-options="fit:true">
    
    <div data-options="region:'center',border:false">
    	<!-- Begin of toolbar -->
        <div id="wu-toolbar">
            <div class="wu-toolbar-button">
               	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" id="openAdd" plain="true">添加</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" id="openEdit" plain="true">修改</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" id="remove" plain="true">删除</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="cancel1" plain="true">取消</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" id="reload" plain="true">刷新</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print" id="openAdd3" plain="true">打印</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-help" id="openEdit4" plain="true">撤销</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" id="remove5" plain="true">重做</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" id="cancel6" plain="true">总计</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-sum" id="reload7" plain="true">提示</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" id="reload8" plain="true">保存</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-tip" id="reload9" plain="true">剪切</a>
        	</div>
              <div class="wu-toolbar-search">
            <label>起始时间</label><input class="easyui-datebox" style="width:100px">
            <label>结束时间</label><input class="easyui-datebox" style="width:100px">
            <label>vip等级</label> 
            <select class="easyui-combobox" panelHeight="auto" style="width:100px">
                <option value="0">健康会员</option>
                <option value="1">基础会员</option>
                <option value="2">金卡会员</option>
                <option value="3">钻石卡会员</option>
                 <option value="3">白金卡会员</option>
            </select>
            <label>关键字</label><input class="wu-text" style="width:100px">
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" id="search">开始搜索</a>
        </div>
        </div>
        <!-- End of toolbar -->
        <table id="UserTab"></table>
    </div>
</div>
<!-- Begin of easyui-dialog -->
<div id="userAdd_win" class="easyui-window" title="添加用户" style="width:600px;height:200px;margin-top:50px"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    <form id="formAdd" method="post">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		<tr>
    			<td>用户账号</td>
    			<td>
    				<input class="textbox" style="width:180px" maxLength=50 name="id"/>
    			</td>
    		</tr>
    		<tr>
    			<td>用户名称</td>
    			<td>
    	
    				<input class="textbox" style="width:180px" maxLength=50 name="name"/>
    			</td>
    		</tr>
    		<tr>
    		   <td>
    				<select name="vid">					
					<option  value="1" >健康会员</option>
					<option  value="2" >基础会员</option>
					<option  value="3" >金卡会员</option>
					<option  value="4" >钻石卡会员</option>	
					<option  value="5" >白金卡会员</option>					
					</select>
    			</td>
    		</tr>	
    		<tr>
    			<td>用户电话</td>
    			<td>
    				<input class="textbox" style="width:180px" maxLength=50 name="telephone"/>
    			</td>
    		</tr>
    		<tr>
    			<td>用户日期</td>
    			<td>
    	
    				<input class="textbox" style="width:180px" maxLength=50 name="birthday"/>
    			</td>
    		</tr>
    		<tr>
    			<td>状态</td>
    			<td>
    				<select name="zid">					
					<option  value="1" >已使用</option>
					<option  value="0" >暂停使用</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<td>
					<button id="customerBtn" type="button">保存</button>
				</td>
				<td>
					<button id="customerBtnQ" type="button">取消</button>
				</td>
    		</tr>
    	</table>    
    </form>
</div>  
<div id="UserUpdate_win" class="easyui-window" title="修改信息" style="width:600px;height:200px;margin-top:50px"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    <form id="formUP" method="post">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		<tr>
    			<td>用户名称</td>
    			<td>
    				<input class="textbox" style="width:180px" maxLength=50 id="name" name="name"/>
    			</td>
    		</tr>
    		<tr>
    			<td>用户账号</td>
    			<td>
    				
    				<input class="textbox" id="id" style="width:180px" maxLength=50 name="id"/>
    			</td>
    		</tr>
    		    <tr>
    			<td>用户身份</td>
    			<td>
    				<select name="vid" id="vid">					
					<option  value="1" >健康会员</option>
					<option  value="2" >基础会员</option>
					<option  value="3" >金卡会员</option>
					<option  value="4" >钻石卡会员</option>	
					<option  value="5" >白金卡会员</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<td>状态</td>
    			<td>
    				<select name="zid" id="zid">					
					<option  value="1" >已使用</option>
					<option  value="0" >暂停使用</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<td>用户电话</td>
    			<td>
    				<input class="textbox" style="width:180px" maxLength=50 id="telephone" name="telephone"/>
    			</td>
    		</tr>
    		<tr>
    			<td>用户日期</td>
    			<td>
    	
    				<input class="textbox" style="width:180px" maxLength=50 id="birthday" name="birthday"/>
    			</td>
    		</tr>
    		<tr>
    			<td>
					<button id="upBtn" type="button">修改</button>
				</td>
				<td>
					<button id="upBtnQ" type="button">取消</button>
				</td>
    		</tr>
    		
    	</table>    
    </form></div>
  </body>
<script type="text/javascript">
  		$(function(){
  			$("#UserTab").datagrid({
  				url:"toLocList",
  				columns:[[
  					{field:'ck',width:50,checkbox:true},
  					{field:'id',title:'日志号',width:100,align:'center'},
  					{field:'name',title:'用户名',width:100,align:'center'},
  					{field:'dname',title:'医生昵称',width:200,align:'center'},
  					{field:'type',title:'日志类型',width:300,align:'center'},
  					{field:'synopisis',title:'日志状态',width:300,align:'center'},
  					{field:'time',title:'日志产生时间',width:300,align:'center'},
  					]],
  				idField:'id',//创建表格必须加上;
  				//显示斑马线效果
  				striped:true,
  				//一页记录数
  				pageSize:10,
  				//显示分页工具栏
  				pagination:true,
  				//初始化页数
  				pageNumber:1,
  				//分页工具条显示位置
  				pagePosition:"bottom",
  				//调整一页显示多少数据组件
  				pageList:[3,5,10]
 			
  			});
 });

 
</script>
</html>
