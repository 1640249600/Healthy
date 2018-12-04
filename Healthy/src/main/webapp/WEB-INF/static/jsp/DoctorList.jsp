<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
    <title>My JSP 'DoctorList.jsp' starting page</title>
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
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" id="reload" plain="true">刷新</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" id="save" plain="true">保存</a>
		        	</div>
		           
		        </div>
		        <!-- End of toolbar -->
		        <table id="DCTab"></table>
    
			</div>
</div>
<!-- Begin of easyui-dialog -->
<div id="DC_win" class="easyui-window" title="添加医生" style="width:900px;height:300px;"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    <form method="post" enctype="multipart/form-data" id="uploadForm">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		
    		<tr>
    			
    			<th style="width:200px;">姓名</th>
    			<td>
    				<input type="text" name="name"/>	
    			</td>
    			<th style="width:200px;">联系方式</th>
    			<td>
    				<input type="text" name="tel"/>	
    			</td>
    		</tr>
    		<tr>
    			<th ROWSPAN="4" style="width:200px;">头像</th>
    			<td ROWSPAN="4" style="width:200px;">
    				<input type="file" name="photo"/>
    			</td>
    			<th style="width:200px;">性别</th>
    			<td style="width:200px;">
    				<select name="sex">					
					<option  value="1" >男</option>
					<option  value="0" >女</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:200px;">年龄</th>
    			<td style="width:200px;">
    				<input type="text" name="age"/>	
    			</td>
    		</tr>
    		<tr>
    			<th style="width:200px;">身份证编号</th>
    			<td>
    				<input type="text" name="idcard"/>
    			</td>
    		</tr>
    		<tr>
    		</tr>
    		<tr>
    			<th style="width:200px;">留言咨询费用</th>
    			<td style="width:200px;">
    				<input type="text" name="liuprice"/>
    			</td>
    			<th style="width:200px;">资格证编号</th>
    			<td style="width:200px;">
    				<input type="text" name="zigecard"/>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:200px;">执行证编号</th>
    			<td style="width:200px;">
    				<input type="text" name="zhixingcard"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:200px;">执行证</th>
    			<td style="width:200px;">
    				<input type="file" name="zhixingpicture"/>
    			</td>
    			
    			<th style="width:200px;">资格证</th>
    			<td style="width:200px;">
    				
    				<input type="file" name="zigepicture"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:200px;">身份证</th>
    			<td style="width:200px;">
    				<input type="file" name="idcardpicture"/>
    					
    			</td>
    			
    			<th style="width:200px;">工作证</th>
    			<td style="width:200px;">
    				<input type="file" name="gongzuopicture"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:200px;">状态</th>
    			<td style="width:200px;">
    				<select name="shid">					
					<option  value="1" >已通过</option>
					<option  value="0" >未审核</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			
    			<td style="width:200px;"></td>
    			<td style="width:200px;">
    				<input type="button" value="保存" id="addDoc"/>
    			</td>
    			<td style="width:200px;"></td>
    			<td style="width:200px;">
    				<input type="button" value="取消" id="addDocQ"/>
    			</td>
    		</tr>
    	</table>    
    </form></div>
<div id="DCUP_win" class="easyui-window" title="修改医生信息" style="width:900px;height:300px;"
    data-options="iconCls:'icon-save',mpdal:true,closed:true">
    <form id="formUP" method="post" enctype="multipart/form-data">
    	<table cellSpacing=0 cellPadding=5 border=0>
    		
    		<tr>
    			
    			<th style="width:200px;">姓名</th>
    			<td>
    				<input type="hidden" name="did" id="did"/>	
    				<input type="text" name="name" id="name"/>	
    			</td>
    			<th style="width:200px;">联系方式</th>
    			<td>
    				<input type="text" name="tel" id="tel"/>	
    			</td>
    		</tr>
    		<tr>
    			<th ROWSPAN="4" style="width:100px;">头像</th>
    			<td ROWSPAN="4" style="width:100px;">
    				<img width="60px" height="60px" border="0" src='' id="photo"/><br/>
    				<input type="hidden" name="photo1"/>
    				修改:<input type="file" name="photo" />
    			</td>
    			<th style="width:200px;">性别</th>
    			<td style="width:200px;">
    				<select name="sex" id="sex">					
					<option  value="1" >男</option>
					<option  value="0" >女</option>					
					</select>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:200px;">年龄</th>
    			<td style="width:200px;">
    				<input type="text" name="age" id="age"/>	
    			</td>
    		</tr>
    		<tr>
    			<th style="width:200px;">身份证编号</th>
    			<td>
    				<input type="text" name="idcard" id="idcard"/>
    			</td>
    		</tr>
    		<tr>
    		</tr>
    		<tr>
    			<th style="width:200px;">留言咨询费用</th>
    			<td style="width:200px;">
    				<input type="text" name="liuprice" id="liuprice"/>
    			</td>
    			<th style="width:200px;">资格证编号</th>
    			<td style="width:200px;">
    				<input type="text" name="zigecard" id="zigecard"/>
    			</td>
    		</tr>
    		<tr>
    			<th style="width:200px;">执行证编号</th>
    			<td style="width:200px;">
    				<input type="text" name="zhixingcard" id="zhixingcard"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:200px;">执行证</th>
    			<td style="width:200px;">
    				<img width="60px" height="60px" border="0" src='' id="zhixingpicture"/><br/>
    				修改:<input type="file" name="zhixingpicture"/>
    				<input type="hidden" name="zhixingpicture1"/>
    			</td>
    			
    			<th style="width:200px;">资格证</th>
    			<td style="width:200px;">
    				<img width="60px" height="60px" border="0" src='' id="zigepicture"/><br/>
    				修改:<input type="file" name="zigepicture"/>
    				<input type="hidden" name="zigepicture1"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:200px;">身份证</th>
    			<td style="width:200px;">
	    			<img width="60px" height="60px" border="0" src='' id="idcardpicture"/><br/>
	    			修改:	<input type="file" name="idcardpicture"/>
	    			<input type="hidden" name="idcardpicture1"/>
    					
    			</td>
    			
    			<th style="width:200px;">工作证</th>
    			<td style="width:200px;">
	    			<img width="60px" height="60px" border="0" src='' id="gongzuopicture"/><br/>
	    			修改:	<input type="file" name="gongzuopicture"/>
	    			<input type="hidden" name="gongzuopicture1"/>
    			</td>
    			
    		</tr>
    		<tr>
    			<th style="width:200px;">状态</th>
    			<td style="width:200px;">
    				<select name="shid" id="shid">					
					<option  value="1" >已通过</option>
					<option  value="0" >未审核</option>					
					</select>
    			</td>
    			
    		</tr>
    		<tr>
	    		<td style="width:200px;"></td>
	    			<td style="width:200px;">
	    				<input type="button" value="修改" id="UpDoc"/>
	    			</td>
    			<td style="width:200px;"></td>
    			<td style="width:200px;">
    				<input type="button" value="取消" id="UpDocQ"/>
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
						}
					});
						$('#DCTab').datagrid('unselectAll');
						// 关闭窗口
						$("#DC_win").window("close");
						// 表格重新加载
						$("#DCTab").datagrid("reload");
  			
  			
  			
  			});
  			$("#addDocQ").click(function(){
  						$('#DCTab').datagrid('unselectAll');
						// 关闭窗口
						$("#DC_win").window("close");
						// 表格重新加载
						$("#DCTab").datagrid("reload");
  			});
  			
  			
  			//删除
			$("#remove").click(function(){
					var arr =$('#DCTab').datagrid('getSelections');
					
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
												$('#DCTab').datagrid('reload');
												//2 清空idField   
												$('#DCTab').datagrid('unselectAll');
												//3 给提示信息 
											});
									} else {
										
										//2 清空idField   
									$('#DCTab').datagrid('unselectAll');
									}
							});
							
							
							}
										
			});
  			
  		
  			//修改
			$("#openEdit").click(function(){
					var arr =$('#DCTab').datagrid('getSelections');
					
							if(arr.length > 1 || arr.length == 0){
								$.messager.alert({
									title:'提示信息!',
									msg:'必須选择一行数据进行修改!'		
								});
								//2 清空idField  
								 
								$('#DCTab').datagrid('unselectAll');
							}else if(arr.length == 1){									
								var ids = arr[0].did;
								
								$.ajax({
									type: 'post' ,
									url: "doctorUp",
									cache:false ,
									data:"did="+ids,
									dataType:'json',
									success:function(data){ 
							    		 	$("#did").val(data.did);
							    		 	$("#name").val(data.name);
							    		 	$("#tel").val(data.tel);
							    		 	$("#photo").attr("src",data.photo);
							    		 	$("#sex").val(data.sex);
							    		 	$("#age").val(data.age);
											$("#idcard").val(data.idcard);
											$("#liuprice").val(data.liuprice);
											$("#zigecard").val(data.zigecard);
											$("#zhixingcard").val(data.zhixingcard);
											$("#zhixingpicture").attr("src",data.zhixingpicture);
											$("#zigepicture").attr("src",data.zigepicture);
											$("#idcardpicture").attr("src",data.idcardpicture);
											$("#gongzuopicture").attr("src",data.gongzuopicture);
											$("#shid").val(data.shid);
											$("#DCUP_win").window("open");
											
								     }
							    });
							}
										
			});
			
			$("#UpDoc").click(function(){
				var formData = new FormData($("#formUP")[0]);  
				alert(formData);
					 $.ajax({
						type: 'post' ,
						url: "doctorUpdate",
						data:formData,
						dataType:'json' ,
						cache : false,
						contentType : false,
						processData : false,
						success:function(result){ 
					    	if(result == true){
							    	
								        $.messager.alert({
								        	title:'提示消息',
								        	msg:"修改成功",
								        	timeout:3000,
								        	showType:'slide'
								        	});
								  
							}else{
						    	
										$.meesager.alert({
											title:'提示消息' , 
											msg:"修改失败",
								        	timeout:3000,
								        	showType:'slide'
										});
								
					     	}
					     $('#DCTab').datagrid('unselectAll');
						     	// 关闭窗口
								$("#DCUP_win").window("close");
								// 表格重新加载
								$("#DCTab").datagrid("reload");
					     
						}
				    });
			
			
			
			
			});
			$("#UpDocQ").click(function(){
				$('#DCTab').datagrid('unselectAll');
				     	// 关闭窗口
						$("#DCUP_win").window("close");
						// 表格重新加载
						$("#DCTab").datagrid("reload");
			});
			$("#save").click(function(){
				 $.ajax({
						type: 'post' ,
						url: "saveExcel",
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
