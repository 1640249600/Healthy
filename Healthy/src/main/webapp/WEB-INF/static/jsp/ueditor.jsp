<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>留言</title>
    
   
   
	<script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/ueditor1_4_3/ueditor.config.js"></script>
	 
	<script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/ueditor1_4_3/ueditor.all.min.js"></script>
	
	 <script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/js/jquery-1.8.0.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/wu.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/icon.css" />
	<script type="text/javascript" src="<%=path %>/static/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/locale/easyui-lang-zh_CN.js"></script>
	
	
	<script type="text/javascript" charset="utf-8" 
	src="<%=path%>/static/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>	
	<script type="text/javascript" src="<%=path %>/static/js/jquery.easyui.min.js"></script>
	
	<style>
		#title{
			height:100%;	
		}
	</style>
  </head>
  
  <body>
  <div id="title">
          <div id="wu-toolbar">
            <div class="wu-toolbar-button">
               	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" id="openAdd" plain="true">添加</a>
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
        </div>
       
 	 	<table id="UserTab"></table>
    <div style="display:none" id="editorDiv">
    	<form action="javascript:void(0)" method="post">
    		<script id="editor" type="text/plain" style="width:500px;height:200px;"></script>
    		   
    			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" id="openSave">保存</a>
	            <a href="javascript:;" class="easyui-linkbutton" iconCls="icon-edit" id="openEdit">取消</a>
	    </form>
    </div> 
  
</div>
<div id="adds"  class="easyui-window" title="添加信息" style="width:600px;height:500px"   
	        data-options="iconCls:'icon-reload',modal:true,closed:true">
  		<form id="formAdd"  title="添加留言">
  			<table>
    		<tr>
    			<td>日志编号</td>
    			<td>
    				<input class="textbox" style="width:180px" maxLength=50 name="id"/>
    			</td>
    		</tr>
    		<tr>
    			<td>用户名</td>
    			<td>
    				<input class="textbox" style="width:180px" maxLength=50 name="name"/>
    			</td>
    		</tr>
    		<tr>
    			<td>留言</td>
    			<td>
    				<input class="textbox" style="width:180px" maxLength=50 name="content" id="content"/>
    				 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-tip" id="bianji">编辑</a>
    			</td>
    		</tr>
    		<tr>
    			<td>日志生成时间</td>
    			<td>
    				<input class="textbox" style="width:180px" maxLength=50 name="time"/>
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
    	
    	</div>
    	
    	
    	
    	
    	
  </body>
  <script type="text/javascript">
  $(function(){
  			$("#UserTab").datagrid({
  				url:"toWorksList",
  				columns:[[
  					{field:'ck',width:50,checkbox:true},	
  					{field:'id',title:'账号',width:100,align:'center'},
  					{field:'name',title:'昵称',width:100,align:'center'},
  					{field:'content',title:'内容',width:200,align:'center'},
  					{field:'time',title:'时间',width:300,align:'center'},
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
  			//单击添加
  			$("#openAdd").click(function(){
  				$("#adds").dialog("open");
  			});
  			//百度编辑器
  		var ue = UE.getEditor("editor");
  		//点击编辑
  		$("#bianji").click(function(){
  				//编辑弹框出来
  				$("#editorDiv").dialog({
  					title:"编辑器",
  					modal:true
  				});
  		});
  		//点击保存
  			$("#openSave").click(function(){
		  		var arr = [];
		        arr.push(UE.getEditor('editor').getContent());
		        //存入数据到留言详情里面
		        $("#content").val(arr);
		       $("#editorDiv").dialog("close");		        
  			});
  			//点击取消
  			$("#openEdit").click(function(){
		  		$("#editorDiv").dialog("close");
  			});
  			//单击保存按钮
  			$("#customerBtn").click(function(){
  				//提交数据到action
  				alert("---");
  				$.ajax({
  					type:"post",
  					url:"toworkAdd",
  					data:$('#formAdd').serialize(),
  					dataType:"json",
  					success:function(result){
  					alert("------");
  						$.messager.alert({
  							title:'提示消息',
					        	msg:"添加成功",
					        	timeout:3000,
					        	showType:'slide'
  						});
  					},
  							error:function(result){
							$.meesager.alert({
								title:'提示消息' , 
								msg:"添加失败",
					        	timeout:3000,
					        	showType:'slide'
							});
						}
  				});
  				//关闭窗口
  				$("#add").window("close");
  				//表格重新加载
  				$("#UserTab").datagrid("reload");
  			});
  			//关闭
  			$("#customerBtnQ").click(function(){
  				$("#add").window("close");
  			});
  		});
  		
  </script>
</html>
