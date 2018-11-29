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
    
		    <div data-options="region:'center',border:false">
		    	<!-- Begin of toolbar -->
		        <div id="wu-toolbar">
		            <div class="wu-toolbar-button">
		               	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" id="openAdd" plain="true">添加</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" id="openEdit" plain="true">修改</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" id="remove" plain="true">删除</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" id="cancel1" plain="true">取消</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" id="reload" plain="true">刷新</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print" id="openAdd3" plain="true">帮助</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-help" id="openEdit4" plain="true">撤销</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" id="remove5" plain="true">重做</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" id="cancel6" plain="true">总计</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-sum" id="reload7" plain="true">提示</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" id="reload8" plain="true">保存</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-tip" id="reload9" plain="true">剪切</a>
		        	</div>
		           
		        </div>
		        <!-- End of toolbar -->
		        <table id="DCTab"></table>
    
			</div>
</div>
<!-- Begin of easyui-dialog -->
<div id="DC_win" class="easyui-window" title="添加医生" style="width:600px;height:300px;"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    <form id="formAdd" method="post">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		
    		<tr>
    			<td></td>
    			<td>
    				
    			</td>
    			<th>姓名</th>
    			<td>
    				<span id="name"></span>	
    			</td>
    		</tr>
    		<tr>
    			<th ROWSPAN="3">头像</th>
    			<td ROWSPAN="3">
    				<img src="" width="80px" height="80px" id="photo"/>
    			</td>
    			<th>性别</th>
    			<td>
    				<span id="sex"></span>	
    			</td>
    		</tr>
    		<tr>
    			<th>年龄</th>
    			<td>
    				<span id="age"></span>	
    			</td>
    		</tr>
    		<tr>
    			<th>身份证编号</th>
    			<td>
    				<span id="idcard"></span>	
    			</td>
    		</tr>
    	</table>    
    </form></div>

</body>
<script type="text/javascript">
  		$(function(){
  			$("#DCTab").datagrid({
  				url:"DCFindAll",
  				columns:[[
  					{field:'xxxxxx',width:50,checkbox:true},
  					{field:'did',title:'账号',width:100,height:40,align:'center'},
  					{field:'name',title:'姓名',width:100,height:40,align:'center'},
  					{field:'photo',title:'头像',width:100,align:'center',
	  					 formatter: function(value,row,index){
					    	return '<img width="60px" height="30px" border="0" src='+value+'/>';  
						}  
					},
  					{field:'sex',title:'性别',width:100,height:40,align:'center'},
  					{field:'tel',title:'联系方式',width:100,height:40,align:'center'},
  					{field:'liuprice',title:'留言咨询费用',height:40,width:100,align:'center'},
  					{field:'check',title:'状态',width:100,height:40,align:'center'},
  					{field:'tijiaotime',title:'提交时间',width:100,height:40,align:'center'},
  					
  				]],
  				idField:'did',//创建表格必须加上;
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
  			
  			$("#openAdd").click(function(){
  			
  				$("#DC_win").window("open");
  					
  			});
  			
  		
  		
  		});
</script>
</html>
