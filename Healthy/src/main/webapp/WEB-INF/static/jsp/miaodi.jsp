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
	
	
	<link href="<%=path %>/static/css/default.css" rel="stylesheet" type="text/css" />
	<!--必要样式-->
    <link href="<%=path %>/static/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/static/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/static/css/loaders.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/static/js/jquery-1.8.3.js" rel="stylesheet" type="text/css" />
  	<link href="<%=path %>/static/layui/css/layui.css" rel="stylesheet" type="text/css" />
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="<%=path %>/static/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src='<%=path %>/static/js/stopExecutionOnTimeout.js?t=1'></script>
    <script src="<%=path %>/static/layui/layui.js" type="text/javascript"></script>
    <script src="<%=path %>/static/js/Particleground.js" type="text/javascript"></script>
    <script src="<%=path %>/static/js/Treatment.js" type="text/javascript"></script>
    <script src="<%=path %>/static/js/jquery.mockjax.js" type="text/javascript"></script>
  </head>
  <body>
  
  <form id="miaodi"  method="post" name="system" action="#">
    <div class='login'>
	  <div class='login_title'>
	    <span>忘记密码</span>
	  </div>
	  <div class='login_fields'>
	    <div class='login_fields__user'>
		      <div class='icon'>
		        <img alt="" src='<%=path %>/static/images/user_icon_copy.png'>
		      </div>
	      <input id="tel" name="tel" style="width: 400px;" placeholder='电话' maxlength="16" type='text' />
		        <div class='validation'>
		          <img alt="" src='<%=path %>/static/images/tick.png'>
		        </div>
	    </div>
	    
	    <div class='login_fields__password'>
		      <div class='icon'>
		        <img alt="" src='<%=path %>/static/images/lock_icon_copy.png'>
		      </div>
	      		 <input type="button" id="btn" value="获取验证码" />	      
	    </div>
	    
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='<%=path %>/static/images/lock_icon_copy.png'>
	      </div>
	      		 <input name="password" id="password"  placeholder='请输入要修改的密码' style="width: 400px;" maxlength="16" type='text'  />
	      <div class='validation'>
	        <img alt="" src='<%=path %>/static/images/key.png'>
	      </div>
	      
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='<%=path %>/static/images/lock_icon_copy.png'>
	      </div>
	      		 <input name="yanzheng" id="yanzheng"  placeholder='请输入验证码' style="width: 400px;" maxlength="16" type='text' />
	      		<input type="hidden" name="mi" id="mi"/>
	      <div class='validation'>
	      
    	
	        <img alt="" src='<%=path %>/static/images/key.png'>
	      </div>
	      
	    </div>
	   
	    
	    
	   
	    <div class='login_fields__submit'>
	      <input type='button' value='修改' id="btn_edit">
	    </div>
	  </div>
	  
	</div>
	
	
	</form>

    
    
  </body>
  
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
				    			alert(data.result);
				    			location.href="<%=path%>/Login"
				    		
					     }
				    });    			 			
    	});
    	
    	
    	
    	
    	
		
	    //粒子背景特效
	    $('body').particleground({
	        dotColor: '#E8DFE8',
	        lineColor: '#133b88'
	    });
	    
		
    
    </script>
</html>
