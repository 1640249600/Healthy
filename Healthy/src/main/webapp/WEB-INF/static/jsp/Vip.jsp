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
    <div data-options="region:'west',border:true,split:true," title="VIP管理" style="width:150px; padding:5px;">
        <ul id="wu-category-tree" class="easyui-tree"></ul>
    </div>
    <div data-options="region:'center',border:false">
    	<!-- Begin of toolbar -->
        <div id="wu-toolbar">
            <div class="wu-toolbar-button">
               	<a href="#" class="easyui-linkbutton" iconCls="icon-add" id="openAdd" plain="true">添加</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" id="openEdit" plain="true">修改</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" id="remove" plain="true">删除</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" id="cancel1" plain="true">取消</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" id="reload2" plain="true">刷新</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-print" id="openAdd3" plain="true">帮助</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-help" id="openEdit4" plain="true">撤销</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-undo" id="remove5" plain="true">重做</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-redo" id="cancel6" plain="true">总计</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-sum" id="reload7" plain="true">提示</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-back" id="reload8" plain="true">保存</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-tip" id="reload9" plain="true">剪切</a>
        	</div>
           
        </div>
        <!-- End of toolbar -->
        <table id="VIPTab"></table>
    </div>
</div>
<!-- Begin of easyui-dialog -->
<div id="VIP_win" class="easyui-window" title="添加VIP" style="width:600px;height:200px;margin-top:50px"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    <form id="formAdd" method="post">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		<tr>
    			<td>员工职责</td>
    			<td>
    				<input class="textbox" id="sChannel2" style="width:180px" maxLength=50 name="job"/>
    			</td>
    		</tr>
    		<tr>
    			<td>员工名称</td>
    			<td>
    				<input class="textbox" id="sChannel2" style="width:180px" maxLength=50 name="grade"/>
    			</td>
    		</tr>
    		<tr>
    			<td>状态</td>
    			<td>
    				<select name="zid" class=text>					
					<option  value="0" >已使用</option>
					<option  value="0" >暂停使用</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<td rowspan=2>
					<button id="customerBtn" type="button">保存</button>
				</td>
    		</tr>
    	</table>    
    </form></div>
  </body>
<script type="text/javascript">
  		$(function(){
  			$("#VIPTab").datagrid({
  				url:"findAll",
  				columns:[[
  				
  					{field:'grade',title:'会员',width:200,align:'center'},
  					{field:'state',title:'状态',width:200,align:'center'},
  					{field:'xxxxx',title:'操作',width:200,align:'center',
  						formatter:function(value,row,index){
  							return "<a href='' id='upadate'>修改</a>|<a href='' id='delete'>删除</a>";
  						}
  					}
  				]],
  				//显示斑马线效果
  				striped:true,
  				//一页记录数
  				pageSize:3,
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
	  	
	  			$("#VIP_win").window("open");	  	
	  	});	
	  	
  		$("#customerBtnQ").click(function(){
				// 提交数据到Action
				 alert("xxxxxxxx");  
				$('#formAdd').form('submit', {    
				    url:"customer_save",
				         
				    success:function(data){    
				        // data是字符串类型
				        // "alert('')"
				        var jsonData = eval("("+data+")");
				        $.messager.show({
				        	title:'提示消息',
				        	msg:jsonData.msg,
				        	timeout:3000,
				        	showType:'slide'
				        });
				        
				     	// 关闭窗口
						$("#VIP_win").window("close");
						// 表格重新加载
						$("#VIPTab").datagrid("reload");
				    }    
				}); 
			});
			$("#customerBtnQ").click(function(){
				$("#VIP_win").window("close");
			});
  		});
</script>
</html>
