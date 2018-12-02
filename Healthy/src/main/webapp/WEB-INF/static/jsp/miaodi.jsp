<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'miaodi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="<%=path %>/static/js/jquery-1.8.0.min.js"></script>

  </head>
  
  <body>
   	<form id="miaodi" method="post">
   		<input type="text" name="tel" id="tel"/>   
    	<input type="button" id="btn" value="获取验证码"/><br/>
    	请输入要修改的密码:<input type="text" name="password"/><br/>
    	<input type="text" name="yanzheng"/><br/>
    	<input type="text" name="mi" id="mi"/>
    	
    	<input type="button" id="btn_edit" value="修改"/><br/>
    </form>
    
    <script type="text/javascript">
   	 	$('#btn').click(function(){
   	 	
    			 $.ajax({
						type: 'post' ,
						url: "xgMima",
						cache:false ,
						data:$('#miaodi').serialize() ,
						dataType:'json' ,
						success:function(result){ 
				    		$('#mi').val(result)
				    		alert(result);
					        
					     }
				    });    			 			
    	});
    	
    	$('#btn_edit').click(function(){
   	 	
    			 $.ajax({
						type: 'post' ,
						url: "xgMimaEdit",
						cache:false ,
						data:$('#miaodi').serialize() ,
						dataType:'json' ,
						success:function(data){ 
				    		
					        
				    			alert(data.result)
				    		
					     }
				    });    			 			
    	});
    
    </script>
  </body>
</html>
