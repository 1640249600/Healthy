<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DoctorXinXi.jsp' starting page</title>
    
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
		               	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" id="openAdd">添加</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" id="openEdit">修改</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" id="remove">删除</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" id="reload">刷新</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" id="save">保存</a>
		        	</div>
		           
		        </div>
		        <!-- End of toolbar -->
		        <table id="DCXinTab"></table>
    
			</div>
</div>
<!-- Begin of easyui-dialog -->
<div id="DCXin_win" class="easyui-window" title="添加医生" style="width:700px;height:500px;"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    <form method="post" enctype="multipart/form-data" id="uploadForm">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		
    		<tr>
    			
    			<th style="width:300px;">姓名</th>
    			<td style="width:300px;">
    				<input type="text" name="name"/>	
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:300px;">头像</th>
    			<td style="width:300px;">
    				<input type="file" name="photo"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:300px;">科室</th>
    			<td style="width:300px;">
    				<select name="deptid">					
					<option  value="1" >男</option>
					<option  value="0" >女</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:300px;">专长</th>
    			<td>
    				<select name="sid">					
					<option  value="1" >男</option>
					<option  value="0" >女</option>					
					</select>
    			</td>
    		</tr>
    		
    		<tr>
    			<th style="width:300px;">留言咨询费用</th>
    			<td style="width:300px;">
    				<input type="text" name="liuprice"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:300px;">支付宝账号</th>
    			<td style="width:300px;">
    				<input type="text" name="zfprice"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:300px;">简介</th>
    			<td style="width:300px;">
    				<input type="text" name="jianjie"/>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:300px;">电话咨询费用</th>
    			<td style="width:300px;">
    				<input type="text" name="telprice"/>	
    			</td>   			
    		</tr>
    		<tr>
    			<th style="width:300px;">医生身份</th>
    			<td style="width:300px;">
    				<select name="iid">					
					<option  value="1" >男</option>
					<option  value="0" >女</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:300px;">搜索标签</th>
    			<td style="width:300px;">
    				<input type="text" name="searchlable"/>	
    			</td>   			
    		</tr>
    		<tr>
    			<th style="width:300px;">状态</th>
    			<td style="width:300px;">
    				<select name="zid">					
					<option  value="1" >已使用</option>
					<option  value="0" >暂停使用</option>					
					</select>
    			</td> 			
    		</tr>
    		<tr>
    			<th style="width:300px;">是否加入1元义诊</th>
    			<td style="width:300px;">
    				<select name="yizhen">					
					<option  value="1" >是</option>
					<option  value="0" >否</option>					
					</select>
    			</td> 			
    		</tr>
    		<tr>
    			<td style="width:300px;" align="center">
    				<input type="button" value="保存" id="addDocXin"/>
    			</td>
    			<td style="width:300px;">
    				<input type="button" value="取消" id="addDocXinQ"/>
    			</td>
    		</tr>
    	</table>    
    </form></div>
<div id="DCXinUP_win" class="easyui-window" title="修改医生信息" style="width:900px;height:300px;"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    
    </div>
</body>
<script type="text/javascript">
  		$(function(){
  			$("#DCXinTab").datagrid({
  				url:"getXinDoctor",
  				columns:[[
  					{field:'xxxxxx',width:50,checkbox:true},
  					{field:'did',title:'账号',width:100,height:40,align:'center'},
  					{field:'name',title:'姓名',width:100,height:40,align:'center'},
  					{field:'photo',title:'头像',width:100,align:'center',
	  					 formatter: function(value,row,index){
					    	return '<img width="60px" height="30px" border="0" src='+value+'/>';  
						}  
					},
  					{field:'dname',title:'科室',width:100,height:40,align:'center'},
  					{field:'special',title:'专长',width:100,height:40,align:'center'},
  					{field:'state',title:'状态',height:40,width:100,align:'center'},
  					{field:'position',title:'医生身份',width:100,height:40,align:'center'},
  					{field:'searchlable',title:'搜索标签',width:100,height:40,align:'center'},
  					{field:'tjtime',title:'添加时间',width:100,height:40,align:'center'},
  					
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
  			
  				$("#DCXin_win").window("open");
  					
  			});
  			//添加
  			$("#addDocXin").click(function(){
  				var formData = new FormData($("#uploadForm")[0]);  
					$.ajax({
						url : 'doctorXinImport',
						type : 'post',
						data : formData,
						dataType : 'json',
						cache : false,
						contentType : false,
						processData : false,
			
						success : function(data) {
							if(data == true){
								$.messager.alert({
					        	title:'提示消息',
					        	msg:"添加成功",
					        	timeout:3000,
					        	showType:'slide'
					        	});
							}else{
								$.messager.alert({
					        	title:'提示消息',
					        	msg:"添加失败",
					        	timeout:3000,
					        	showType:'slide'
					        	});
							}
						$('#DCXinTab').datagrid('unselectAll');
						// 关闭窗口
						$("#DCXin_win").window("close");
						// 表格重新加载
						$("#DCXinTab").datagrid("reload");
						}
					});
						
  			
  			
  			
  			});
  			$("#addDocXin").click(function(){
  						$('#DCXinTab').datagrid('unselectAll');
						// 关闭窗口
						$("#DCXin_win").window("close");
						// 表格重新加载
						$("#DCXinTab").datagrid("reload");
  			});
  			
  			
  			//删除
  			$("#remove").click(function(){
					var arr =$('#DCXinTab').datagrid('getSelections');
					
							if(arr.length < 1){
								$.messager.alert({
									title:'提示信息!',
									msg:'必須选择一行及以上数据进行刪除!'
										});
							}else{
							$.messager.confirm('提示信息' , '确认删除?' , function(r){
									if(r){
											var ids = '';
											for(var i =0 ;i<arr.length;i++){
												ids += arr[i].did + ',' ;
											}
											alert(ids);
											ids = ids.substring(0 , ids.length-1);
											$.post('<%=path%>/doctorDel' , {did:ids} , function(result){
												
												if(result == true){
													$.messager.alert({
										        	title:'提示消息',
										        	msg:"添加成功",
										        	timeout:3000,
										        	showType:'slide'
										        	});
												}else{
													$.messager.alert({
										        	title:'提示消息',
										        	msg:"添加失败",
										        	timeout:3000,
										        	showType:'slide'
										        	});
												}
												//1 刷新数据表格 
												$('#DCXinTab').datagrid('reload');
												//2 清空idField   
												$('#DCXinTab').datagrid('unselectAll');
												//3 给提示信息 
											});
									} else {
										
										//2 清空idField   
									$('#DCXinTab').datagrid('unselectAll');
									}
							});
							
							
							}
										
			});
  			
  			
  			//保存
  			$("#save").click(function(){
				 $.ajax({
						type: 'post' ,
						url: "getXinBiaoDoctor",
						data:null,
						dataType:'json' ,
						cache : false,
						contentType : false,
						processData : false,
						success:function(result){ 
					    	if(result == true){
							    	
						        $.messager.alert({
						        	title:'提示消息',
						        	msg:"倒表成功",
						        	timeout:3000,
						        	showType:'slide'
						        	});
								  
							}else{
								$.messager.alert({
						    	    title:'提示消息',
						        	msg:"倒表失败",
						        	timeout:3000,
						        	showType:'slide'
						        	});
							}
						}
					});
  			});
		});
</script>
</html>

