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
    <form method="post" enctype="multipart/form-data" id="uploadForm">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		
    		<tr>
    			
    			<th style="width:100px;">姓名</th>
    			<td>
    				<input type="text" name="name"/>	
    			</td>
    			<th style="width:100px;">联系方式</th>
    			<td>
    				<input type="text" name="tel"/>	
    			</td>
    		</tr>
    		<tr>
    			<th ROWSPAN="3" style="width:100px;">头像</th>
    			<td ROWSPAN="3" style="width:100px;">
    				<input type="file" name="photo"/>
    			</td>
    			<th style="width:100px;">性别</th>
    			<td style="width:100px;">
    				<select name="sex">					
					<option  value="1" >男</option>
					<option  value="0" >女</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:100px;">年龄</th>
    			<td style="width:100px;">
    				<input type="text" name="age"/>	
    			</td>
    		</tr>
    		<tr>
    			<th style="width:100px;">身份证编号</th>
    			<td>
    				<input type="text" name="idcard"/>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:100px;">留言咨询费用</th>
    			<td style="width:100px;">
    				<input type="text" name="liuprice"/>
    			</td>
    			<th style="width:100px;">资格证编号</th>
    			<td style="width:100px;">
    				<input type="text" name="zigecard"/>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:100px;">执行证编号</th>
    			<td style="width:100px;">
    				<input type="text" name="zhixingcard"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:100px;">执行证</th>
    			<td style="width:100px;">
    				<input type="file" name="zhixingpicture"/>
    			</td>
    			
    			<th style="width:100px;">资格证</th>
    			<td style="width:100px;">
    				
    				<input type="file" name="zigepicture"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:100px;">身份证</th>
    			<td style="width:100px;">
    				<input type="file" name="idcardpicture"/>
    					
    			</td>
    			
    			<th style="width:100px;">工作证</th>
    			<td style="width:100px;">
    				<input type="file" name="gongzuopicture"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:100px;">状态</th>
    			<td style="width:100px;">
    				<select name="shid">					
					<option  value="1" >已通过</option>
					<option  value="0" >未审核</option>					
					</select>
    			</td>
    			<td style="width:100px;"></td>
    			<td style="width:100px;">
    				<input type="button" value="保存" id="addDoc"/>
    			</td>
    		</tr>
    	</table>    
    </form></div>
<div id="DCUP_win" class="easyui-window" title="添加医生" style="width:600px;height:300px;"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    <form id="formAdd" method="post">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		
    		<tr>
    			
    			<th style="width:100px;">姓名</th>
    			<td>
    				<span id="name"></span>	
    			</td>
    		</tr>
    		<tr>
    			<th ROWSPAN="3" style="width:100px;">头像</th>
    			<td ROWSPAN="3" style="width:100px;">
    				<img src="/Healthy/static/images/hhhhhhh.png" width="80px" height="80px" id="photo"/>
    			</td>
    			<th style="width:100px;">性别</th>
    			<td style="width:100px;">
    				<span id="sex"></span>	
    			</td>
    		</tr>
    		<tr>
    			<th style="width:100px;">年龄</th>
    			<td style="width:100px;">
    				<span id="age"></span>	
    			</td>
    		</tr>
    		<tr>
    			<th style="width:100px;">身份证编号</th>
    			<td>
    				<span id="idcard"></span>	
    			</td>
    		</tr>
    		<tr>
    			<th style="width:100px;">留言咨询费用</th>
    			<td style="width:100px;">
    				<span id="liuprice"></span>	
    			</td>
    			<th style="width:100px;">资格证编号</th>
    			<td style="width:100px;">
    				<span id="zigecard"></span>	
    			</td>
    		</tr>
    		<tr>
    			<th style="width:100px;">执行证编号</th>
    			<td style="width:100px;">
    				<span id="zhixingcard"></span>	
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:100px;">执行证</th>
    			<td style="width:100px;">
    				<img src="/Healthy/static/images/hhhhhhh.png" width="80px" height="80px" id="zhixingpicture"/>	
    			</td>
    			
    			<th style="width:100px;">资格证</th>
    			<td style="width:100px;">
    				<img src="/Healthy/static/images/hhhhhhh.png" width="80px" height="80px" id="zhixingpicture"/>	
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:100px;">身份证</th>
    			<td style="width:100px;">
    				<img src="/Healthy/static/images/hhhhhhh.png" width="80px" height="80px" id="zhixingpicture"/>	
    			</td>
    			
    			<th style="width:100px;">工作证</th>
    			<td style="width:100px;">
    				<img src="/Healthy/static/images/hhhhhhh.png" width="80px" height="80px" id="zhixingpicture"/>	
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:100px;">状态</th>
    			<td style="width:100px;">
    				<select name="shid" id="zid">					
					<option  value="1" >已通过</option>
					<option  value="0" >未审核</option>					
					</select>
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
  			$("#addDoc").click(function(){
  				var formData = new FormData($("#uploadForm")[0]);  
					$.ajax({
						url : 'doctorImport',
						type : 'post',
						data : formData,
						dataType : 'json',
						cache : false,
						contentType : false,
						processData : false,
			
						success : function(data) {
							alert(data);
						}
					});
  			
  			
  			
  			});
  			
  		
  		
  		});
</script>
</html>
