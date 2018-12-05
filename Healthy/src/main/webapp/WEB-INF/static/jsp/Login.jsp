<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>登录界面</title>
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
  <form id="system"  method="post" name="system" action="#">
    <div class='login'>
	  <div class='login_title'>
	    <span>管理员登录</span>
	  </div>
	  <div class='login_fields'>
	    <div class='login_fields__user'>
	      <div class='icon'>
	        <img alt="" src='<%=path %>/static/images/user_icon_copy.png'>
	      </div>
	      <input name="name" id="name" placeholder='用户名' maxlength="16" type='text' autocomplete="off" value="simon	"/>
	        <div class='validation'>
	          <img alt="" src='<%=path %>/static/images/tick.png'>
	        </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='<%=path %>/static/images/lock_icon_copy.png'>
	      </div>
	      <input name="password" id="password" placeholder='密码' maxlength="16" type='text' autocomplete="off"><span id='pp'></span>
	      <div class='validation'>
	        <img alt="" src='<%=path %>/static/images/tick.png'>
	      </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='<%=path %>/static/images/key.png'>
	      </div>
	      <input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
	      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div class='validation' style="opacity: 1; right: -5px;top: -3px;">
          <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
	      </div>
	    </div>
	    <div class='login_fields__submit'>
	      <input type='button' value='登录' id="login">
	      <input type='button' value='忘记密码' id="wangji">
	    </div>
	    
	  </div>
	  <div class='success'>
	  </div>
	  <div class='disclaimer'>
	    <p>欢迎登陆后台管理系统</p>
	  </div>
	</div>
	<div class='authent'>
	  <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
        </div>
	  <p>认证中...</p>
	</div>
	</form>
	<div class="OverWindows"></div>
    
	<script type="text/javascript">
		var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
		var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
		//默认账号密码
		
		var truelogin = "simon";
		var truepwd = "123";
		
		var CodeVal = 0;
	    Code();
	    function Code() {
			if(canGetCookie == 1){
				createCode("AdminCode");
				var AdminCode = getCookieValue("AdminCode");
				showCheck(AdminCode);
			}else{
				showCheck(createCode(""));
			}
	    }
	    function showCheck(a) {
			CodeVal = a;
	        var c = document.getElementById("myCanvas");
	        var ctx = c.getContext("2d");
	        ctx.clearRect(0, 0, 1000, 1000);
	        ctx.font = "80px 'Hiragino Sans GB'";
	        ctx.fillStyle = "#E8DFE8";
	        ctx.fillText(a, 0, 100);
	    }
	    $(document).keypress(function (e) {
	        // 回车键事件  
	        if (e.which == 13) {
	            $('input[type="button"]').click();
	        }
	    });
	    //粒子背景特效
	    $('body').particleground({
	        dotColor: '#E8DFE8',
	        lineColor: '#133b88'
	    });
	    $('input[name="pwd"]').focus(function () {
	        $(this).attr('type', 'password');
	    });
	    $('input[type="text"]').focus(function () {
	        $(this).prev().animate({ 'opacity': '1' }, 200);
	    });
	    $('input[type="text"],input[type="password"]').blur(function () {
	        $(this).prev().animate({ 'opacity': '.5' }, 200);
	    });
	    $('input[name="login"],input[name="pwd"]').keyup(function () {
	        var Len = $(this).val().length;
	        if (!$(this).val() == '' && Len >= 5) {
	            $(this).next().animate({
	                'opacity': '1',
	                'right': '30'
	            }, 200);
	        } else {
	            $(this).next().animate({
	                'opacity': '0',
	                'right': '20'
	            }, 200);
	        }
	    });
	    var open = 0;
	    layui.use('layer', function () {
			var msgalert = '默认账号:' + truelogin + '<br/> 默认密码:' + truepwd;
    		var index = layer.alert(msgalert, { icon: 6, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });  
			layer.style(index, {
				color: '#777'
			}); 
	        //非空验证
	        $('input[type="button"]').click(function () {
	            var login = $('input[name="login"]').val();
	            var pwd = $('input[name="pwd"]').val();
	            var code = $('input[name="code"]').val();
	            if (login == '') {
	                ErroAlert('请输入您的账号');
	            } else if (pwd == '') {
	                ErroAlert('请输入密码');
	            } else if (code == '' || code.length != 4) {
	                ErroAlert('输入验证码');
	            } else {
	                //认证中..
	                fullscreen();
	                $('.login').addClass('test'); //倾斜特效
	                setTimeout(function () {
	                    $('.login').addClass('testtwo'); //平移特效
	                }, 300);
	                setTimeout(function () {
	                    $('.authent').show().animate({ right: -320 }, {
	                        easing: 'easeOutQuint',
	                        duration: 600,
	                        queue: false
	                    });
	                    $('.authent').animate({ opacity: 1 }, {
	                        duration: 200,
	                        queue: false
	                    }).addClass('visible');
	                }, 500);

	                //登陆
	                var JsonData = { login: login, pwd: pwd, code: code };
					//此处做为ajax内部判断
					var url = "";
					if(JsonData.login == truelogin && JsonData.pwd == truepwd && JsonData.code.toUpperCase() == CodeVal.toUpperCase()){
						url = "Ajax/Login";
					}else{
						url = "Ajax/LoginFalse";
					}
					
					
	                AjaxPost(url, JsonData,
	                                function () {
	                                    //ajax加载中
	                                },
	                                function (data) {
	                                    //ajax返回 
	                                    //认证完成
	                                    setTimeout(function () {
	                                        $('.authent').show().animate({ right: 90 }, {
	                                            easing: 'easeOutQuint',
	                                            duration: 600,
	                                            queue: false
	                                        });
	                                        $('.authent').animate({ opacity: 0 }, {
	                                            duration: 200,
	                                            queue: false
	                                        }).addClass('visible');
	                                        $('.login').removeClass('testtwo'); //平移特效
	                                    }, 2000);
	                                    setTimeout(function () {
	                                        $('.authent').hide();
	                                        $('.login').removeClass('test');
	                                        if (data.Status == 'ok') {
	                                            //登录成功
	                                            $('.login div').fadeOut(100);
	                                            $('.success').fadeIn(1000);
	                                            $('.success').html(data.Text);
												//跳转操作
												
	                                        } else {
	                                            AjaxErro(data);
	                                            Code();
	                                        }
	                                    }, 2400);
	                                })
	            }
	        })
	    })
	    var fullscreen = function () {
	        elem = document.body;
	        if (elem.webkitRequestFullScreen) {
	            elem.webkitRequestFullScreen();
	        } else if (elem.mozRequestFullScreen) {
	            elem.mozRequestFullScreen();
	        } else if (elem.requestFullScreen) {
	            elem.requestFullscreen();
	        } else {
	            //浏览器不支持全屏API或已被禁用  
	        }
	    }  
		if(ajaxmockjax == 1){
			$.mockjax({  
				url: 'Ajax/Login',  
				status: 200,  
				responseTime: 50,          
				responseText: {"Status":"ok","Text":"登陆成功<br /><br />欢迎回来"}  
			}); 
			$.mockjax({  
				url: 'Ajax/LoginFalse',  
				status: 200,  
				responseTime: 50,          
				responseText: {"Status":"Erro","Erro":"账号名或密码或验证码有误"}
			});   
			
		}
    </script>
  </body>
</html>
<script language="javascript">
		//登录
		$(document).ready(function(){
				
			$("#login").click(function(){
			var logins=$("#system").serialize();
			
				
				$.ajax({
					url:"<%=request.getContextPath()%>/Login1",
					data:logins,
					dataType:'json', 	
					type:"post",
					success:function(flag){
						
						if(flag==true){
							alert("登录成功");
							 location.href="<%=path%>/login"; 
						}else{
							alert("登录失败,请注册");
							$("#pp").html("用户名或密码错误");	
							}			
					}
				})
			});
			$("#wangji").click(function(){
					location.href="<%=request.getContextPath()%>/miaodi";
			});
	});
</script>